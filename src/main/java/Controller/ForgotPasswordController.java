package Controller;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import AppDbContext.MemberApiClient;

@WebServlet("/forgot-password")
public class ForgotPasswordController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MemberApiClient memberApiClient;

    public void init(ServletConfig config) throws ServletException {
        memberApiClient = new MemberApiClient();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("ForgotPassword.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");

        if (email == null || email.trim().isEmpty()) {
            request.setAttribute("error", "Email is required.");
            request.getRequestDispatcher("ForgotPassword.jsp").forward(request, response);
            return;
        }

        String tempPassword = memberApiClient.forgotPassword(email);

        if (tempPassword != null) {
            try {
                Services.EmailServices.sendTemporaryPassword(email, tempPassword);
                request.setAttribute("success", "successfully send to your email, please check on your email.");
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error",
                        "Password reset successful, but we couldn't send the email. Please contact support.");
            }
            request.getRequestDispatcher("ForgotPassword.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "This email is not registered or an error occurred.");
            request.getRequestDispatcher("ForgotPassword.jsp").forward(request, response);
        }
    }
}
