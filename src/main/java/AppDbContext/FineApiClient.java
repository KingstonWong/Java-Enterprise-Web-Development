package AppDbContext;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import Models.FineDTO;

public class FineApiClient {
    private final String BASE_URL = "http://localhost:5030/api/fines";
    private final Gson gson = new Gson();

    public List<FineDTO> getAllFines() {
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
                    return gson.fromJson(response.toString(), new TypeToken<List<FineDTO>>() {
                    }.getType());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ArrayList<>();
    }

    public boolean calculateFine(int borrowId) {
        try {
            URL url = new URL(BASE_URL + "/calculate/" + borrowId);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            return conn.getResponseCode() == HttpURLConnection.HTTP_OK;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public FineDTO getFineById(int fineId) {
        List<FineDTO> fines = getAllFines();
        for (FineDTO fine : fines) {
            if (fine.getFine_id() == fineId) {
                return fine;
            }
        }
        return null;
    }

    public boolean payFine(int fineId) {
        try {
            URL url = new URL(BASE_URL + "/pay/" + fineId);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("PUT");
            // API expects no body, but Java PUT requests may need explicit Content-Length
            conn.setRequestProperty("Content-Length", "0");

            System.out.println("Executing payFine: " + url.toString() + " | Response Code: " + conn.getResponseCode());
            return conn.getResponseCode() == HttpURLConnection.HTTP_OK;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
