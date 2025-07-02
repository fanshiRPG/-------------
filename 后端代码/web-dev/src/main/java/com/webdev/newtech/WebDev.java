package com.webdev.newtech;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = "com.*")
@MapperScan("com.webdev.newtech.mapper")
public class WebDev {
    public static void main(String[] args) {
        SpringApplication.run(WebDev.class);
    }
}
