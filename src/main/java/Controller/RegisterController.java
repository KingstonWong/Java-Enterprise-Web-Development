package Controller;

import java.io.IOException;
import Models.Member;
import AppDbContext.MemberApiClient;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Register")
public class RegisterController extends HttpServlet {
    private MemberApiClient memberApiClient = new MemberApiClient();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("member_name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone_number");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm_password");

        // Simple validation
        if (password == null || !password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match.");
            request.getRequestDispatcher("Register.jsp").forward(request, response);
            return;
        }

        // Check if email already exists
        if (memberApiClient.isEmailExists(email)) {
            request.setAttribute("error", "An account with this email already exists.");
            request.getRequestDispatcher("Register.jsp").forward(request, response);
            return;
        }

        Member newMember = new Member(0, null, name, phone, email, password);

        if (memberApiClient.register(newMember) != null) {
            response.sendRedirect("user-login?success=Account created successfully. Please log in.");
        } else {
            request.setAttribute("error", "Registration failed. Please try again later.");
            request.getRequestDispatcher("Register.jsp").forward(request, response);
        }
    }
}
