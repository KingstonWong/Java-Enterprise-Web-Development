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
import Models.ReviewDTO;

public class BookReviewApiClient {
    private final String BASE_URL = "http://localhost:5030/api/reviews";
    private final Gson gson = new Gson();

    public List<ReviewDTO> getReviewsByBook(int bookId) {
        try {
            URL url = new URL(BASE_URL + "/book/" + bookId);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            if (conn.getResponseCode() == HttpURLConnection.HTTP_OK) {
                try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"))) {
                    StringBuilder response = new StringBuilder();
                    String responseLine;
                    while ((responseLine = br.readLine()) != null) {
                        response.append(responseLine.trim());
                    }
                    return gson.fromJson(response.toString(), new TypeToken<List<ReviewDTO>>() {
                    }.getType());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ArrayList<>();
    }

    public boolean addReview(ReviewDTO review, String token) {
        try {
            URL url = new URL(BASE_URL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("Authorization", "Bearer " + token);
            conn.setDoOutput(true);

            String jsonInputString = gson.toJson(review);
            try (OutputStream os = conn.getOutputStream()) {
                os.write(jsonInputString.getBytes("utf-8"));
            }

            return conn.getResponseCode() == HttpURLConnection.HTTP_OK;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
