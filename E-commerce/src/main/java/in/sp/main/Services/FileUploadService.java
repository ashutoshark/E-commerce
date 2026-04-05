package in.sp.main.Services;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;

@Service
public class FileUploadService {

    private final ServletContext servletContext;

    public FileUploadService(ServletContext servletContext) {
        this.servletContext = servletContext;
    }
 
    public String saveFile(MultipartFile file) throws IOException {
        if (file.isEmpty()) {
            throw new IllegalArgumentException("File is empty");
        }

        // Define upload directory
        String uploadDir = servletContext.getRealPath("/uploads/"); // here 
        File uploadFolder = new File(uploadDir);

        // Create folder if it doesn't exist
        if (!uploadFolder.exists()) {
            uploadFolder.mkdirs();
        }

        // Generate a unique filename to avoid collisions
        String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
        String filePath = uploadDir + File.separator + fileName;

        // Save the file
        file.transferTo(new File(filePath));

        // Return the relative path for frontend access
        return "/uploads/" + fileName;
    }
}
