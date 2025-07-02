package com.webdev.newtech.test;

import com.webdev.newtech.WebDev;
import com.webdev.newtech.config.JwtConfig;
import io.jsonwebtoken.Claims;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.Date;

@SpringBootTest(classes = WebDev.class)
@RunWith(SpringRunner.class)

public class TokenTest {

    //等价于@Autowired
    @Resource
    JwtConfig jwtConfig;

    /**
     * 颁发证书
     */
    @Test
    public void testCreateToken() {
        String token =  jwtConfig.createToken("admin");
        System.out.println("给admin用户颁发了token:"+token);
    }

    /**
     * 验证证书的有效性
     */
    @Test
    public void testVerifyToken() {
        String token = "eyJ0eXBlIjoiSldUIiwiYWxnIjoiSFM1MTIifQ.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTczMTU3MDMyMSwiZXhwIjoxNzMxNTczOTIxfQ.-6LnvJujW1bCM0usm6glx9UnWm6TW0MkX_ZIaXRyMQxt-zbMVZFP-YXP9oOmTKF4bf_sunay10xrxAj7vOrO-A";
        Claims claims = jwtConfig.getTokenClaim(token);
        if (claims == null) {
            System.out.println("不是我颁发的证书，无效证书");
        }else{
            //获取证书颁发的对象
            String authUserInfo =  claims.getSubject();
            System.out.println("证书有效，证书主体为："+authUserInfo);
            Date date = claims.getExpiration();
            System.out.println(date);
            if (jwtConfig.isTokenExpired(claims.getExpiration())){
                System.out.println("证书无效，已过安全期："+date);
            }else{
                System.out.println("证书有效，截止安全期："+date);
            }
        }
    }
}
