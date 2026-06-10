package Services;

import jakarta.mail.*;
import jakarta.mail.internet.*;
import java.util.Properties;

public class EmailServices {

    private static final String FROM_EMAIL = "wong.brandon111@gmail.com";
    private static final String APP_PASSWORD = "xzaetmkcpuqscrqd"; // move to env later

    public static void sendTemporaryPassword(String toEmail, String tempPassword)
            throws MessagingException {

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props,
                new Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(FROM_EMAIL, APP_PASSWORD);
                    }
                });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(FROM_EMAIL));
        message.setRecipients(
                Message.RecipientType.TO,
                InternetAddress.parse(toEmail));

        message.setSubject("Library System – Password Reset Request");

        // Modern HTML Content
        String htmlContent = "<div style=\"font-family: 'Segoe UI', Arial, sans-serif; max-width: 600px; margin: 0 auto; padding: 40px; border: 1px solid #e1e4e8; border-radius: 16px; background-color: #ffffff;\">"
                +
                "  <div style=\"text-align: center; margin-bottom: 32px;\">" +
                "    <div style=\"display: inline-flex; align-items: center; justify-content: center; width: 64px; height: 64px; background: linear-gradient(135deg, #1877f2 0%, #0056b3 100%); border-radius: 16px; margin-bottom: 16px;\">"
                +
                "      <span style=\"color: white; font-size: 32px; font-weight: bold;\">L</span>" +
                "    </div>" +
                "    <h1 style=\"color: #1c1e21; font-size: 24px; font-weight: 800; margin: 0; letter-spacing: -0.02em;\">Library System</h1>"
                +
                "  </div>" +
                "  " +
                "  <div style=\"color: #4b5563; line-height: 1.6; font-size: 16px;\">" +
                "    <p>Hello,</p>" +
                "    <p>We received a request to reset your password. Use the temporary password below to sign in to your account.</p>"
                +
                "    " +
                "    <div style=\"background-color: #f0f7ff; border: 2px dashed #1877f2; border-radius: 12px; padding: 24px; text-align: center; margin: 32px 0;\">"
                +
                "      <span style=\"display: block; color: #65676b; font-size: 14px; text-transform: uppercase; letter-spacing: 0.1em; font-weight: 700; margin-bottom: 8px;\">Temporary Password</span>"
                +
                "      <span style=\"font-family: 'Courier New', Courier, monospace; font-size: 32px; font-weight: 800; color: #1877f2; letter-spacing: 4px;\">"
                + tempPassword + "</span>" +
                "    </div>" +
                "    " +
                "    <p style=\"margin-top: 32px;\"><strong>Security Reminder:</strong> For your security, please change this password immediately after logging in.</p>"
                +
                "    " +
                "    <p style=\"font-size: 14px; color: #65676b; margin-top: 40px; border-top: 1px solid #f0f2f5; padding-top: 24px;\">"
                +
                "      If you did not request this, you can safely ignore this email. Your password will not change until you use this temporary one to log in."
                +
                "    </p>" +
                "  </div>" +
                "  " +
                "  <div style=\"text-align: center; margin-top: 40px; color: #9ca3af; font-size: 12px;\">" +
                "    &copy; 2026 Library Management System. All rights reserved." +
                "  </div>" +
                "</div>";

        message.setContent(htmlContent, "text/html; charset=utf-8");

        Transport.send(message);
    }
}
