package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Logout")
public class Logout extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String redirectTarget = "user-login";
        if (session != null) {
            String role = (String) session.getAttribute("role");
            if ("admin".equals(role)) {
                redirectTarget = "admin-login";
            }
            session.invalidate();
        }
        response.sendRedirect(redirectTarget);
    }
}
