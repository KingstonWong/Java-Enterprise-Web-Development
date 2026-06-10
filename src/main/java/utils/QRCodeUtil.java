package utils;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Base64;

public class QRCodeUtil {

    /**
     * Generates a Base64 encoded string of a QR Code image.
     *
     * @param text   The text to encode in the QR Code.
     * @param width  The width of the QR Code image.
     * @param height The height of the QR Code image.
     * @return Base64 encoded string of the PNG image.
     * @throws WriterException If there is an error during encoding.
     * @throws IOException     If there is an error writing the image to the byte
     *                         array.
     */
    public static String generateQRCodeBase64(String text, int width, int height) throws WriterException, IOException {
        QRCodeWriter qrCodeWriter = new QRCodeWriter();
        BitMatrix bitMatrix = qrCodeWriter.encode(text, BarcodeFormat.QR_CODE, width, height);

        ByteArrayOutputStream pngOutputStream = new ByteArrayOutputStream();
        MatrixToImageWriter.writeToStream(bitMatrix, "PNG", pngOutputStream);
        byte[] pngData = pngOutputStream.toByteArray();

        return Base64.getEncoder().encodeToString(pngData);
    }
}
