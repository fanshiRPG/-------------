package com.webdev.newtech.test;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.webdev.newtech.WebDev;
import com.webdev.newtech.domain.SysUser;
import com.webdev.newtech.mapper.ISysUserMapper;
import com.webdev.newtech.utils.MD5Util;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@SpringBootTest(classes = WebDev.class)
@RunWith(SpringRunner.class)
public class MyBatisPlusTest {

    //拿到操作数据的实例（实现类）Spring自动帮我们装载，前提是这个接口继承了BaseMapper
    @Resource
    ISysUserMapper userMapper;


    //面向数据库进行数据的插入
    @Test
    public void testAddUser(){
        SysUser user = new SysUser();
        user.setLoginName("pkq2");
        user.setPassword(MD5Util.MD5("123456"));
        user.setUserName("超级管理员");
        user.setGender("MMa");
        user.setAge(22);
        user.setType("admin2");
        user.setTel("123456789");
        user.setRemark("");
        user.setEmail("");
        user.setCreateTime(new Date());

        userMapper.insert(user);
    }

    @Test
    //修改用户
    public  void  testEditUser(){
        //要编辑的数据 是根据ID明确进行编辑的
        SysUser user = new SysUser();
        user.setId(1);

        user.setAge(22);
        user.setTel("164531346");
        user.setUpdateTime(new Date());

        userMapper.updateById(user);
    }

    @Test
    //删除用户
    public  void  testRemoveUser(){
        Integer userId = 2;
        userMapper.deleteById(userId);
    }

    @Test
    //查询用户
    public  void testFindUserById(){
        Integer userId = 1;
        SysUser user = userMapper.selectById(userId);
        if(user == null){
            System.out.println("指定ID的用户不存在");
        }else {
        System.out.println(user.toString());
    }}

    //条件查询
    @Test
    public void testSelectUser(){
        //构建查询条件
        QueryWrapper<SysUser> wrapper = new QueryWrapper<>();
        wrapper.eq("login_name", "admin");

        List<SysUser> list = userMapper.selectList(wrapper);
        System.out.println("一共查询到匹配的数据库记录："+list.size());
        list.forEach(user -> {
            System.out.println(user.toString());
        });
    }

    //分页查询
    @Test
    public void testSelectPageUser(){
        //构建查询条件
        QueryWrapper<SysUser> wrapper = new QueryWrapper<>();
        wrapper.like("login_name", "admin");
        wrapper.orderByAsc("login_name");

        PageHelper.startPage(1, 2);
        List<SysUser> list = userMapper.selectList(wrapper);
        PageInfo info=new PageInfo(list);
        System.out.println(info.toString());
    }
}