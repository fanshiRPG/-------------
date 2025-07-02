package com.webdev.newtech.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.webdev.newtech.domain.SysUser;
import com.webdev.newtech.service.ISysUserService;
import com.webdev.newtech.utils.AjaxResult;
import com.webdev.newtech.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("sysUser")
public class SysUserController {
    @Autowired
    ISysUserService userService;

    @GetMapping("add")
    public AjaxResult addUser(SysUser user) {
        // 接收用户数据，然后插入数据库
        try {
            user.setPassword(MD5Util.MD5(user.getPassword()));
            userService.addUser(user);
            return AjaxResult.success("新增用户成功");
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.error(e.getMessage());
        }
    }

    @PostMapping("getList")
    public AjaxResult getList(@RequestParam(required = true) int pageNum,
                              @RequestParam(required = true) int pageSize,
                              String loginName, String userName) {
        PageHelper.startPage(pageNum, pageSize);
        List<SysUser> userList = userService.getUserList(loginName, userName);
        PageInfo<SysUser> info = new PageInfo<>(userList);
        return AjaxResult.success(info);
    }

    @PostMapping("getUser")
    public AjaxResult getUserById(@RequestParam(required = true) int id) {
        SysUser user = userService.getUser(id);
        if (user == null) {
            return AjaxResult.error("指定ID用户不存在");
        } else {
            return AjaxResult.success(user);
        }
    }

    @PostMapping("remove/{userid}")
    public AjaxResult remove(@PathVariable int userid) {
        userService.deleteUser(userid);
        return AjaxResult.success("删除成功");
    }

    @PostMapping("update") // 将这里的 GET 改为 POST
    public AjaxResult updateUser(
            @RequestParam(value = "updateTime")
            @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) Date updateTime,
            @RequestBody SysUser user) { // 使用 @RequestBody 注解获取整个对象
        if (user.getId() == null) {
            return AjaxResult.error("更新用户必须传递ID属性");
        }
        try {
            user.setUpdateTime(updateTime); // 使用传入的 updateTime
            user.setUpdateBy("admin");
            userService.updateUser(user);
            return AjaxResult.success("更新用户成功");
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.error(e.getMessage());
        }
    }
}
