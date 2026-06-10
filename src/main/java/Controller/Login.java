package Controller;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import Models.Member;

import java.io.IOException;

import AppDbContext.MemberApiClient;

@WebServlet("/user-login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MemberApiClient memberApiClient;

    public Login() {
        super();
    }

    public void init(ServletConfig config) throws ServletException {
        memberApiClient = new MemberApiClient();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("Login.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Member member = memberApiClient.login(email, password);
        if (member != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", member);
            session.setAttribute("role", "member");
            response.sendRedirect("Portal?action=home");
        } else {
            request.setAttribute("error", "Invalid email or password. Please try again.");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
    }
}
