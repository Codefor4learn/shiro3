package com.hausen.shiro3.config.shiro.token;

import org.apache.shiro.authc.UsernamePasswordToken;

public class MyToken extends UsernamePasswordToken {

    String loginType;

    public MyToken(String username, String  password, String loginType) {
        super(username, password);
        this.loginType = loginType;
    }

    public String getLoginType() {
        return loginType;
    }

    public void setLoginType(String loginType) {
        this.loginType = loginType;
    }
}
