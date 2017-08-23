package com.mycompany.guildsite.data;

import java.util.Arrays;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class GSUserService implements UserDetailsService {

    private UsersRepository ur;

    @Autowired
    public GSUserService(UsersRepository ur) {
        this.ur = ur;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserInfo ui = ur.findByUsername(username);
        GrantedAuthority authority = new SimpleGrantedAuthority(ui.getRole());
        User user = new User(ui.getUserName(), ui.getPassword(), Arrays.asList(authority));
        return user;
    }

}
