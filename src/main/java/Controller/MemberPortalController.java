package Controller;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import utils.QRCodeUtil;

import AppDbContext.BookApiClient;
import AppDbContext.BorrowRecordApiClient;
import AppDbContext.MemberApiClient;
import AppDbContext.FineApiClient;
import AppDbContext.BookReviewApiClient;
import Models.Book;
import Models.BorrowRecordDTO;
import Models.Member;
import Models.FineDTO;
import Models.ReviewDTO;

@WebServlet("/Portal")
public class MemberPortalController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookApiClient bookApiClient;
    private BorrowRecordApiClient borrowApiClient;
    private MemberApiClient memberApiClient;
    private FineApiClient fineApiClient;
    private BookReviewApiClient reviewApiClient;

    public void init(ServletConfig config) throws ServletException {
        bookApiClient = new BookApiClient();
        borrowApiClient = new BorrowRecordApiClient();
        memberApiClient = new MemberApiClient();
        fineApiClient = new FineApiClient();
        reviewApiClient = new BookReviewApiClient();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Member user = (session != null) ? (Member) session.getAttribute("user") : null;
        if (user == null) {
            response.sendRedirect("user-login");
            return;
        }

        String action = request.getParameter("action");
        if (action == null)
            action = "home";

        try {
            switch (action) {
                case "home":
                    showHome(request, response, user);
                    break;
                case "profile":
                    showProfile(request, response, user);
                    break;
                case "updateProfile":
                    showUpdateProfile(request, response, user);
                    break;
                case "doUpdateProfile":
                    doUpdateProfile(request, response, user);
                    break;
                case "changePassword":
                    showChangePassword(request, response, user);
                    break;
                case "doChangePassword":
                    doChangePassword(request, response, user);
                    break;
                case "dashboard":
                    showDashboard(request, response, user);
                    break;
                case "history":
                    showHistory(request, response, user);
                    break;
                case "requests":
                    showRequests(request, response, user);
                    break;
                case "loans":
                    showLoans(request, response, user);
                    break;
                case "fines":
                    showFines(request, response, user);
                    break;
                case "bookDetail":
                    showBookDetail(request, response, user);
                    break;
                case "writeReview":
                    showWriteReview(request, response, user);
                    break;
                case "requestBook":
                    requestBook(request, response, user);
                    break;
                case "cancelRequest":
                    cancelRequest(request, response, user);
                    break;
                default:
                    showHome(request, response, user);
                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    // ===== HOME =====
    private void showHome(HttpServletRequest request, HttpServletResponse response, Member user)
            throws ServletException, IOException {
        String search = request.getParameter("search");
        List<Book> books;
        if (search != null && !search.trim().isEmpty()) {
            books = bookApiClient.searchBooks(search);
            request.setAttribute("searchQuery", search);
        } else {
            books = bookApiClient.getAllBooks();
        }
        request.setAttribute("listBooks", books);

        List<BorrowRecordDTO> activeLoans = borrowApiClient.getMemberActiveBorrows(user.getMember_id());
        request.setAttribute("activeLoans", activeLoans != null ? activeLoans : new ArrayList<>());

        List<BorrowRecordDTO> allRecords = borrowApiClient.getRecordsByMember(user.getMember_id());
        request.setAttribute("memberRecords", allRecords != null ? allRecords : new ArrayList<>());

        // Calculate pending count
        long pendingCount = 0;
        if (allRecords != null) {
            pendingCount = allRecords.stream()
                    .filter(r -> "PENDING".equalsIgnoreCase(r.getStatus())
                            || "APPROVED".equalsIgnoreCase(r.getStatus()))
                    .count();
        }
        request.setAttribute("pendingCount", (int) pendingCount);

        // Calculate overdue count
        long overdueCount = 0;
        if (activeLoans != null) {
            java.time.LocalDate today = java.time.LocalDate.now();
            overdueCount = activeLoans.stream()
                    .filter(r -> r.getDue_date() != null && r.getDue_date().toLocalDate().isBefore(today))
                    .count();
        }
        request.setAttribute("overdueCount", (int) overdueCount);

        // Calculate fines balance
        double finesBalance = 0;
        List<FineDTO> allFines = fineApiClient.getAllFines();
        if (allFines != null && allRecords != null) {
            List<Integer> memberBorrowIds = allRecords.stream()
                    .map(BorrowRecordDTO::getBorrow_id)
                    .collect(Collectors.toList());
            finesBalance = allFines.stream()
                    .filter(f -> memberBorrowIds.contains(f.getBorrow_id()) && "Unpaid".equalsIgnoreCase(f.getStatus()))
                    .mapToDouble(FineDTO::getAmount)
                    .sum();
        }

        // Add potential fines to balance
        List<FineDTO> potentialFines = calculatePotentialFines(activeLoans, user);
        finesBalance += potentialFines.stream().mapToDouble(FineDTO::getAmount).sum();

        request.setAttribute("finesBalance", finesBalance);

        request.getRequestDispatcher("portal/MemberHome.jsp").forward(request, response);
    }

    // ===== PROFILE =====
    private void showProfile(HttpServletRequest request, HttpServletResponse response, Member user)
            throws ServletException, IOException {
        Member member = memberApiClient.getMemberById(user.getMember_id());
        request.setAttribute("member", member != null ? member : user);

        List<BorrowRecordDTO> activeLoans = borrowApiClient.getMemberActiveBorrows(user.getMember_id());
        request.setAttribute("activeLoansCount", activeLoans != null ? activeLoans.size() : 0);

        List<BorrowRecordDTO> allRecords = borrowApiClient.getRecordsByMember(user.getMember_id());
        long pendingCount = 0;
        long historyCount = 0;
        if (allRecords != null) {
            pendingCount = allRecords.stream()
                    .filter(r -> "PENDING".equalsIgnoreCase(r.getStatus())
                            || "APPROVED".equalsIgnoreCase(r.getStatus()))
                    .count();
            historyCount = allRecords.stream()
                    .filter(r -> "RETURNED".equalsIgnoreCase(r.getStatus()))
                    .count();
        }
        request.setAttribute("pendingCount", (int) pendingCount);
        request.setAttribute("historyCount", (int) historyCount);

        try {
            String qrText = member != null ? member.getMembership_id() : user.getMembership_id();
            String qrCodeBase64 = QRCodeUtil.generateQRCodeBase64(qrText, 200, 200);
            request.setAttribute("qrCodeBase64", qrCodeBase64);
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("portal/MemberProfile.jsp").forward(request, response);
    }

    // ===== UPDATE PROFILE =====
    private void showUpdateProfile(HttpServletRequest request, HttpServletResponse response, Member user)
            throws ServletException, IOException {
        Member member = memberApiClient.getMemberById(user.getMember_id());
        request.setAttribute("member", member != null ? member : user);
        request.getRequestDispatcher("portal/UpdateProfile.jsp").forward(request, response);
    }

    private void doUpdateProfile(HttpServletRequest request, HttpServletResponse response, Member user)
            throws IOException {
        String name = request.getParameter("member_name");
        String phone = request.getParameter("phone_number");
        String email = request.getParameter("email");

        Member updated = new Member(user.getMember_id(), user.getMembership_id(), name, phone, email,
                user.getPassword());
        boolean success = memberApiClient.updateProfile(updated);

        if (success) {
            // Update session
            updated.setToken(user.getToken());
            request.getSession().setAttribute("user", updated);
            request.getSession().setAttribute("alertMessage", "Profile updated successfully!");
            request.getSession().setAttribute("alertType", "success");
        } else {
            request.getSession().setAttribute("alertMessage", "Failed to update profile. Please try again.");
            request.getSession().setAttribute("alertType", "error");
        }
        response.sendRedirect("Portal?action=profile");
    }

    // ===== CHANGE PASSWORD =====
    private void showChangePassword(HttpServletRequest request, HttpServletResponse response, Member user)
            throws ServletException, IOException {
        request.getRequestDispatcher("portal/ChangePassword.jsp").forward(request, response);
    }

    private void doChangePassword(HttpServletRequest request, HttpServletResponse response, Member user)
            throws IOException {
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");

        // Use the API's change-password endpoint which verifies the old password
        // server-side
        String result = memberApiClient.changePassword(user.getMember_id(), currentPassword, newPassword);

        if ("success".equals(result)) {
            request.getSession().setAttribute("alertMessage", "Password changed successfully!");
            request.getSession().setAttribute("alertType", "success");
            response.sendRedirect("Portal?action=profile");
        } else {
            String errorMsg = result.contains("incorrect") ? "Incorrect current password!"
                    : "Failed to change password. Please try again.";
            request.getSession().setAttribute("alertMessage", errorMsg);
            request.getSession().setAttribute("alertType", "error");
            response.sendRedirect("Portal?action=changePassword");
        }
    }

    // ===== BORROWING DASHBOARD =====
    private void showDashboard(HttpServletRequest request, HttpServletResponse response, Member user)
            throws ServletException, IOException {
        List<BorrowRecordDTO> activeLoans = borrowApiClient.getMemberActiveBorrows(user.getMember_id());
        List<BorrowRecordDTO> allRecords = borrowApiClient.getRecordsByMember(user.getMember_id());
        List<BorrowRecordDTO> history = borrowApiClient.getBorrowHistory(user.getMember_id());

        populateCovers(activeLoans);
        populateCovers(allRecords);
        populateCovers(history);

        request.setAttribute("activeLoans", activeLoans != null ? activeLoans : new ArrayList<>());
        request.setAttribute("allRecords", allRecords != null ? allRecords : new ArrayList<>());
        request.setAttribute("history", history != null ? history : new ArrayList<>());

        List<BorrowRecordDTO> recentActivity = new ArrayList<>();
        if (allRecords != null) {
            recentActivity.addAll(allRecords);
            recentActivity.sort((r1, r2) -> {
                java.util.Date d1 = r1.getReturn_date() != null ? r1.getReturn_date()
                        : (r1.getPickup_date() != null ? r1.getPickup_date()
                                : (r1.getApproval_date() != null ? r1.getApproval_date() : r1.getRequest_date()));
                java.util.Date d2 = r2.getReturn_date() != null ? r2.getReturn_date()
                        : (r2.getPickup_date() != null ? r2.getPickup_date()
                                : (r2.getApproval_date() != null ? r2.getApproval_date() : r2.getRequest_date()));

                if (d1 == null && d2 == null)
                    return Integer.compare(r2.getBorrow_id(), r1.getBorrow_id());
                if (d1 == null)
                    return 1;
                if (d2 == null)
                    return -1;
                int cmp = d2.compareTo(d1);
                return cmp != 0 ? cmp : Integer.compare(r2.getBorrow_id(), r1.getBorrow_id());
            });
        }
        request.setAttribute("recentActivity", recentActivity);

        // Pending count
        long pendingCount = 0;
        if (allRecords != null) {
            pendingCount = allRecords.stream()
                    .filter(r -> "PENDING".equalsIgnoreCase(r.getStatus())
                            || "APPROVED".equalsIgnoreCase(r.getStatus()))
                    .count();
        }
        request.setAttribute("pendingCount", (int) pendingCount);

        // Overdue count
        long overdueCount = 0;
        if (activeLoans != null) {
            java.time.LocalDate today = java.time.LocalDate.now();
            overdueCount = activeLoans.stream()
                    .filter(r -> r.getDue_date() != null && r.getDue_date().toLocalDate().isBefore(today))
                    .count();
        }
        request.setAttribute("overdueCount", (int) overdueCount);

        // Fines
        double finesBalance = 0;
        List<FineDTO> allFines = fineApiClient.getAllFines();
        if (allFines != null && allRecords != null) {
            List<Integer> memberBorrowIds = allRecords.stream()
                    .map(BorrowRecordDTO::getBorrow_id)
                    .collect(Collectors.toList());
            finesBalance = allFines.stream()
                    .filter(f -> memberBorrowIds.contains(f.getBorrow_id()) && "Unpaid".equalsIgnoreCase(f.getStatus()))
                    .mapToDouble(FineDTO::getAmount)
                    .sum();
        }

        // Add potential fines to dashboard balance
        List<FineDTO> potentialFines = calculatePotentialFines(activeLoans, user);
        finesBalance += potentialFines.stream().mapToDouble(FineDTO::getAmount).sum();

        request.setAttribute("finesBalance", finesBalance);

        // Identify reviewed books
        java.util.Set<Integer> reviewedBookIds = new java.util.HashSet<>();
        if (history != null) {
            for (BorrowRecordDTO rec : history) {
                List<ReviewDTO> bReviews = reviewApiClient.getReviewsByBook(rec.getBook_id());
                if (bReviews != null && bReviews.stream()
                        .anyMatch(rv -> user.getMember_name().equalsIgnoreCase(rv.getMemberName()))) {
                    reviewedBookIds.add(rec.getBook_id());
                }
            }
        }
        request.setAttribute("reviewedBookIds", reviewedBookIds);

        request.getRequestDispatcher("portal/BorrowingDashboard.jsp").forward(request, response);
    }

    // ===== HISTORY =====
    private void showHistory(HttpServletRequest request, HttpServletResponse response, Member user)
            throws ServletException, IOException {
        List<BorrowRecordDTO> history = borrowApiClient.getRecordsByMember(user.getMember_id());
        populateCovers(history);

        // Identify reviewed books
        java.util.Set<Integer> reviewedBookIds = new java.util.HashSet<>();
        if (history != null) {
            for (BorrowRecordDTO rec : history) {
                List<ReviewDTO> bReviews = reviewApiClient.getReviewsByBook(rec.getBook_id());
                if (bReviews != null && bReviews.stream()
                        .anyMatch(rv -> user.getMember_name().equalsIgnoreCase(rv.getMemberName()))) {
                    reviewedBookIds.add(rec.getBook_id());
                }
            }
        }

        request.setAttribute("history", history != null ? history : new ArrayList<>());
        request.setAttribute("reviewedBookIds", reviewedBookIds);
        request.getRequestDispatcher("portal/BorrowingHistory.jsp").forward(request, response);
    }

    // ===== PENDING REQUESTS =====
    private void showRequests(HttpServletRequest request, HttpServletResponse response, Member user)
            throws ServletException, IOException {
        List<BorrowRecordDTO> allRecords = borrowApiClient.getRecordsByMember(user.getMember_id());
        List<BorrowRecordDTO> pending = new ArrayList<>();
        if (allRecords != null) {
            pending = allRecords.stream()
                    .filter(r -> "PENDING".equalsIgnoreCase(r.getStatus())
                            || "APPROVED".equalsIgnoreCase(r.getStatus()))
                    .collect(Collectors.toList());
        }
        populateCovers(pending);
        request.setAttribute("pendingRequests", pending);
        request.getRequestDispatcher("portal/MemberPendingRequests.jsp").forward(request, response);
    }

    // ===== CURRENT LOANS =====
    private void showLoans(HttpServletRequest request, HttpServletResponse response, Member user)
            throws ServletException, IOException {
        List<BorrowRecordDTO> activeLoans = borrowApiClient.getMemberActiveBorrows(user.getMember_id());
        populateCovers(activeLoans);
        request.setAttribute("activeLoans", activeLoans != null ? activeLoans : new ArrayList<>());
        request.getRequestDispatcher("portal/CurrentLoans.jsp").forward(request, response);
    }

    // ===== FINES =====
    private void showFines(HttpServletRequest request, HttpServletResponse response, Member user)
            throws ServletException, IOException {
        List<BorrowRecordDTO> allRecords = borrowApiClient.getRecordsByMember(user.getMember_id());
        List<FineDTO> allFines = fineApiClient.getAllFines();
        List<FineDTO> memberFines = new ArrayList<>();

        if (allFines != null && allRecords != null) {
            List<Integer> memberBorrowIds = allRecords.stream()
                    .map(BorrowRecordDTO::getBorrow_id)
                    .collect(Collectors.toList());
            memberFines = allFines.stream()
                    .filter(f -> memberBorrowIds.contains(f.getBorrow_id()))
                    .collect(Collectors.toList());
        }

        // Include potential fines for currently overdue books
        List<BorrowRecordDTO> activeLoans = borrowApiClient.getMemberActiveBorrows(user.getMember_id());
        List<FineDTO> potentialFines = calculatePotentialFines(activeLoans, user);
        memberFines.addAll(0, potentialFines); // Show estimated fines at the top

        request.setAttribute("memberFines", memberFines);

        double totalBalance = memberFines.stream()
                .filter(f -> "Unpaid".equalsIgnoreCase(f.getStatus())
                        || "Pending (Estimated)".equalsIgnoreCase(f.getStatus()))
                .mapToDouble(FineDTO::getAmount)
                .sum();
        request.setAttribute("totalBalance", totalBalance);

        request.getRequestDispatcher("portal/FinesFees.jsp").forward(request, response);
    }

    // ===== BOOK DETAIL =====
    private void showBookDetail(HttpServletRequest request, HttpServletResponse response, Member user)
            throws ServletException, IOException {
        int bookId = Integer.parseInt(request.getParameter("id"));
        Book book = bookApiClient.getBookById(bookId);
        List<ReviewDTO> reviews = reviewApiClient.getReviewsByBook(bookId);

        String reviewSuccess = request.getParameter("reviewSuccess");
        request.setAttribute("book", book);
        request.setAttribute("reviews", reviews != null ? reviews : new ArrayList<>());
        request.setAttribute("reviewSuccess", reviewSuccess);
        request.getRequestDispatcher("portal/BookDetails.jsp").forward(request, response);
    }

    // ===== WRITE REVIEW =====
    private void showWriteReview(HttpServletRequest request, HttpServletResponse response, Member user)
            throws ServletException, IOException {
        int bookId = Integer.parseInt(request.getParameter("book_id"));
        Book book = bookApiClient.getBookById(bookId);
        List<ReviewDTO> reviews = reviewApiClient.getReviewsByBook(bookId);

        boolean hasReviewed = false;
        if (reviews != null && user != null) {
            String currentMemberName = user.getMember_name();
            hasReviewed = reviews.stream().anyMatch(r -> currentMemberName.equalsIgnoreCase(r.getMemberName()));
        }

        request.setAttribute("book", book);
        request.setAttribute("book_id", bookId);
        request.setAttribute("hasReviewed", hasReviewed);
        request.getRequestDispatcher("portal/MemberWriteReview.jsp").forward(request, response);
    }

    // ===== REQUEST BOOK =====
    private void requestBook(HttpServletRequest request, HttpServletResponse response, Member user)
            throws IOException {
        int bookId = Integer.parseInt(request.getParameter("book_id"));
        borrowApiClient.memberRequest(user.getMember_id(), bookId);
        request.getSession().setAttribute("alertMessage", "Book request submitted successfully!");
        request.getSession().setAttribute("alertType", "success");
        response.sendRedirect("Portal?action=requests");
    }

    // ===== CANCEL REQUEST =====
    private void cancelRequest(HttpServletRequest request, HttpServletResponse response, Member user)
            throws IOException {
        int borrowId = Integer.parseInt(request.getParameter("id"));
        borrowApiClient.deleteRecord(borrowId);
        request.getSession().setAttribute("alertMessage", "Request cancelled.");
        request.getSession().setAttribute("alertType", "success");
        response.sendRedirect("Portal?action=requests");
    }

    // ===== HELPER: POPULATE COVERS =====
    private void populateCovers(List<BorrowRecordDTO> records) {
        if (records == null || records.isEmpty())
            return;

        // Collect all unique book IDs
        List<Integer> bookIds = records.stream()
                .map(BorrowRecordDTO::getBook_id)
                .distinct()
                .collect(Collectors.toList());

        // Fetch books to get covers (simple mapping for now, ideally batch fetch)
        java.util.Map<Integer, String> coverMap = new java.util.HashMap<>();
        for (Integer id : bookIds) {
            Book b = bookApiClient.getBookById(id);
            if (b != null) {
                coverMap.put(id, b.getCover_image());
            }
        }

        // Set covers back to records
        for (BorrowRecordDTO r : records) {
            r.setCoverImage(coverMap.get(r.getBook_id()));
        }
    }

    // ===== HELPER: CALCULATE POTENTIAL FINES =====
    private List<FineDTO> calculatePotentialFines(List<BorrowRecordDTO> activeLoans, Member user) {
        List<FineDTO> potentialFines = new ArrayList<>();
        if (activeLoans == null)
            return potentialFines;

        java.time.LocalDate today = java.time.LocalDate.now();
        for (BorrowRecordDTO record : activeLoans) {
            if (record.getDue_date() != null) {
                java.time.LocalDate dueDate = record.getDue_date().toLocalDate();
                if (today.isAfter(dueDate)) {
                    long daysOverdue = java.time.temporal.ChronoUnit.DAYS.between(dueDate, today);
                    FineDTO fine = new FineDTO();
                    fine.setFine_id(0); // Dummy ID for UI
                    fine.setBorrow_id(record.getBorrow_id());
                    fine.setMemberName(user.getMember_name());
                    fine.setAmount(daysOverdue * 1.0); // Match API rate
                    fine.setStatus("Pending (Estimated)");
                    fine.setDueDate(dueDate.toString());
                    fine.setReturnDate("-");
                    fine.setOverdueDays((int) daysOverdue);
                    potentialFines.add(fine);
                }
            }
        }
        return potentialFines;
    }
}
