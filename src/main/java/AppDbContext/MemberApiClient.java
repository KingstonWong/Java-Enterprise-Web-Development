package AppDbContext;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import Models.Member;

public class MemberApiClient {
    private final String BASE_URL = "http://localhost:5030/api/members";
    private final Gson gson = new Gson();

    public Member login(String email, String password) {
        try {
            URL url = new URL(BASE_URL + "/login");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setDoOutput(true);

            String jsonInputString = gson.toJson(new LoginRequest(email, password));

            try (OutputStream os = conn.getOutputStream()) {
                byte[] input = jsonInputString.getBytes("utf-8");
                os.write(input, 0, input.length);
            }

            if (conn.getResponseCode() == HttpURLConnection.HTTP_OK) {
                try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"))) {
                    StringBuilder response = new StringBuilder();
                    String responseLine;
                    while ((responseLine = br.readLine()) != null) {
                        response.append(responseLine.trim());
                    }
                    return gson.fromJson(response.toString(), Member.class);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Member> getAllMembers() {
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
                    return gson.fromJson(response.toString(), new TypeToken<List<Member>>() {
                    }.getType());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Member register(Member member) {
        try {
            URL url = new URL(BASE_URL + "/register");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setDoOutput(true);

            String jsonInputString = gson.toJson(member);

            try (OutputStream os = conn.getOutputStream()) {
                byte[] input = jsonInputString.getBytes("utf-8");
                os.write(input, 0, input.length);
            }

            if (conn.getResponseCode() == HttpURLConnection.HTTP_OK) {
                try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"))) {
                    StringBuilder response = new StringBuilder();
                    String responseLine;
                    while ((responseLine = br.readLine()) != null) {
                        response.append(responseLine.trim());
                    }
                    return gson.fromJson(response.toString(), Member.class);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Member getMemberById(int id) {
        try {
            URL url = new URL(BASE_URL + "/admin/" + id);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            if (conn.getResponseCode() == HttpURLConnection.HTTP_OK) {
                try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"))) {
                    StringBuilder response = new StringBuilder();
                    String responseLine;
                    while ((responseLine = br.readLine()) != null) {
                        response.append(responseLine.trim());
                    }
                    return gson.fromJson(response.toString(), Member.class);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateMember(Member member) {
        try {
            URL url = new URL(BASE_URL + "/admin/" + member.getMember_id());
            System.out.println("[updateMember] PUT URL: " + url);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("PUT");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setDoOutput(true);

            String jsonInputString = gson.toJson(member);
            System.out.println("[updateMember] JSON Body: " + jsonInputString);

            try (OutputStream os = conn.getOutputStream()) {
                byte[] input = jsonInputString.getBytes("utf-8");
                os.write(input, 0, input.length);
            }

            int responseCode = conn.getResponseCode();
            System.out.println("[updateMember] Response Code: " + responseCode);

            if (responseCode != HttpURLConnection.HTTP_OK) {
                try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "utf-8"))) {
                    StringBuilder errorResponse = new StringBuilder();
                    String line;
                    while ((line = br.readLine()) != null) {
                        errorResponse.append(line.trim());
                    }
                    System.err.println("[updateMember] API Error Response: " + errorResponse.toString());
                }
            }
            return responseCode == HttpURLConnection.HTTP_OK;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateProfile(Member member) {
        try {
            URL url = new URL(BASE_URL + "/profile/" + member.getMember_id());
            System.out.println("[updateProfile] PUT URL: " + url);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("PUT");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setDoOutput(true);

            String jsonInputString = gson.toJson(member);
            System.out.println("[updateProfile] JSON Body: " + jsonInputString);

            try (OutputStream os = conn.getOutputStream()) {
                byte[] input = jsonInputString.getBytes("utf-8");
                os.write(input, 0, input.length);
            }

            int responseCode = conn.getResponseCode();
            System.out.println("[updateProfile] Response Code: " + responseCode);

            if (responseCode == HttpURLConnection.HTTP_OK) {
                return true;
            } else {
                try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "utf-8"))) {
                    StringBuilder errorResponse = new StringBuilder();
                    String line;
                    while ((line = br.readLine()) != null) {
                        errorResponse.append(line.trim());
                    }
                    System.err.println("[updateProfile] API Error Response: " + errorResponse.toString());
                }
            }
        } catch (Exception e) {
            System.err.println("[updateProfile] Error: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Change member password via the API's change-password endpoint.
     * Returns: "success" on success, or an error message string on failure.
     */
    public String changePassword(int memberId, String oldPassword, String newPassword) {
        try {
            URL url = new URL(BASE_URL + "/change-password/" + memberId);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("PUT");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setDoOutput(true);

            String jsonInputString = "{\"OldPassword\":\"" + oldPassword + "\",\"NewPassword\":\"" + newPassword
                    + "\"}";

            try (OutputStream os = conn.getOutputStream()) {
                byte[] input = jsonInputString.getBytes("utf-8");
                os.write(input, 0, input.length);
            }

            int responseCode = conn.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) {
                return "success";
            } else {
                try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "utf-8"))) {
                    StringBuilder errorResponse = new StringBuilder();
                    String line;
                    while ((line = br.readLine()) != null)
                        errorResponse.append(line.trim());
                    return errorResponse.toString();
                } catch (Exception ignored) {
                }
                return "Failed to change password";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "Connection error";
    }

    public boolean isEmailExists(String email) {
        List<Member> members = getAllMembers();
        if (members == null)
            return false;
        return members.stream().anyMatch(m -> m.getEmail().equalsIgnoreCase(email));
    }

    public String getLastMembershipIdForYear(int year) {
        List<Member> members = getAllMembers();
        if (members == null)
            return null;

        String prefix = "MEM-" + year + "-";
        return members.stream()
                .map(Member::getMembership_id)
                .filter(id -> id != null && id.startsWith(prefix))
                .sorted((a, b) -> b.compareTo(a)) // Reverse order
                .findFirst()
                .orElse(null);
    }

    public boolean isMembershipIdExists(String membershipId) {
        List<Member> members = getAllMembers();
        if (members == null)
            return false;
        return members.stream().anyMatch(m -> m.getMembership_id().equalsIgnoreCase(membershipId));
    }

    public boolean deleteMember(int id) {
        try {
            URL url = new URL(BASE_URL + "/" + id);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("DELETE");
            return conn.getResponseCode() == HttpURLConnection.HTTP_OK;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Member> searchMembers(String query) {
        List<Member> allMembers = getAllMembers();
        if (allMembers == null || query == null || query.trim().isEmpty()) {
            return allMembers;
        }
        String lowerQuery = query.toLowerCase();
        List<Member> filtered = new java.util.ArrayList<>();
        for (Member m : allMembers) {
            boolean matches = false;
            if (m.getMember_name() != null && m.getMember_name().toLowerCase().contains(lowerQuery))
                matches = true;
            else if (m.getEmail() != null && m.getEmail().toLowerCase().contains(lowerQuery))
                matches = true;
            else if (m.getMembership_id() != null && m.getMembership_id().toLowerCase().contains(lowerQuery))
                matches = true;
            else if (m.getPhone_number() != null && m.getPhone_number().toLowerCase().contains(lowerQuery))
                matches = true;

            if (matches) {
                filtered.add(m);
            }
        }
        return filtered;
    }

    // Helper classes for GSON
    public String forgotPassword(String email) {
        try {
            URL url = new URL(BASE_URL + "/forgot-password");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setDoOutput(true);

            String jsonInputString = gson.toJson(new ForgotPasswordRequest(email));

            try (OutputStream os = conn.getOutputStream()) {
                byte[] input = jsonInputString.getBytes("utf-8");
                os.write(input, 0, input.length);
            }

            if (conn.getResponseCode() == HttpURLConnection.HTTP_OK) {
                try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"))) {
                    StringBuilder response = new StringBuilder();
                    String responseLine;
                    while ((responseLine = br.readLine()) != null) {
                        response.append(responseLine.trim());
                    }
                    ForgotPasswordResponse res = gson.fromJson(response.toString(), ForgotPasswordResponse.class);
                    return res.tempPassword;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    private static class LoginRequest {
        String email;
        String password;

        LoginRequest(String email, String password) {
            this.email = email;
            this.password = password;
        }
    }

    private static class ForgotPasswordRequest {
        @SuppressWarnings("unused")
        String Email; // Matches .NET DTO casing

        ForgotPasswordRequest(String email) {
            this.Email = email;
        }
    }

    private static class ForgotPasswordResponse {
        String tempPassword;
    }
}
