package com.webdev.newtech.controller;

import com.webdev.newtech.domain.PurchaseLog;
import com.webdev.newtech.domain.PurchaseInfo; // 导入 PurchaseInfo
import com.webdev.newtech.mapper.IPurchaseLogMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/api")
public class PurchaseController {

    @Autowired
    private IPurchaseLogMapper purchaseLogMapper; // 注入 Mapper

    @PostMapping("/purchase")
    public ResponseEntity<?> purchaseProducts(@RequestBody List<PurchaseInfo> purchaseInfos) {
        try {
            for (PurchaseInfo info : purchaseInfos) {
                PurchaseLog log = new PurchaseLog();
                log.setProductId(info.getProductId());
                log.setBuyer(info.getBuyer());
                log.setPurchaseDate(new Date());
                log.setPrice(info.getPrice() * info.getQuantity());
                log.setQuantity(info.getQuantity()); // 设置数量

                // 保存到数据库
                purchaseLogMapper.insert(log);
            }
            return ResponseEntity.ok("购买成功");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("购买失败：" + e.getMessage());
        }
    }
}
