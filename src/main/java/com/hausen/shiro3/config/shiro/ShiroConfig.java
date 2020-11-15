package com.hausen.shiro3.config.shiro;

import com.hausen.shiro3.config.shiro.realm.ManagerRealm;
import com.hausen.shiro3.config.shiro.realm.UserRealm;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.realm.Realm;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

@Configuration
public class ShiroConfig {

    // 配置自定义认证器
    @Bean
    public MyModularRealmAuthenticator getMyModularRealmAuthenticator(){
        return new MyModularRealmAuthenticator();
    }

    @Bean
    public UserRealm getUserRealm(){
        UserRealm userRealm = new UserRealm();
        return userRealm;
    }

    @Bean
    public ManagerRealm getManagerRealm(){
        ManagerRealm managerRealm = new ManagerRealm();
        return managerRealm;
    }

    @Bean
    public DefaultWebSecurityManager getDefaultWebSecurityManager(){

        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();

        securityManager.setAuthenticator(getMyModularRealmAuthenticator());

        Collection<Realm> realms = new ArrayList<Realm>();
        realms.add(getUserRealm());
        realms.add(getManagerRealm());

        securityManager.setRealms(realms);
        //不能配置在这里，需要先配置认证器
        //securityManager.setAuthenticator(getMyModularRealmAuthenticator());

        return securityManager;
    }

    @Bean
    public ShiroFilterFactoryBean getShiroFilterFactoryBean(DefaultWebSecurityManager securityManager){

        ShiroFilterFactoryBean filter = new ShiroFilterFactoryBean();

        filter.setSecurityManager(securityManager);

        Map<String,String> filterMap = new HashMap<String, String>();
        filterMap.put("/","anon");
        filterMap.put("/login.html","anon");
        filterMap.put("/index.html","user");
        filterMap.put("/regist.html","anon");
        filterMap.put("/user/login","anon");
        filterMap.put("/user/regist","anon");
        filterMap.put("/static/**","anon");
        filterMap.put("/**","authc");

        return filter;
    }
}
