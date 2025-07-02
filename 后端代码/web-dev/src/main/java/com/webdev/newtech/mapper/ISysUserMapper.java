package com.webdev.newtech.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.webdev.newtech.domain.SysUser;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ISysUserMapper extends BaseMapper<SysUser> {
    int insert(SysUser user);

}
