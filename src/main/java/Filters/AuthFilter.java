package Filters;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class AuthFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization code if needed
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);
        String requestURI = httpRequest.getRequestURI();

        // 1. Set Cache-Control headers to prevent "Back" button access to sensitive
        // data after logout
        // This is applied to all requests to ensure consistency and security
        httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
        httpResponse.setHeader("Pragma", "no-cache"); // HTTP 1.0
        httpResponse.setDateHeader("Expires", 0); // Proxies

        // 2. Define Public Resources (Accessible without login)
        boolean isPublicPage = requestURI.endsWith("user-login") ||
                requestURI.endsWith("Login") ||
                requestURI.endsWith("admin-login") ||
                requestURI.endsWith("AdminLogin.jsp") ||
                requestURI.endsWith("Login.jsp") ||
                requestURI.endsWith("Register.jsp") ||
                requestURI.endsWith("Register") ||
                requestURI.endsWith("forgot-password") ||
                requestURI.endsWith("ForgotPassword.jsp") ||
                requestURI.endsWith("ForgotPasswordController") ||
                requestURI.endsWith("Landing.jsp") ||
                requestURI.equals(httpRequest.getContextPath() + "/") ||
                requestURI.contains("/static/") ||
                requestURI.contains("/css/") ||
                requestURI.contains("/js/") ||
                requestURI.contains("/images/") ||
                requestURI.endsWith("landing.css");

        // 3. Area Detection
        boolean isAdminArea = requestURI.contains("AdminDashboard") ||
                requestURI.contains("Index") ||
                requestURI.contains("Members") ||
                requestURI.contains("Books") ||
                requestURI.contains("Borrow") ||
                requestURI.contains("Fines");

        boolean isPortalArea = requestURI.contains("Portal") ||
                requestURI.contains("portal/");

        // 4. User & Role Validation
        boolean loggedIn = (session != null && session.getAttribute("user") != null);
        String role = (session != null) ? (String) session.getAttribute("role") : null;

        if (isPublicPage) {
            chain.doFilter(request, response);
            return;
        }

        if (loggedIn) {
            // Role-based Access Control
            if (isAdminArea && !"admin".equals(role)) {
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/user-login");
                return;
            }
            if (isPortalArea && !"member".equals(role)) {
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/admin-login");
                return;
            }
            chain.doFilter(request, response);
        } else {
            // Redirect to appropriate login page based on area
            if (isAdminArea) {
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/admin-login");
            } else {
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/user-login");
            }
        }
    }

    @Override
    public void destroy() {
        // Cleanup code if needed
    }
}
