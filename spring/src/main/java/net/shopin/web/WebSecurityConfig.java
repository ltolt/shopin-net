/**
 * @Probject Name: spring
 * @Path: net.shopin.web.WebSecurityConfig.java
 * @Create By kongm
 * @Create In 2013-11-26 下午2:59:04
 * TODO
 */
package net.shopin.web;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

/**
 * @Class Name WebSecurityConfig
 * @Author kongm
 * @Create In 2013-11-26
 */
@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{

	@Override
	protected void configure(AuthenticationManagerBuilder auth)
			throws Exception {
		auth.ldapAuthentication()
			.userDnPatterns("uid={0},ou=people")
			.groupSearchBase("ou=groups")
			.contextSource()
			.ldif("classpath:test-server.ldif");
	}
	
	
	

}
