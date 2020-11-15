package com.hausen.shiro3.config.shiro.realm;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class ManagerRealm extends AuthorizingRealm {

    Logger logger = LoggerFactory.getLogger(ManagerRealm.class);

    @Override
    public String getName(){
        return "ManagerRealm";
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {

        logger.info("----------ManagerRealm");
        String username = (String) authenticationToken.getPrincipal();

        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(username,"222222",getName());


        return info;
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        return null;
    }
}
