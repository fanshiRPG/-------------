package com.webdev.newtech.service;

import javax.servlet.http.HttpServletRequest;

import com.webdev.newtech.utils.AjaxResult;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;
public interface PubFileService {
    //下载
    ResponseEntity<byte[]> download(String path, HttpServletRequest request, String fileName);
    //上传
    AjaxResult upload(String path, MultipartFile file, HttpServletRequest request);
    //删除
    AjaxResult delte(String path,String fileName);
}
