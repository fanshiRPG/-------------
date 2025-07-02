package com.webdev.newtech.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.webdev.newtech.domain.Ku;
import com.webdev.newtech.domain.SysGys;
import com.webdev.newtech.mapper.ISysGysMapper;
import com.webdev.newtech.utils.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("product1")
public class SysGysController {
    @Autowired
    ISysGysMapper productMapper;


    @GetMapping("add")
    public AjaxResult add(SysGys product) {
        product.setId(null);
        product.setCreateBy("管理员新增");
        product.setCreateTime(new Date());
        //rs是数据库执行的结果影响，要么有一条数据插入为1，要么失败为0
        int rs=productMapper.insert(product);
        return AjaxResult.success("新增成功");
    }

    @GetMapping("edit")
    public AjaxResult editProduct(SysGys product) {
        if(product.getId()==null){
            return AjaxResult.error("请传递需要修改的产品ID");
        }
        product.setUpdateTime(new Date());
        //rs是数据库执行的结果影响，1代表成功，0代表失败
        int rs=productMapper.updateById(product);
        return AjaxResult.success("修改成功");
    }

    @GetMapping("get")
    public AjaxResult get(@RequestParam(required = true) Integer id) {
        SysGys product = productMapper.selectById(id);
        return AjaxResult.success(product);
    }

    @GetMapping("list")
    public AjaxResult list(@RequestParam(required = true) Integer pageNum,
                           @RequestParam(required = true) Integer pageSize,
                           @RequestParam(required = false) String pname,
                           @RequestParam(required = false) String catName) {
        try {
            // 检查查询条件
            QueryWrapper<SysGys> wrapper = new QueryWrapper<>(); // 使用正确的实体类
            if (pname != null && !pname.trim().isEmpty()) {
                wrapper.like("product_name", pname);
            }
            if (catName != null && !catName.trim().isEmpty()) {
                wrapper.eq("cat_name", catName);
            }
            wrapper.orderByDesc("id");

            // 启动分页
            PageHelper.startPage(pageNum, pageSize);
            List<SysGys> list = productMapper.selectList(wrapper);
            PageInfo<SysGys> info = new PageInfo<>(list);

            return AjaxResult.success(info);
        } catch (Exception e) {
            // 捕获异常并返回错误信息
            return AjaxResult.error("查询过程中出现错误: " + e.getMessage());
        }
    }

    @PostMapping("remove/{productId}")
    public AjaxResult remove(@PathVariable Integer productId) {
        try {
            int result = productMapper.deleteproduct(productId);
            if (result > 0) {
                return AjaxResult.success("删除成功");
            } else {
                return AjaxResult.error("删除失败，产品ID不存在或其他错误");
            }
        } catch (Exception e) {
            return AjaxResult.error("删除过程中出现错误: " + e.getMessage());
        }
    }


}
