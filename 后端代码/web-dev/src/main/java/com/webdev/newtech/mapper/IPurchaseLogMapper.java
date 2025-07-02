package com.webdev.newtech.mapper;

import com.webdev.newtech.domain.PurchaseLog;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IPurchaseLogMapper {

    @Insert("INSERT INTO purchase_log (product_id, buyer, purchase_date, price, quantity) VALUES (#{productId}, #{buyer}, #{purchaseDate}, #{price}, #{quantity})")
    void insert(PurchaseLog purchaseLog);

    // 可以根据需要添加其他方法，如查询、删除等
}