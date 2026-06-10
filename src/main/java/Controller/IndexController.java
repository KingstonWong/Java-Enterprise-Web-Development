package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import AppDbContext.*;
import Models.*;

@WebServlet("/Index")
public class IndexController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String role = (session != null) ? (String) session.getAttribute("role") : null;
        Object user = (session != null) ? session.getAttribute("user") : null;

        System.out.println("Dashboard Access - User: " + user + ", Role: " + role);

        if (session == null || user == null) {
            response.sendRedirect("user-login");
        } else {
            if ("admin".equals(role)) {
                request.setAttribute("isAdmin", true);

                MemberApiClient memberApi = new MemberApiClient();
                BorrowRecordApiClient borrowApi = new BorrowRecordApiClient();

                int totalMembers = 0;
                List<Member> members = memberApi.getAllMembers();
                if (members != null) {
                    totalMembers = members.size();
                }
                System.out.println("Dashboard Debug - Total Members: " + totalMembers);

                long booksLent = 0;
                List<BorrowRecordDTO> records = borrowApi.getAllRecords();
                if (records != null) {
                    booksLent = records.stream()
                            .filter(r -> "BORROWED".equalsIgnoreCase(r.getStatus()))
                            .count();
                    System.out.println("Dashboard Debug - Total Records: " + records.size() + ", Lent: " + booksLent);
                }

                long overdueCount = 0;
                if (records != null) {
                    java.time.LocalDate today = java.time.LocalDate.now();
                    overdueCount = records.stream()
                            .filter(r -> "BORROWED".equalsIgnoreCase(r.getStatus()) && 
                                        r.getDue_date() != null && 
                                        today.isAfter(r.getDue_date().toLocalDate()))
                            .count();
                    System.out.println("Dashboard Debug - Overdue Count (Borrowed & Past Due): " + overdueCount);
                }

                request.setAttribute("totalMembers", totalMembers);
                request.setAttribute("booksLent", (int) booksLent);
                request.setAttribute("overdueCount", (int) overdueCount);
            }
            request.getRequestDispatcher("AdminDashboard.jsp").forward(request, response);
        }
    }
}
