/**
 * @Probject Name: web-spring
 * @Path: net.shopin.config.SecurityConfig.java
 * @Create By kongm
 * @Create In 2013-12-16 上午11:22:01
 * TODO
 */
package net.shopin.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

/**
 * @Class Name SecurityConfig
 * @Author kongm
 * @Create In 2013-12-16
 */
@EnableWebSecurity
@Configuration
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter{

	@Override
	protected void registerAuthentication(AuthenticationManagerBuilder auth)
			throws Exception {
		auth.inMemoryAuthentication().withUser("kongming")
			  .password("111111").roles("USER");
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeUrls()
			.antMatchers("/order/**").hasRole("USER")
			.antMatchers("/checkout").hasRole("USER")
			.anyRequest().anonymous()
			.and()
			//this will generate a login form if none is supplied
			.formLogin();
	}

	
	@Bean
	@Override
	public AuthenticationManager authenticationManagerBean() throws Exception {
		return super.authenticationManagerBean();
	}
	
	
	
	
	

}
