package com.webdev.newtech.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.http.HttpServletRequest;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;


public class FileUtil {

    public static boolean Save(String path, MultipartFile mfile, String desFileName) {
        File filePath = new File(path);
        if (!filePath.exists()) {
            filePath.mkdirs();
        }
        File dest = new File(desFileName);
        try {
            // 保存文件;
            mfile.transferTo(new File(path + dest));
            return true;
        } catch (IOException e) {
            return false;
        }
    }

    public static ResponseEntity<byte[]> download(HttpServletRequest request, String absPath) throws IOException {
        String tPath = System.getProperties().getProperty("user.home") + absPath;
        // System.out.println("文件路径应该为:"+tPath);
        File file = new File(tPath);
        if (file.exists()) {
            byte[] body = null;
            InputStream is = new FileInputStream(file);
            body = new byte[is.available()];
            is.read(body);
            is.close();
            HttpHeaders headers = new HttpHeaders();
            headers.add("Content-Disposition", "attchement;filename=" + file.getName());
            HttpStatus statusCode = HttpStatus.OK;
            ResponseEntity<byte[]> entity = new ResponseEntity<>(body, headers, statusCode);
            return entity;
        } else {
            HttpHeaders headers = new HttpHeaders();
            headers.add("Content-Disposition", "attchement;filename='不存在'");
            HttpStatus statusCode = HttpStatus.OK;
            ResponseEntity<byte[]> entity = new ResponseEntity<>(null, headers, statusCode);
            return entity;
        }
    }

    public static boolean delFile(String filePath, String fileName) {

        boolean result = false;
        File file = new File(filePath + fileName);
        if (file.exists()) {
            file.delete();
            result = true;
        }
        return result;
    }
}

