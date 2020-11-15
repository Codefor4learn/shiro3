package com.hausen.shiro3.controller;

import com.hausen.shiro3.config.shiro.token.MyToken;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("user")
public class UserController {

    @RequestMapping("login")
    public String login(String userName,String userPwd,String loginType){


        try{
            MyToken token = new MyToken(userName,userPwd,loginType);
            Subject subject = SecurityUtils.getSubject();
            subject.login(token);
        }catch (Exception e){
            e.printStackTrace();
            return "login";
        }

        return "index";
    }
}
