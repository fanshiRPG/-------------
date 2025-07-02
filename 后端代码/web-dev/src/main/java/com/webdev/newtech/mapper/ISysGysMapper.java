package com.webdev.newtech.mapper;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.webdev.newtech.domain.Ku;
import com.webdev.newtech.domain.SysGys;
import org.apache.ibatis.annotations.Delete;

import java.util.List;

public interface ISysGysMapper extends BaseMapper<SysGys> {

    @Delete("DELETE FROM sys_gys WHERE id = #{productId}")
    int deleteproduct(Integer productId);


}
