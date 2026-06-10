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
import Models.BorrowRecordDTO;

public class BorrowRecordApiClient {
    private final String BASE_URL = "http://localhost:5030/api/borrow-records";
    private final Gson gson = new com.google.gson.GsonBuilder()
            .registerTypeAdapter(java.sql.Date.class, new com.google.gson.JsonDeserializer<java.sql.Date>() {
                @Override
                public java.sql.Date deserialize(com.google.gson.JsonElement json, java.lang.reflect.Type typeOfT,
                        com.google.gson.JsonDeserializationContext context) throws com.google.gson.JsonParseException {
                    String dateStr = json.getAsString();
                    if (dateStr == null || dateStr.isEmpty())
                        return null;
                    try {
                        // Try yyyy-MM-dd
                        return java.sql.Date.valueOf(dateStr);
                    } catch (Exception e) {
                        try {
                            // Try ISO-8601 (yyyy-MM-ddTHH:mm:ss)
                            java.time.OffsetDateTime odt = java.time.OffsetDateTime.parse(dateStr);
                            return java.sql.Date.valueOf(odt.toLocalDate());
                        } catch (Exception e2) {
                            try {
                                java.time.LocalDateTime ldt = java.time.LocalDateTime.parse(dateStr);
                                return java.sql.Date.valueOf(ldt.toLocalDate());
                            } catch (Exception e3) {
                                System.err.println("Failed to parse date: " + dateStr);
                                return null;
                            }
                        }
                    }
                }
            }).create();

    public List<BorrowRecordDTO> getAllRecords() {
        return getListFromUrl(BASE_URL);
    }

    public BorrowRecordDTO getBorrowRecord(int id) {
        String urlString = BASE_URL + "/" + id;
        try {
            URL url = new URL(urlString);
            System.out.println("Calling API: " + url);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Accept", "application/json");

            int responseCode = conn.getResponseCode();
            System.out.println("API Response Code: " + responseCode);

            if (responseCode == HttpURLConnection.HTTP_OK) {
                try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"))) {
                    StringBuilder response = new StringBuilder();
                    String line;
                    while ((line = br.readLine()) != null)
                        response.append(line.trim());

                    String json = response.toString();
                    System.out.println("Raw JSON: " + json);

                    BorrowRecordDTO record = gson.fromJson(json, BorrowRecordDTO.class);
                    if (record == null)
                        System.err.println("Gson returned null for JSON: " + json);
                    return record;
                }
            } else {
                System.err.println("API Error " + responseCode + " for ID " + id);
            }
        } catch (Exception e) {
            System.err.println("Exception in getBorrowRecord(" + id + "): " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    public List<BorrowRecordDTO> getPendingRequests() {
        return getListFromUrl(BASE_URL + "/pending");
    }

    public List<BorrowRecordDTO> searchRecords(String keyword) {
        return getListFromUrl(BASE_URL + "/search?keyword=" + keyword);
    }

    public List<BorrowRecordDTO> getApprovedRecords() {
        return getListFromUrl(BASE_URL + "/approved");
    }

    public List<BorrowRecordDTO> getRecordsByMember(int memberId) {
        return getListFromUrl(BASE_URL + "/member/" + memberId);
    }

    public List<BorrowRecordDTO> getMemberActiveBorrows(int memberId) {
        return getListFromUrl(BASE_URL + "/member/" + memberId + "/active");
    }

    public List<BorrowRecordDTO> getBorrowHistory(int memberId) {
        return getListFromUrl(BASE_URL + "/member/" + memberId + "/history");
    }

    public boolean adminBorrow(int bookId, int memberId) {
        try {
            URL url = new URL(BASE_URL + "/admin/borrow");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setDoOutput(true);

            String jsonInputString = "{\"book_id\":" + bookId + ",\"member_id\":" + memberId + "}";
            try (OutputStream os = conn.getOutputStream()) {
                os.write(jsonInputString.getBytes("utf-8"));
            }
            return conn.getResponseCode() == HttpURLConnection.HTTP_OK;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean memberRequest(int memberId, int bookId) {
        try {
            URL url = new URL(BASE_URL + "/member/request/" + memberId + "/" + bookId);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            return conn.getResponseCode() == HttpURLConnection.HTTP_OK;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean approveRequest(int borrowId) {
        return putUrl(BASE_URL + "/admin/approve/" + borrowId);
    }

    public boolean confirmPickup(int borrowId) {
        return putUrl(BASE_URL + "/admin/pickup/" + borrowId);
    }

    public boolean returnBook(int borrowId) {
        return putUrl(BASE_URL + "/return/" + borrowId);
    }

    public boolean deleteRecord(int borrowId) {
        try {
            URL url = new URL(BASE_URL + "/" + borrowId);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("DELETE");
            return conn.getResponseCode() == HttpURLConnection.HTTP_OK;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    private List<BorrowRecordDTO> getListFromUrl(String urlString) {
        try {
            URL url = new URL(urlString);
            System.out.println("Calling API (List): " + url);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Accept", "application/json");

            int responseCode = conn.getResponseCode();
            System.out.println("API List Response Code: " + responseCode);

            if (responseCode == HttpURLConnection.HTTP_OK) {
                try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"))) {
                    StringBuilder response = new StringBuilder();
                    String line;
                    while ((line = br.readLine()) != null)
                        response.append(line.trim());

                    String json = response.toString();
                    // Don't log full list JSON to avoid console spam, just first 100 chars
                    System.out
                            .println("Raw List JSON (start): " + (json.length() > 100 ? json.substring(0, 100) : json));

                    return gson.fromJson(json, new TypeToken<List<BorrowRecordDTO>>() {
                    }.getType());
                }
            } else {
                System.err.println("API List Error: " + responseCode + " for URL: " + urlString);
            }
        } catch (Exception e) {
            System.err.println("Exception in getListFromUrl: " + e.getMessage());
            e.printStackTrace();
        }
        return new ArrayList<>();
    }

    private boolean putUrl(String urlString) {
        try {
            URL url = new URL(urlString);
            System.out.println("Calling PUT: " + url);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("PUT");
            int responseCode = conn.getResponseCode();
            System.out.println("PUT Response Code: " + responseCode);
            return responseCode == HttpURLConnection.HTTP_OK;
        } catch (Exception e) {
            System.err.println("Exception in putUrl: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
}
