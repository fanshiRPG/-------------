package com.webdev.newtech.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.webdev.newtech.domain.SysUser;
import com.webdev.newtech.mapper.ISysUserMapper;
import com.webdev.newtech.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
//这个服务类型集交给Spring做实例化

@Service
public class SysUserServiceImpl implements ISysUserService {
    @Autowired
    ISysUserMapper userMapper;


    @Override
    public List<SysUser> getUserList(String loginName, String userName) {
        //数据库查询
        QueryWrapper<SysUser> queryWrapper = new QueryWrapper<>();
        if(loginName!=null){
            queryWrapper.like("login_name",loginName);
        }
        if(userName!=null){
            queryWrapper.like("user_name",userName);
        }
        return userMapper.selectList(queryWrapper);
    }

    @Override
    public int addUser(SysUser user) {
        return userMapper.insert(user);
    }

    @Override
    public int updateUser(SysUser user) {
        return userMapper.updateById(user);
    }

    @Override
    public int deleteUser(int id) {
        return userMapper.deleteById(id);
    }

    @Override
    public SysUser getUser(int id) {
        return userMapper.selectById(id);
    }







}
