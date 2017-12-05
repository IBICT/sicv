package br.com.ibict.acv.sicv;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
/**
 *	The class acts as the main entry point for our Spring Boot-based application. You can of course
 * define whatever bean is needed for your application here.
 * 
 */

@SpringBootApplication
public class Application extends SpringBootServletInitializer {

	@Bean
    public WebSecurityConfigurerAdapter webSecurityConfigurerAdapter() {
        return new ApplicationSecurity();
    }
	
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(Application.class);
	}

	public static void main(String[] args) throws Exception {
		SpringApplication.run(Application.class, args);
	}

}