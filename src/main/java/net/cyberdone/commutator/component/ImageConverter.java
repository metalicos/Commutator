package net.cyberdone.commutator.component;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.util.Base64;

@Component
@Slf4j
public class ImageConverter {

    public static String convertMultipartFileToBase64StringImage(MultipartFile file) {
        String image = null;
        if (file != null) {
            try {
                byte[] bytes = new byte[file.getBytes().length];
                int i = 0;
                for (byte b : file.getBytes()) {
                    bytes[i++] = b;
                }
                image = Base64.getEncoder().encodeToString(bytes);

            } catch (Exception ex) {
                log.warn(ex.getMessage());
            }
        }
        return image;
    }

    public static byte[] convertImageToBlob(BufferedImage image) {
        ByteArrayOutputStream baos = null;
        ByteArrayInputStream bais = null;
        try {
            baos = new ByteArrayOutputStream();
            ImageIO.write(image, "png", baos);
            bais = new ByteArrayInputStream(baos.toByteArray());
        } catch (Exception ex) {
            log.warn(ex.getMessage());
        } finally {
            close(baos);
        }
        return bais != null ? bais.readAllBytes() : null;
    }

    public static byte[] convertImageFromFileToBlob(String filePath) {
        BufferedImage image = null;
        try {
            image = ImageIO.read(new File(filePath));
        } catch (Exception ex) {
            log.warn(ex.getMessage());
            return null;
        }
        return convertImageToBlob(image);
    }

    public static byte[] setDefaultImageFromFileWhileBlobNull(byte[] blob, String defaultImagePath) {
        ByteArrayOutputStream baos = null;
        if (blob != null)
            return blob;

        if (defaultImagePath != null) {
            return convertImageFromFileToBlob(defaultImagePath);
        }
        log.warn("Default Image Path is NULL");
        return null;
    }

    public static String convertBlobToBase64StringImage(byte[] imageBlob) {
        return Base64.getEncoder().encodeToString(imageBlob);
    }

    public static byte[] convertBase64StringImageToBlob(String base64) {
        return Base64.getDecoder().decode(base64);
    }

    private static void close(AutoCloseable closeable) {
        try {
            if (closeable != null) {
                closeable.close();
            }
        } catch (Exception ex) {
            log.error("Cannot close --> " + closeable + " " + ex);
        }
    }
}