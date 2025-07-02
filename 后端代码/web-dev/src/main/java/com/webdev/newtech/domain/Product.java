package com.webdev.newtech.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.util.Date;

@Data
public class Product {
    @TableId(type = IdType.AUTO)
    Integer id;
    String productName;
    String catName;
    String content;
    String createBy;
    Date createTime;
    String details;
    String img;
    Float price;
    String shotDesc;
    Integer status;
    Date updateTime;

}
