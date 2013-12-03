/**
 * @Probject Name: spring
 * @Path: net.shopin.config.SecurityConfig.java
 * @Create By kongm
 * @Create In 2013-12-3 上午11:21:51
 * TODO
 */
package net.shopin.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

/**
 * @Class Name SecurityConfig
 * @Author kongm
 * @Create In 2013-12-3
 */
@EnableWebSecurity
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	
	
	
	

	@Override
	protected void configure(AuthenticationManagerBuilder auth)
			throws Exception {
		auth.inMemoryAuthentication()
			.withUser("letsnosh").password("noshing").roles("USER");
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests().antMatchers("/orders").hasRole("USER")
			.anyRequest().anonymous().and().httpBasic();
	}


	
	
	
}
