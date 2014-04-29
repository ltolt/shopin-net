package net.shopin.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import net.shopin.ldap.ws.client.Role;
import net.shopin.ldap.ws.client.SystemWSImpl;
import net.shopin.ldap.ws.client.SystemWSImplService;

import org.springframework.ldap.core.DirContextOperations;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.ldap.userdetails.LdapAuthoritiesPopulator;

/**
 * ldap验证工具。
 * 
 * @author j
 * 
 */
public class CompanyAuthoritiesPopulator implements LdapAuthoritiesPopulator {

	@Override
	public Collection<? extends GrantedAuthority> getGrantedAuthorities(
			DirContextOperations arg0, String username) {

		String urlStr = "http://172.16.103.165/uac/services/sysService?wsdl";
		SystemWSImpl systemWs = SystemWSImplService.getPort(urlStr);

		List<Role> roleList = systemWs.findRolesByUserId(username);

		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();

		for (Role item : roleList) {

			authorities.add(new SimpleGrantedAuthority(item.getDn()));
		}

		return authorities;

	}

}
