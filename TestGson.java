```java
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonDeserializer;
import java.sql.Date;

public class TestGson {
    public static class DTO {
        public Date d;
    }
    public static void main(String[] args) {
        try {
            Gson gson = new GsonBuilder()
                .registerTypeAdapter(Date.class, (JsonDeserializer<Date>) (json, typeOfT, context) -> {
                    return Date.valueOf(json.getAsString());
                }).create();
            String json = "{\"d\":\"2026-03-04\"}";
            DTO dto = gson.fromJson(json, DTO.class);
            System.out.println("Success: " + dto.d);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
