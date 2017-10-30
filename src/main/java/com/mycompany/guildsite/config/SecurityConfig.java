
package com.mycompany.guildsite.config;

import com.mycompany.guildsite.controller.HomeController;
import com.mycompany.guildsite.data.GSUserService;
import com.mycompany.guildsite.data.UsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.apache.log4j.Logger;


import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@ComponentScan(basePackages = { "com.mycompany.guildsite.*" })
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{

    private static final Logger logger = Logger.getLogger(SecurityConfig.class);

    @Autowired
    private UsersRepository ur;


    
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests().

                antMatchers("/vsezayavki/1").access("hasAnyRole('ROLE_ADMIN', 'ROLE_OFFICER')").
                antMatchers("/vsezayavki/2").access("hasAnyRole('ROLE_ADMIN', 'ROLE_2NDSTATIC')").
                antMatchers("/zayavka/**").access("(isAuthenticated() or isRememberMe()) and hasAnyRole('ROLE_ADMIN', 'ROLE_OFFICER', 'ROLE_2NDSTATIC')").

                anyRequest().permitAll().
                and().
                formLogin().  //login configuration
                loginPage("/gslogin").
                loginProcessingUrl("/gslogin").
                successForwardUrl("/loginsuccess").
                failureForwardUrl("/loginfailure").
                usernameParameter("gsusername").
                passwordParameter("gspassword").
//                defaultSuccessUrl("/").
                and().logout()    //logout configuration
                .logoutUrl("/logout")
                .logoutSuccessUrl("/logoutsuccess")
                .and().exceptionHandling(). //exception handling configuration
                /*.accessDeniedPage("/user/error").*/
                and().
                rememberMe().tokenValiditySeconds(2419200);

    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(new GSUserService(ur)).passwordEncoder(new BCryptPasswordEncoder());
    }
    
    
}
