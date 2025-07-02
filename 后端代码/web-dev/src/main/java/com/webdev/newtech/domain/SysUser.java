package com.webdev.newtech.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.util.Date;

@Data
public class SysUser {

    //主键标识
    @TableId(type = IdType.AUTO)
    Integer id;
    String loginName;
    String password;
    String userName;
    String gender;
    String tel;
    Integer age;
    String type;
    String avator;
    String remark;
    String email;
    //下面两个字段，新增的时候系统维护
    String createBy;
    Date createTime;
    //下面两个字段，修改的时候系统维护
    String updateBy;
    Date updateTime;
}
