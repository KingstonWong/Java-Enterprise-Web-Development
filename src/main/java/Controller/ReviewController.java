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

import AppDbContext.BookReviewApiClient;
import AppDbContext.BookApiClient;
import Models.ReviewDTO;
import Models.Member;
import Models.Book;

@WebServlet("/Reviews")
public class ReviewController extends HttpServlet {
    private BookReviewApiClient reviewApiClient;
    private BookApiClient bookApiClient;

    public void init(ServletConfig config) throws ServletException {
        reviewApiClient = new BookReviewApiClient();
        bookApiClient = new BookApiClient();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("new".equals(action)) {
            showNewForm(request, response);
        } else {
            listReviews(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Member user = (Member) session.getAttribute("user");
        if (user == null || user.getToken() == null) {
            response.sendRedirect("user-login");
            return;
        }

        int bookId = Integer.parseInt(request.getParameter("book_id"));
        int rating = Integer.parseInt(request.getParameter("rating"));
        String comment = request.getParameter("comment");

        ReviewDTO review = new ReviewDTO();
        review.setBook_id(bookId);
        review.setRating(rating);
        review.setComment(comment);

        boolean success = reviewApiClient.addReview(review, user.getToken());
        if (success) {
            response.sendRedirect("Portal?action=bookDetail&id=" + bookId + "&reviewSuccess=true");
        } else {
            request.setAttribute("error", "Failed to add review. Make sure you have borrowed and returned this book.");
            request.setAttribute("book_id", bookId);

            // Always stay in the portal for member reviews
            request.getRequestDispatcher("portal/MemberWriteReview.jsp").forward(request, response);
        }
    }

    private void listReviews(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int bookId = Integer.parseInt(request.getParameter("book_id"));
        List<ReviewDTO> reviews = reviewApiClient.getReviewsByBook(bookId);
        request.setAttribute("reviews", reviews);
        // Usually forwarded as part of book details, but can be standalone if needed
        request.getRequestDispatcher("ReviewList.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bookIdStr = request.getParameter("book_id");
        if (bookIdStr == null || bookIdStr.isEmpty()) {
            response.sendRedirect("Portal?action=books");
            return;
        }

        int bookId = Integer.parseInt(bookIdStr);
        Book book = bookApiClient.getBookById(bookId);
        
        if (book == null) {
            response.sendRedirect("Portal?action=books");
            return;
        }

        // Check if user has already reviewed
        HttpSession session = request.getSession();
        Member user = (Member) session.getAttribute("user");
        boolean hasReviewed = false;
        
        if (user != null) {
            List<ReviewDTO> reviews = reviewApiClient.getReviewsByBook(bookId);
            for (ReviewDTO r : reviews) {
                if (r.getMemberName() != null && r.getMemberName().equals(user.getMember_name())) {
                    hasReviewed = true;
                    break;
                }
            }
        }

        request.setAttribute("book", book);
        request.setAttribute("book_id", bookId);
        request.setAttribute("hasReviewed", hasReviewed);
        request.getRequestDispatcher("portal/MemberWriteReview.jsp").forward(request, response);
    }
}
