package com.webdev.newtech.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.webdev.newtech.domain.Ku;
import com.webdev.newtech.domain.Ku2;
import org.apache.ibatis.annotations.Delete;

public interface IKu2Mapper extends BaseMapper<Ku2> {

    @Delete("DELETE FROM ku2 WHERE id = #{productId}")
    int deleteproduct(Integer productId);


}
