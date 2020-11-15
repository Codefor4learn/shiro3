package com.hausen.shiro3.config.shiro;

import com.hausen.shiro3.config.shiro.token.MyToken;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.pam.ModularRealmAuthenticator;
import org.apache.shiro.realm.Realm;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.Collection;


public class MyModularRealmAuthenticator extends ModularRealmAuthenticator {

    Logger logger = LoggerFactory.getLogger(MyModularRealmAuthenticator.class);

    @Override
    protected AuthenticationInfo doAuthenticate(AuthenticationToken authenticationToken) throws AuthenticationException {
        logger.info("----------MyModularRealmAuthenticator");

        this.assertRealmsConfigured();
        //获取登录方式
        MyToken myToken = (MyToken)authenticationToken;
        String loginType = myToken.getLoginType();

        Collection<Realm> realms = this.getRealms();

        // 剔除不需要的realm
        Collection<Realm> typeRealms = new ArrayList<Realm>();
        for(Realm realm : realms){
            if(realm.getName().startsWith(loginType)){
                typeRealms.add(realm);
            }
        }
        if(realms.size() == 1){
            this.doSingleRealmAuthentication((Realm)typeRealms.iterator().next(), authenticationToken);
        }else{
            this.doMultiRealmAuthentication(typeRealms, authenticationToken);
        }

        return super.doAuthenticate(authenticationToken);
    }
}
