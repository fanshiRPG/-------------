package com.webdev.newtech.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.webdev.newtech.domain.Ku;
import com.webdev.newtech.domain.Ku1;
import com.webdev.newtech.domain.Product;
import com.webdev.newtech.mapper.IKu1Mapper;
import com.webdev.newtech.mapper.IKuMapper;
import com.webdev.newtech.utils.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("productKu1")
public class Ku1Controller {
    @Autowired
    IKu1Mapper productMapper;





    @GetMapping("list")
    public AjaxResult list(@RequestParam(required = true) Integer pageNum,
                           @RequestParam(required = true) Integer pageSize,
                           String productName, Integer num) {
        // 检查查询条件
        QueryWrapper<Ku1> wrapper = new QueryWrapper<>(); // 确保使用正确的实体类

        if(productName!=null){
            wrapper.like("product_name",productName);
        }
        if(num!=null){
            wrapper.eq("name",num);
        }

        PageHelper.startPage(pageNum, pageSize);
        List<Ku1> list = productMapper.selectList(wrapper);
        PageInfo<Ku1> info = new PageInfo<>(list);

        return AjaxResult.success(info);
    }





}
