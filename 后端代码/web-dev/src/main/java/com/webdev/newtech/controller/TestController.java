package com.webdev.newtech.controller;

import com.webdev.newtech.domain.SysUser;
import com.webdev.newtech.utils.AjaxResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

//把一个普通的类注册为控制器
@RestController
//定义这个控制器的接口url前缀，这个控制器下所有的方法映射都会加上/test前缀
@RequestMapping("test")
public class TestController {
    //这个方法的完整url为 类上的url+自己的url=》test/api1 请求方式：get
    @GetMapping("api1")
    public String api1(){
        return "服务端说，hello api1";
    }

    @PostMapping("api2")
    public AjaxResult api2(){
        return AjaxResult.success("POST请求，服务端收到了");
    }

    @GetMapping("api3")
    public AjaxResult api3(String loginName,String password,Integer age){
        String rs="loginName:"+loginName;
        rs=rs+"password:"+password+"age:"+age;
        return AjaxResult.success(rs);
    }

    //@RequestParam指定参数是否必须传递（required属性），指定传递的参数名（name属性），指定后台接收的参数名（定义的变量loginName）
    //当传递参数的name和接收参数的名称一摸一样的时候，可以去掉name属性
    @PostMapping("api3")
    public AjaxResult api31(@RequestParam(name="login_name",required = true) String loginName,@RequestParam(required=true) String password, Integer age){
        String rs="服务端接收到POST请求参数，loginName:"+loginName;
        rs=rs+"password:"+password+"age:"+age;
        return AjaxResult.success(rs);
    }

    @GetMapping("api4")
    public AjaxResult api4(String loginName, HttpServletRequest request){
        String rs="loginName:"+loginName;
        Integer age=(Integer)request.getAttribute("age");
        String gender=(String)request.getAttribute("gender");
        rs=rs+"临时决定增加的参数，age:"+age+"gender:"+gender;
        return AjaxResult.success(rs);
    }

    //处理带有url占位符号的
    //完成的url test/remove/任意字段
    @PostMapping("remove/(userId)")
    public AjaxResult removeById(@PathVariable Integer userId){
        return AjaxResult.success("想要删除用户的用户Id:"+userId);
    }

    //使用对象接受请求的参数 当请求参数和一个对象的属性完全一样的时候，可以直接使用对象接收
    @PostMapping("api6")
    public AjaxResult api6(SysUser user){
        System.out.println(user.toString());
        return AjaxResult.success(user);
    }

    //接收json数据一般在请求体中使用RequestBody 接收
    //json传递参数，并封装到对象中
    @PostMapping("api7")
    public AjaxResult api7(@RequestBody SysUser user){
        System.out.println(user.toString());
        return AjaxResult.success(user);
    }

    @PostMapping("api8")
    public AjaxResult api8(@RequestBody Map<String,Object> map){
        map.forEach((key,value)->{
            System.out.println(key+":"+value);
        });
        return AjaxResult.success();
    }
}
