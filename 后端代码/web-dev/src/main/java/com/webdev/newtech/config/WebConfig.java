package com.webdev.newtech.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.annotation.Resource;
@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Resource
    private TokenInterceptor tokenInterceptor ;
    public void addInterceptors(InterceptorRegistry registry) {
        //暂时拦截所有的请求

        registry.addInterceptor(tokenInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns("/captcha/**")
                .excludePathPatterns("/login")
                .excludePathPatterns("/logout")
                .excludePathPatterns("/token/login")
                .excludePathPatterns("/pubfile/**")
                .excludePathPatterns("/prev/**")
                .excludePathPatterns("/prev/*")
                .excludePathPatterns("/swagger**")
        ;

    }

    @Bean
    public CorsFilter corsFilter() {
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        CorsConfiguration corsConfiguration = new CorsConfiguration();
        corsConfiguration.addAllowedOrigin("*"); // 1 设置访问源地址
        corsConfiguration.addAllowedHeader("*"); // 2 设置访问源请求头
        corsConfiguration.addAllowedMethod("*"); // 3 设置访问源请求方法
        corsConfiguration.setMaxAge(24 * 60 * 60L);
        source.registerCorsConfiguration("/**", corsConfiguration); // 4 对接口配置跨域设置
        return new CorsFilter(source);
    }
}
