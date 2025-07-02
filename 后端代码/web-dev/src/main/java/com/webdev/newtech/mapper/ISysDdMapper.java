package com.webdev.newtech.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.webdev.newtech.domain.Ku;
import com.webdev.newtech.domain.SysDd;
import org.apache.ibatis.annotations.Delete;

public interface ISysDdMapper extends BaseMapper<SysDd> {

    @Delete("DELETE FROM sys_dd WHERE id = #{productId}")
    int deleteproduct(Integer productId);


}
