package Controller;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import AppDbContext.MemberApiClient;
import Models.Member;

@WebServlet("/admin-login")
public class AdminLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private MemberApiClient memberApiClient;

    public void init(ServletConfig config) throws ServletException {
        memberApiClient = new MemberApiClient();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("AdminLogin.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // First, check if the email is the specific admin email
        if ("admin@gmail.com".equals(email)) {
            // Verify password via API
            Member member = memberApiClient.login(email, password);
            if (member != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", member); // Storing the full Member object
                session.setAttribute("role", "admin");
                response.sendRedirect("Index");
            } else {
                request.setAttribute("error", "Invalid admin password.");
                request.getRequestDispatcher("AdminLogin.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("error", "Invalid admin credentials. Only admin credentials is allowed.");
            request.getRequestDispatcher("AdminLogin.jsp").forward(request, response);
        }
    }
}
