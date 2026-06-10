package Services;

import java.util.Properties;
import jakarta.mail.*;
import jakarta.mail.internet.*;

public class EmailPickUpServices {

    private static final String FROM_EMAIL = "wong.brandon111@gmail.com";
    private static final String APP_PASSWORD = "xzaetmkcpuqscrqd"; // move to env later

    public static void sendPickupNotification(
            String toEmail,
            String memberName,
            String bookTitle,
            String bookLocation) throws MessagingException {

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

        message.setSubject("Library System \u2013 Book Ready for Pickup");
        message.setSubject("Library System \u2013 Book Ready for Pickup");

        // Modern HTML Content
        String htmlContent = "<div style=\"font-family: 'Segoe UI', Arial, sans-serif; max-width: 600px; margin: 0 auto; padding: 40px; border: 1px solid #e1e4e8; border-radius: 16px; background-color: #ffffff;\">"
                + "  <div style=\"text-align: center; margin-bottom: 32px;\">"
                + "    <div style=\"display: inline-flex; align-items: center; justify-content: center; width: 64px; height: 64px; background: linear-gradient(135deg, #1877f2 0%, #0056b3 100%); border-radius: 16px; margin-bottom: 16px;\">"
                + "      <span style=\"color: white; font-size: 32px; font-weight: bold;\">L</span>"
                + "    </div>"
                + "    <h1 style=\"color: #1c1e21; font-size: 24px; font-weight: 800; margin: 0; letter-spacing: -0.02em;\">Ready for Pickup</h1>"
                + "  </div>"
                + "  <div style=\"color: #4b5563; line-height: 1.6; font-size: 16px;\">"
                + "    <p>Hello <strong>" + memberName + "</strong>,</p>"
                + "    <p>Good news! The book you requested is now processed and ready for you to collect.</p>"
                + "    <div style=\"background-color: #f0fdf4; border: 2px dashed #10b981; border-radius: 12px; padding: 24px; margin: 32px 0;\">"
                + "      <div style=\"margin-bottom: 16px;\">"
                + "        <span style=\"display: block; color: #65676b; font-size: 14px; text-transform: uppercase; letter-spacing: 0.1em; font-weight: 700; margin-bottom: 4px;\">Book Title</span>"
                + "        <span style=\"font-size: 18px; font-weight: 700; color: #1c1e21;\">" + bookTitle + "</span>"
                + "      </div>"
                + "      <div>"
                + "        <span style=\"display: block; color: #65676b; font-size: 14px; text-transform: uppercase; letter-spacing: 0.1em; font-weight: 700; margin-bottom: 4px;\">Pickup Location</span>"
                + "        <span style=\"font-size: 16px; font-weight: 600; color: #047857;\">" + bookLocation
                + "</span>"
                + "      </div>"
                + "    </div>"
                + "    <p style=\"margin-top: 32px;\">Please collect your book during normal library operating hours. If you no longer need this book, please inform the library staff.</p>"
                + "    <p style=\"font-size: 14px; color: #65676b; margin-top: 40px; border-top: 1px solid #f0f2f5; padding-top: 24px;\">"
                + "      This is an automated message. Please do not reply directly to this email."
                + "    </p>"
                + "  </div>"
                + "  <div style=\"text-align: center; margin-top: 40px; color: #9ca3af; font-size: 12px;\">"
                + "    &copy; 2026 Library Management System. All rights reserved."
                + "  </div>"
                + "</div>";

        message.setContent(htmlContent, "text/html; charset=utf-8");

        Transport.send(message);
    }
}
