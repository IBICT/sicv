package br.com.ibict.acv.sicv;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import br.com.ibict.sicv.enums.EnumProfile;

public class ApplicationSecurity extends WebSecurityConfigurerAdapter {
	 
	    @Autowired
	    private CustomAuthProvider authenticationProvider;
	    
	    @Autowired
	    private CustomAuthenticationHandler authenticationHandler;
	    
	    @Override
	    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
	        auth.authenticationProvider(authenticationProvider);
	    }
	 
	    @Override
	    protected void configure(HttpSecurity http) throws Exception {
	    	//Spring Boot makes some static resources accessible by default through Ant matchers: /css/**, /js/**, /images/** and **/favicon.ico 
	    	//will be permitted by default.
	    	
	    	//TODO colocar outras authorities que faltam para definir os acessos aos revisores
	    	http
            .authorizeRequests()
            .antMatchers("/assets/**","/documents/**","/register/**").permitAll()
                .antMatchers("/admin/**").hasAnyAuthority(EnumProfile.ADMIN.name(),EnumProfile.QUALITY_REVIEWER.name(),EnumProfile.MANAGER.name())
                .anyRequest().authenticated()
                .and()
            .formLogin()
                .loginPage("/login").permitAll().failureUrl("/login?error=1").successHandler(authenticationHandler)
                .usernameParameter("email").passwordParameter("senha")
                .and()
                .exceptionHandling().accessDeniedPage("/403")
                .and()
            .logout()
                .logoutUrl("/login?logout")
                .logoutSuccessUrl("/login?logout=true")
                .invalidateHttpSession(true)
                .permitAll();
	    	http.headers().frameOptions().sameOrigin();
	    	http.csrf().disable();
	    }
	    
	    @Override
	    public void configure(WebSecurity web) throws Exception {
	        web.ignoring().antMatchers("/resources/**","/admin/ilcd/**","/headerUsers**",
	        			"/admin/notifications/**", "/admin/technicalreviewer/**", "/documents/**");
	    }
}
