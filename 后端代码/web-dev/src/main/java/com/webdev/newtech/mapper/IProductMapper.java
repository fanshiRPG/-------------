package com.webdev.newtech.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.webdev.newtech.domain.Product;
import org.apache.ibatis.annotations.Delete;

public interface IProductMapper extends BaseMapper<Product> {

    @Delete("DELETE FROM product WHERE id = #{productId}")
    int deleteproduct(Integer productId);
}
