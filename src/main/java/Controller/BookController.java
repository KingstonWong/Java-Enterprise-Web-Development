package Controller;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.util.Base64;
import java.io.IOException;
import java.util.List;

import AppDbContext.BookApiClient;
import AppDbContext.BookReviewApiClient;
import Models.Book;
import Models.ReviewDTO;

@MultipartConfig
@WebServlet("/Books")
public class BookController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookApiClient bookApiClient;
    private BookReviewApiClient reviewApiClient;

    public void init(ServletConfig config) throws ServletException {
        bookApiClient = new BookApiClient();
        reviewApiClient = new BookReviewApiClient();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        try {
            switch (action) {
                case "new":
                    showNewForm(request, response);
                    break;
                case "insert":
                    insertBook(request, response);
                    break;
                case "delete":
                    deleteBook(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "update":
                    updateBook(request, response);
                    break;
                case "view":
                    viewBook(request, response);
                    break;
                default:
                    listBooks(request, response);
                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private void listBooks(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchQuery = request.getParameter("search");
        List<Book> listBooks;
        if (searchQuery != null && !searchQuery.trim().isEmpty()) {
            listBooks = bookApiClient.searchBooks(searchQuery);
            request.setAttribute("searchQuery", searchQuery);
        } else {
            listBooks = bookApiClient.getAllBooks();
        }
        request.setAttribute("listBooks", listBooks);
        request.getRequestDispatcher("BookList.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("BookForm.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Book existingBook = bookApiClient.getBookById(id);
        request.setAttribute("book", existingBook);
        request.getRequestDispatcher("BookForm.jsp").forward(request, response);
    }

    private void insertBook(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String isbn = request.getParameter("isbn");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String author = request.getParameter("author");
        String category = request.getParameter("category");
        int totalCopies = Integer.parseInt(request.getParameter("total_copies"));
        int availableCopies = totalCopies; // Initialize available copies to total copies for new books
        String location = request.getParameter("location");
        int pubYear = Integer.parseInt(request.getParameter("publication_year"));
        String publisher = request.getParameter("publisher");

        String coverImageBase64 = null;
        try {
            Part filePart = request.getPart("cover_image_file");
            if (filePart != null && filePart.getSize() > 0) {
                try (InputStream inputStream = filePart.getInputStream();
                        java.io.ByteArrayOutputStream buffer = new java.io.ByteArrayOutputStream()) {
                    int nRead;
                    byte[] data = new byte[16384];
                    while ((nRead = inputStream.read(data, 0, data.length)) != -1) {
                        buffer.write(data, 0, nRead);
                    }
                    byte[] bytes = buffer.toByteArray();
                    coverImageBase64 = "data:" + filePart.getContentType() + ";base64,"
                            + Base64.getEncoder().encodeToString(bytes);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        Book newBook = new Book(0, isbn, title, description, author, category, totalCopies, availableCopies, location,
                pubYear, publisher, coverImageBase64);
        bookApiClient.insertBook(newBook);
        response.sendRedirect("Books?action=list");
    }

    private void updateBook(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String isbn = request.getParameter("isbn");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String author = request.getParameter("author");
        String category = request.getParameter("category");
        int totalCopies = Integer.parseInt(request.getParameter("total_copies"));
        int availableCopies = Integer.parseInt(request.getParameter("available_copies"));
        String location = request.getParameter("location");
        int pubYear = Integer.parseInt(request.getParameter("publication_year"));
        String publisher = request.getParameter("publisher");

        String coverImageBase64 = request.getParameter("existing_cover_image");
        try {
            // Fallback for large multipart fields if getParameter returns null or empty
            if (coverImageBase64 == null || coverImageBase64.isEmpty()) {
                Part existingPart = request.getPart("existing_cover_image");
                if (existingPart != null) {
                    try (InputStream is = existingPart.getInputStream();
                            java.io.ByteArrayOutputStream baos = new java.io.ByteArrayOutputStream()) {
                        byte[] buf = new byte[8192];
                        int read;
                        while ((read = is.read(buf)) != -1) {
                            baos.write(buf, 0, read);
                        }
                        coverImageBase64 = baos.toString("UTF-8");
                    }
                }
            }

            Part filePart = request.getPart("cover_image_file");
            if (filePart != null && filePart.getSize() > 0) {
                try (InputStream inputStream = filePart.getInputStream();
                        java.io.ByteArrayOutputStream buffer = new java.io.ByteArrayOutputStream()) {
                    int nRead;
                    byte[] data = new byte[16384];
                    while ((nRead = inputStream.read(data, 0, data.length)) != -1) {
                        buffer.write(data, 0, nRead);
                    }
                    byte[] bytes = buffer.toByteArray();
                    coverImageBase64 = "data:" + filePart.getContentType() + ";base64,"
                            + Base64.getEncoder().encodeToString(bytes);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        Book book = new Book(id, isbn, title, description, author, category, totalCopies, availableCopies, location,
                pubYear, publisher, coverImageBase64);
        bookApiClient.updateBook(book);
        response.sendRedirect("Books?action=list");
    }

    private void deleteBook(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        boolean success = bookApiClient.deleteBook(id);

        if (success) {
            request.getSession().setAttribute("alertMessage", "Book deleted successfully!");
            request.getSession().setAttribute("alertType", "success");
        } else {
            request.getSession().setAttribute("alertMessage", "Cannot delete book. It is currently borrowed.");
            request.getSession().setAttribute("alertType", "error");
        }

        response.sendRedirect("Books?action=list");
    }

    private void viewBook(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Book book = bookApiClient.getBookById(id);
        List<ReviewDTO> reviews = reviewApiClient.getReviewsByBook(id);

        request.setAttribute("book", book);
        request.setAttribute("reviews", reviews != null ? reviews : new java.util.ArrayList<>());
        request.getRequestDispatcher("AdminBookDetails.jsp").forward(request, response);
    }
}
