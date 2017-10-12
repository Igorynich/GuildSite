package com.mycompany.guildsite.config;

import com.mycompany.guildsite.controller.LogRequestInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.validation.Validator;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

@Configuration
@ComponentScan(basePackages={"com.mycompany.guildsite.*"})
@EnableWebMvc
public class MvcConfiguration extends WebMvcConfigurerAdapter{

	@Autowired
	private LogRequestInterceptor logRequestInterceptor;

	/*@Bean
	public ViewResolver getViewResolver(){
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		return resolver;
	}*/
	@Bean
	public ViewResolver getViewResolver(){
		return new TilesViewResolver();
	}
	@Bean
	public MessageSource messageSource(){
		ResourceBundleMessageSource rbms = new ResourceBundleMessageSource();
		rbms.setBasenames("messages","error_messages");

		rbms.setDefaultEncoding("UTF-8");
		return rbms;
	}

	@Bean
	public TilesConfigurer tilesConfigurer(){
		TilesConfigurer tilesConfigurer = new TilesConfigurer();
		tilesConfigurer.setDefinitions(new String[] {"/WEB-INF/layout/tiles.xml"});
		tilesConfigurer.setCheckRefresh(true);
		return tilesConfigurer;
	}


	/*@Bean
	public Validator validator(){
		LocalValidatorFactoryBean val = new LocalValidatorFactoryBean();
		val.setValidationMessageSource(messageSource());
		return val;
	}*/

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(logRequestInterceptor).addPathPatterns("/", "/vsezayavki");
	}

	@Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}


	
}
