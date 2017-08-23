
package com.mycompany.guildsite.config;

import java.io.IOException;
import java.util.Properties;
import javax.sql.DataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;
import org.apache.commons.dbcp.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;

import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@ComponentScan(basePackages = { "com.mycompany.guildsite.*" })
@PropertySource("classpath:database.properties")
@EnableTransactionManagement
class DBConfig {

    @Autowired
    private Environment env;
    
    @Bean
    public DataSource dataSource() {
        BasicDataSource ds = new BasicDataSource();
        ds.setDriverClassName(env.getProperty("database.driverClassName"));
        ds.setUrl(env.getProperty("database.url"));
        ds.setUsername(env.getProperty("database.username"));
        ds.setPassword(env.getProperty("database.password"));
        return ds;
    }

    @Bean
    public SessionFactory sessionFactory() {
        LocalSessionFactoryBean sfb = new LocalSessionFactoryBean();
        sfb.setDataSource(dataSource());
        sfb.setPackagesToScan(new String[]{"com.mycompany.guildsite"});

        Properties props = new Properties();
        props.setProperty("hibernate.dialect", env.getProperty("hibernate.dialect"));
        props.setProperty("hibernate.connection.CharSet", env.getProperty("hibernate.connection.CharSet"));
        props.setProperty("hibernate.connection.characterEncoding", env.getProperty("hibernate.connection.characterEncoding"));
        props.setProperty("hibernate.connection.useUnicode", env.getProperty("hibernate.connection.useUnicode"));
        props.setProperty("hibernate.show_sql", env.getProperty("hibernate.show_sql"));
        props.setProperty("hibernate.format_sql", env.getProperty("hibernate.format_sql"));
        
        sfb.setHibernateProperties(props);

        try {
            sfb.afterPropertiesSet();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return sfb.getObject();
    }

    @Bean
    public HibernateTransactionManager hibernateTransactionManager() {
        return new HibernateTransactionManager(sessionFactory());
    }
}
