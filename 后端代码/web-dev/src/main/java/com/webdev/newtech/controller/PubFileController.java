package com.webdev.newtech.controller;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import com.webdev.newtech.service.PubFileService;
import com.webdev.newtech.utils.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
@RestController
@RequestMapping("pubfile")
public class PubFileController {

    @Autowired
    private PubFileService pfs;
    /**
     *
     * @param path: 文件路径
     * @param request
     * @param fileName ：文件名称
     * @return
     */
    @RequestMapping("download/{path}")
    public ResponseEntity<byte[]> download(@PathVariable("path") String path, HttpServletRequest request,
                                           String fileName) {
        return pfs.download(path, request, fileName);
    }
    /**
     * 通用文件上传
     *
     * @param path ： 子路径
     * @param file·：用户处理ckeditor文件上传和一般文件上传，必须保证上传时name为file
     * @param request
     * @return
     */
    @PostMapping("/upload/{path}")
    @ResponseBody
    public AjaxResult upload(@PathVariable("path") String path,
                             @RequestParam(value = "file", required = false) MultipartFile file,
                             HttpServletRequest request) {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        if (file.isEmpty()) {
            resultMap.put("uploaded", 0);
            resultMap.put("message","获取文件失败，请重新上传！");
            return AjaxResult.success(resultMap);
        }
        return pfs.upload(path, file, request);
    }
    /**
     *
     * @param path     :待删除文件的子路径
     * @param fileName :文件名
     * @return
     */
    @ResponseBody
    @RequestMapping("delete/{path}")
    public AjaxResult delDropZoneFile(@PathVariable("path") String path,
                                      @RequestParam(required = true, name = "fileName") String fileName) {

        return pfs.delte(path, fileName);
    }
}
