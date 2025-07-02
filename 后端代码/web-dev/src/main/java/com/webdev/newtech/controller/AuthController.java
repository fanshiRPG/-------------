package com.webdev.newtech.controller;

import com.webdev.newtech.config.JwtConfig;
import com.webdev.newtech.domain.SysUser;
import com.webdev.newtech.service.ISysUserService;
import com.webdev.newtech.utils.AjaxResult;
import com.webdev.newtech.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class AuthController {
    //拿到用户的服务类实例
    @Autowired
    ISysUserService userService;

    @Resource
    JwtConfig jwtConfig;


@PostMapping("/login")
    public AjaxResult login(@RequestParam(required = true) String loginName,@RequestParam(required = true)String password){
    //1、根据用户名查询该用户是否存在，不存在直接返回用户不存在提示
    //2、用户存在的情况下，再判断数据库的密码和用户传递的密码是否匹配，不匹配返回密码错误
    //3、用户存在且密码正确，则办法令牌，返回成功的信息并携带令牌，让用户自己保存（vue3-pinia保存）
    List<SysUser> list=userService.getUserList(loginName,null);
    if(list.size()==0){
        return AjaxResult.error("登录名不存在");
    }else {
        SysUser user=list.get(0);
        //将用户的明文密码加密后的数据库的密码进行比对，因为数据库存在的密码是明文。
        if(user.getPassword().equals(MD5Util.MD5(password))){
            //用户存在且密码正确，则办法令牌
            String token =  jwtConfig.createToken(loginName);
            Map<String,Object> rsMap=new HashMap<>();
            rsMap.put("token",token);
            rsMap.put("user",user);
            return AjaxResult.success(rsMap);
        }else{
            //用户存在，但是密码错误
            return AjaxResult.error("登录名存在，但是密码错误");
        }
    }
}
}
