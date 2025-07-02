package com.webdev.newtech.config;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.SignatureException;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@Component
public class TokenInterceptor implements HandlerInterceptor {
    @Resource
    private JwtConfig jwtConfig ;
    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws SignatureException {
        //如果不是映射到方法直接通过
        if(!(handler instanceof HandlerMethod)) {
            return true;
        }
        /** 地址过滤 */
        String uri = request.getRequestURI() ;
        System.out.println("uri:"+uri);
        if (uri.contains("login")||uri.contains("test")||uri.contains("logout")||uri.contains("swagger")||uri.contains("error")){
            return true ;
        }
        /** Token 验证 */
        String token = request.getHeader(jwtConfig.getHeader());
        if(StringUtils.isEmpty(token)){
            token = request.getParameter(jwtConfig.getHeader());
        }
        if(StringUtils.isEmpty(token)){
            throw new SignatureException(jwtConfig.getHeader()+ "不能为空");
        }
        Claims claims = null;
        try{
            claims = jwtConfig.getTokenClaim(token);
            if(claims == null || jwtConfig.isTokenExpired(claims.getExpiration())){
                throw new SignatureException(jwtConfig.getHeader() + "失效，请重新登录。");
            }
        }catch (Exception e){
            throw new SignatureException(jwtConfig.getHeader() + "失效，请重新登录。");
        }
        /** 设置 identityId 用户身份ID */
        request.setAttribute("identityId", claims.getSubject());
        return true;
    }
}
