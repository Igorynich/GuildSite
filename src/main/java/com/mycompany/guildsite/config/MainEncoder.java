package com.mycompany.guildsite.config;


import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class MainEncoder {
    public static void main(String[] args) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        System.out.println("phoenix - "+ encoder.encode("phoenix"));
        System.out.println("blabla - "+ encoder.encode("blabla"));
    }
}
