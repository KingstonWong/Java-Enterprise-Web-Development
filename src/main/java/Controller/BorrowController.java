package Controller;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

import AppDbContext.BorrowRecordApiClient;
import AppDbContext.BookApiClient;
import AppDbContext.MemberApiClient;
import AppDbContext.FineApiClient;
import Models.BorrowRecordDTO;
import Models.Member;
import Models.Book;

@WebServlet("/Borrow")
public class BorrowController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BorrowRecordApiClient borrowApiClient;
    private BookApiClient bookApiClient;
    private MemberApiClient memberApiClient;
    private FineApiClient fineApiClient;

    public void init(ServletConfig config) throws ServletException {
        borrowApiClient = new BorrowRecordApiClient();
        bookApiClient = new BookApiClient();
        memberApiClient = new MemberApiClient();
        fineApiClient = new FineApiClient();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        try {
            switch (action) {
                case "request":
                    requestBorrow(request, response);
                    break;
                case "pending":
                    listPending(request, response);
                    break;
                case "approve":
                    approveRequest(request, response);
                    break;
                case "showConfirmPickup":
                    showConfirmPickup(request, response);
                    break;
                case "pickup":
                    confirmPickup(request, response);
                    break;
                case "return":
                    returnBook(request, response);
                    break;
                case "history":
                    memberHistory(request, response);
                    break;
                case "active":
                    memberActiveLoans(request, response);
                    break;
                case "walkin":
                    showWalkInForm(request, response);
                    break;
                case "insertWalkin":
                    processWalkIn(request, response);
                    break;
                case "quickReturn":
                    showQuickReturnForm(request, response);
                    break;
                default:
                    listAll(request, response);
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

    private void listAll(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String search = request.getParameter("search");
        List<BorrowRecordDTO> listRecords;
        if (search != null && !search.trim().isEmpty()) {
            listRecords = borrowApiClient.searchRecords(search);
            request.setAttribute("searchQuery", search);
        } else {
            listRecords = borrowApiClient.getAllRecords();
        }
        request.setAttribute("listRecords", listRecords);
        request.getRequestDispatcher("BorrowList.jsp").forward(request, response);
    }

    private void listPending(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<BorrowRecordDTO> pending = borrowApiClient.getPendingRequests();
        request.setAttribute("pendingRequests", pending);
        request.getRequestDispatcher("PendingRequests.jsp").forward(request, response);
    }

    private void requestBorrow(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        HttpSession session = request.getSession();
        Member user = (Member) session.getAttribute("user");
        int bookId = Integer.parseInt(request.getParameter("book_id"));

        if (user != null) {
            borrowApiClient.memberRequest(user.getMember_id(), bookId);
            response.sendRedirect("Borrow?action=history");
        } else {
            response.sendRedirect("user-login");
        }
    }

    private void approveRequest(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int borrowId = Integer.parseInt(request.getParameter("id"));

        // Fetch record details before approving
        BorrowRecordDTO record = borrowApiClient.getBorrowRecord(borrowId);
        borrowApiClient.approveRequest(borrowId);

        String successMessage = "Request approved successfully!";
        if (record != null) {
            try {
                Member member = memberApiClient.getMemberById(record.getMember_id());
                if (member != null && member.getEmail() != null && !member.getEmail().isEmpty()) {
                    String bookLocation = record.getLocation();
                    if (bookLocation == null || bookLocation.isEmpty()) {
                        Book book = bookApiClient.getBookById(record.getBook_id());
                        bookLocation = (book != null && book.getLocation() != null && !book.getLocation().isEmpty())
                                ? book.getLocation()
                                : "Library Front Desk";
                    }

                    Services.EmailPickUpServices.sendPickupNotification(
                            member.getEmail(),
                            record.getMember_name(),
                            record.getBook_title(),
                            bookLocation);
                    System.out.println("Approval notification email sent to: " + member.getEmail());
                    successMessage = "Request approved! Email notification sent to member (" + member.getEmail() + ")";
                }
            } catch (Exception e) {
                System.err.println("Failed to send approval notification email: " + e.getMessage());
                e.printStackTrace();
            }
        }

        request.getSession().setAttribute("alertMessage", successMessage);
        request.getSession().setAttribute("alertType", "success");
        response.sendRedirect("Borrow?action=pending");
    }

    private void showConfirmPickup(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int borrowId = Integer.parseInt(request.getParameter("id"));
            BorrowRecordDTO record = borrowApiClient.getBorrowRecord(borrowId);
            if (record != null) {
                Member member = memberApiClient.getMemberById(record.getMember_id());
                Book book = bookApiClient.getBookById(record.getBook_id());

                request.setAttribute("record", record);
                request.setAttribute("member", member);
                request.setAttribute("book", book);
                request.getRequestDispatcher("ConfirmPickup.jsp").forward(request, response);
            } else {
                response.sendRedirect("Borrow?action=list");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Borrow?action=list");
        }
    }

    private void confirmPickup(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int borrowId = Integer.parseInt(request.getParameter("id"));
        boolean success = borrowApiClient.confirmPickup(borrowId);

        if (success) {
            request.getSession().setAttribute("alertMessage", "Pickup confirmed successfully!");
            request.getSession().setAttribute("alertType", "success");
        }

        response.sendRedirect("Borrow?action=list");
    }

    private void returnBook(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int borrowId = Integer.parseInt(request.getParameter("id"));

        // 1. Calculate and save fine first (if any)
        fineApiClient.calculateFine(borrowId);

        // 2. Mark as returned
        borrowApiClient.returnBook(borrowId);

        request.getSession().setAttribute("alertMessage", "You have return the book");
        request.getSession().setAttribute("alertType", "success");

        response.sendRedirect("Borrow?action=list");
    }

    private void memberHistory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Member user = (Member) session.getAttribute("user");
        if (user != null) {
            List<BorrowRecordDTO> history = borrowApiClient.getBorrowHistory(user.getMember_id());
            request.setAttribute("history", history);
            request.getRequestDispatcher("BorrowHistory.jsp").forward(request, response);
        } else {
            response.sendRedirect("user-login");
        }
    }

    private void memberActiveLoans(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Member user = (Member) session.getAttribute("user");
        if (user != null) {
            List<BorrowRecordDTO> active = borrowApiClient.getMemberActiveBorrows(user.getMember_id());
            request.setAttribute("activeLoans", active);
            request.getRequestDispatcher("ActiveLoans.jsp").forward(request, response);
        } else {
            response.sendRedirect("user-login");
        }
    }

    private void showWalkInForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Book> books = bookApiClient.getAllBooks();
        List<Member> members = memberApiClient.getAllMembers();
        request.setAttribute("books", books);
        request.setAttribute("members", members);
        request.getRequestDispatcher("BorrowForm.jsp").forward(request, response);
    }

    private void processWalkIn(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int bookId = Integer.parseInt(request.getParameter("book_id"));
        int memberId = Integer.parseInt(request.getParameter("member_id"));
        borrowApiClient.adminBorrow(bookId, memberId);
        response.sendRedirect("Borrow?action=list");
    }

    private void showQuickReturnForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam != null && !idParam.isEmpty()) {
            try {
                int borrowId = Integer.parseInt(idParam);
                BorrowRecordDTO record = borrowApiClient.getBorrowRecord(borrowId);
                if (record != null && "BORROWED".equalsIgnoreCase(record.getStatus())) {
                    request.setAttribute("previewRecord", record);

                    try {
                        Book book = bookApiClient.getBookById(record.getBook_id());
                        request.setAttribute("book", book);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                    // Calculate fines
                    if (record.getDue_date() != null) {
                        java.time.LocalDate dueDate = record.getDue_date().toLocalDate();
                        java.time.LocalDate today = java.time.LocalDate.now();

                        if (today.isAfter(dueDate)) {
                            long daysOverdue = java.time.temporal.ChronoUnit.DAYS.between(dueDate, today);
                            double fineAmount = daysOverdue * 1.0; // Match API DAILY_FINE
                            request.setAttribute("daysOverdue", daysOverdue);
                            request.setAttribute("fineAmount", fineAmount);
                        } else {
                            request.setAttribute("daysOverdue", 0L);
                            request.setAttribute("fineAmount", 0.0);
                        }
                    } else {
                        request.setAttribute("daysOverdue", 0L);
                        request.setAttribute("fineAmount", 0.0);
                    }
                } else if (record != null) {
                    request.setAttribute("error", "Record #" + idParam + " has status '" + record.getStatus()
                            + "'. Only BORROWED records can be returned.");
                } else {
                    request.setAttribute("error", "No borrow record found with ID: " + idParam
                            + ". Please check the record ID and try again.");
                }
            } catch (NumberFormatException e) {
                request.setAttribute("error",
                        "Invalid Record ID format: '" + idParam + "'. Please enter a numeric ID.");
            } catch (Exception e) {
                request.setAttribute("error", "System Error: " + e.getMessage());
                e.printStackTrace();
            }
        }
        request.getRequestDispatcher("QuickReturn.jsp").forward(request, response);
    }
}
