package AppDbContext;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import Models.Book;

public class BookApiClient {
    private final String BASE_URL = "http://localhost:5030/api/books";
    private final Gson gson = new Gson();

    public List<Book> getAllBooks() {
        try {
            URL url = new URL(BASE_URL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            if (conn.getResponseCode() == HttpURLConnection.HTTP_OK) {
                try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"))) {
                    StringBuilder response = new StringBuilder();
                    String responseLine;
                    while ((responseLine = br.readLine()) != null) {
                        response.append(responseLine.trim());
                    }
                    return gson.fromJson(response.toString(), new TypeToken<List<Book>>() {
                    }.getType());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ArrayList<>();
    }

    public Book getBookById(int id) {
        try {
            URL url = new URL(BASE_URL + "/" + id);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            if (conn.getResponseCode() == HttpURLConnection.HTTP_OK) {
                try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"))) {
                    StringBuilder response = new StringBuilder();
                    String responseLine;
                    while ((responseLine = br.readLine()) != null) {
                        response.append(responseLine.trim());
                    }
                    return gson.fromJson(response.toString(), Book.class);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean insertBook(Book book) {
        try {
            URL url = new URL(BASE_URL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setDoOutput(true);

            String jsonInputString = gson.toJson(book);

            try (OutputStream os = conn.getOutputStream()) {
                byte[] input = jsonInputString.getBytes("utf-8");
                os.write(input, 0, input.length);
            }

            return conn.getResponseCode() == HttpURLConnection.HTTP_OK
                    || conn.getResponseCode() == HttpURLConnection.HTTP_CREATED;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateBook(Book book) {
        try {
            URL url = new URL(BASE_URL + "/" + book.getBook_id());
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("PUT");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setDoOutput(true);

            String jsonInputString = gson.toJson(book);

            try (OutputStream os = conn.getOutputStream()) {
                byte[] input = jsonInputString.getBytes("utf-8");
                os.write(input, 0, input.length);
            }

            return conn.getResponseCode() == HttpURLConnection.HTTP_OK;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteBook(int id) {
        try {
            URL url = new URL(BASE_URL + "/" + id);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("DELETE");
            return conn.getResponseCode() == HttpURLConnection.HTTP_OK
                    || conn.getResponseCode() == HttpURLConnection.HTTP_NO_CONTENT;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Book> searchBooks(String query) {
        List<Book> allBooks = getAllBooks();
        if (allBooks == null || query == null || query.trim().isEmpty()) {
            return allBooks;
        }
        String lowerQuery = query.toLowerCase();
        List<Book> filtered = new ArrayList<>();
        for (Book b : allBooks) {
            boolean matches = false;
            if (b.getTitle() != null && b.getTitle().toLowerCase().contains(lowerQuery))
                matches = true;
            else if (b.getAuthor() != null && b.getAuthor().toLowerCase().contains(lowerQuery))
                matches = true;
            else if (b.getIsbn() != null && b.getIsbn().toLowerCase().contains(lowerQuery))
                matches = true;
            else if (b.getCategory() != null && b.getCategory().toLowerCase().contains(lowerQuery))
                matches = true;
            else if (b.getPublisher() != null && b.getPublisher().toLowerCase().contains(lowerQuery))
                matches = true;

            if (matches) {
                filtered.add(b);
            }
        }
        return filtered;
    }
}
