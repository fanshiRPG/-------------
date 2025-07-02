package com.webdev.newtech.service;

import com.webdev.newtech.domain.SysUser;

import java.util.List;

public interface ISysUserService {
    //查询用户列表
    List<SysUser> getUserList(String loginName, String userName);

    //
    int addUser(SysUser user);
    int updateUser(SysUser user);
    int deleteUser(int id);
    SysUser getUser(int id);



}
