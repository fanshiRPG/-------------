package com.webdev.newtech.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.webdev.newtech.domain.Ku;
import org.apache.ibatis.annotations.Delete;

public interface IKuMapper extends BaseMapper<Ku> {

    @Delete("DELETE FROM ku WHERE id = #{productId}")
    int deleteProductById(Integer productId); // 修改为更清晰的方法名

    @Delete("DELETE FROM ku WHERE product_name = #{productName}")
    int deleteProductByName(String productName); // 修改为更清晰的方法名


}
