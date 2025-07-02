package com.webdev.newtech.controller;

import com.webdev.newtech.utils.AjaxResult;
import javax.servlet.http.HttpServletRequest;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
class GlobalErrorController implements ErrorController {
    @RequestMapping({"/error"})
    @ResponseBody
    public AjaxResult handleError(HttpServletRequest request) {
        Integer statusCode = (Integer)request.getAttribute("javax.servlet.error.status_code");
        // 获取异常属性
        Exception exception = (Exception) request.getAttribute("javax.servlet.error.exception");
        String message = "服务端无法响应，请检查";
        if(exception != null) {
            message = exception.getMessage();
        }
        if (statusCode.intValue() == 401)
            return AjaxResult.error(401, "401");
        if (statusCode.intValue() == 404)
            return AjaxResult.error(404, "接口地址不存在");
        if (statusCode.intValue() == 403)
            return AjaxResult.error(403, "禁止访问");
        return AjaxResult.error(500, message);
    }
}
