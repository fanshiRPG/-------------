package com.webdev.newtech.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.webdev.newtech.domain.Product;
import com.webdev.newtech.domain.SysUser;
import com.webdev.newtech.mapper.IProductMapper;
import com.webdev.newtech.mapper.ISysUserMapper;
import com.webdev.newtech.utils.AjaxResult;
import com.webdev.newtech.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("prev")
public class PrevController {

    @Resource
    IProductMapper productMapper;
    @Autowired
    ISysUserMapper userMapper;

    @GetMapping("productlist")
    public AjaxResult productList(String pname,String catName) {
        //构造查询条件
        QueryWrapper<Product> wrapper = new QueryWrapper<>();
        if(pname!=null){
            wrapper.like("product_name",pname);
        }
        if(catName!=null){
            wrapper.eq("cat_name",catName);
        }
        wrapper.eq("status",1);
        wrapper.orderByDesc("id");

        PageHelper.startPage(1,8);
        List<Product> list = productMapper.selectList(wrapper);
        PageInfo<Product> pageInfo = new PageInfo<>(list);

        return AjaxResult.success(pageInfo);
    }

    @GetMapping("getProductDetail")
    public AjaxResult getProductDetail( Integer id) {
        // 检查 id 是否为空
        if (id == null) {
            return AjaxResult.error("Product ID cannot be null");
        }

        // 查询产品详情
        Product product = productMapper.selectById(id);

        // 判断产品是否存在
        if (product == null) {
            return AjaxResult.error("Product not found");
        }

        // 返回成功结果，包含产品详细信息
        return AjaxResult.success(product);
    }
    @GetMapping("registUser")
    public AjaxResult registUser(
            @RequestParam(required = false) Integer age,
            @RequestParam(required = false) String avatar,
            @RequestParam(required = false) String createBy,
            @RequestParam(required = false) String createTime,
            @RequestParam(required = false) String gender,
            @RequestParam(required = false) Integer id,
            @RequestParam(required = false) String loginName,
            @RequestParam(required = false) String password,
            @RequestParam(required = false) String remark,
            @RequestParam(required = false) String tel,
            @RequestParam(required = false) String type,
            @RequestParam(required = false) String updateBy,
            @RequestParam(required = false) String updateTime,
            @RequestParam(required = false) String userName) {

        try {
            // 检查必填字段
            if (loginName == null || password == null || userName == null) {
                return AjaxResult.error("Login name, password, and user name are required!");
            }

            // 创建 SysUser 对象，封装用户注册信息
            SysUser user = new SysUser();
            user.setLoginName(loginName); // 设置登录名
            user.setPassword(MD5Util.MD5(password)); // 密码加密
            user.setUserName(userName); // 用户名
            user.setGender(gender); // 性别
            user.setAge(age); // 年龄
            user.setType(type); // 用户类型
            user.setTel(tel); // 电话
            user.setRemark(remark); // 备注

            // 插入用户数据
            int rows = userMapper.insert(user); // 执行插入操作

            // 判断插入是否成功
            if (rows > 0) {
                return AjaxResult.success("User registered successfully");
            } else {
                return AjaxResult.error("User registration failed");
            }
        } catch (Exception e) {
            e.printStackTrace(); // 打印异常
            return AjaxResult.error("An error occurred during registration: " + e.getMessage());
        }
    }
}
