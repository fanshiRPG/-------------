package com.webdev.newtech.service.impl;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.webdev.newtech.service.PubFileService;
import com.webdev.newtech.utils.AjaxResult;
import com.webdev.newtech.utils.FileUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;



@Service
public class PubFileServiceImpl implements PubFileService {

    // 定义文件公共上传路径 通用处理linux和windows系统   \pubfile\newtech\

    private String uploadPath = File.separator + "pubfile" + File.separator + "newtech" + File.separator;
    protected static final Logger log = LoggerFactory.getLogger("");
    // 文件下载url
    @Value(value = "/pubfile/download/")
    private String downloadUrl;

    @Override
    public ResponseEntity<byte[]> download(String path, HttpServletRequest request, String fileName) {
        String[] fileNames = fileName.replaceAll("\\\\", "/").split("/");
        if (fileNames.length > 1) {
            log.error("尝试通过文件下载攻击系统，请运维人员及时监控！");
        }
        fileName = fileNames[fileNames.length - 1];
        String filePath = uploadPath + path + File.separator + fileName;
        // System.out.println("filePath:"+filePath);
        log.info("下载文件，路径为："+filePath);
        try {
            return FileUtil.download(request, filePath);
        } catch (IOException e) {
            e.printStackTrace();
            log.error("获取文件失败");
            return null;
        }
    }

    @Override
    public AjaxResult upload(String path, MultipartFile file, HttpServletRequest request) {
        // TODO Auto-generated method stub
        Map<String, Object> resultMap = new HashMap<String, Object>();
        SimpleDateFormat smp = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        String homeDir = System.getProperties().getProperty("user.home");
        String filePath = uploadPath + path + File.separator;
        // 随机生成图片名称，防止重名文件情况
        int random = (int) (Math.random() * 900) + 100;
        String desFileName = smp.format(new Date()) + random + "."
                + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
        boolean b = FileUtil.Save(homeDir + filePath, file, desFileName);
        if (b) {
            resultMap.put("url", downloadUrl + path + "?fileName=" + desFileName);
            resultMap.put("uploaded", true); // ckeditor5需要
            resultMap.put("success", 1); // editormd需要
            resultMap.put("message", "图片保存成功");
            resultMap.put("fileName", desFileName);
        } else {
            resultMap.put("uploaded", false);
            resultMap.put("url", downloadUrl + "?fileName=default.jpg");
            resultMap.put("message", "图片保存失败");
            resultMap.put("fileName", desFileName);
        }
        return AjaxResult.success(resultMap);
    }

    @Override
    public AjaxResult delte(String path, String fileName) {
        // TODO Auto-generated method stub
        Map<String, Object> resultMap = new HashMap<String, Object>();
        String homeDir = System.getProperties().getProperty("user.home");
        // SysUser su = (SysUser) this.session.getAttribute("baseUser");
        String filePath = uploadPath + path + File.separator;
        // log.info("删除文件，文件名，文件路径："+filePath+fileName);
        boolean b = FileUtil.delFile(homeDir + filePath, fileName);
        if (b) {
            resultMap.put("result", "success");
            log.info("文件删除成功");
        } else {
            resultMap.put("result", "error");
            log.error("文件删除失败，路径为：" + path + " 文件名：" + fileName);
        }
        return AjaxResult.success(resultMap);
    }



}
