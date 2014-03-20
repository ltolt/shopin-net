package net.shopin.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import net.shopin.ldap.ws.client.Role;
import net.shopin.ldap.ws.client.SystemWSImpl;
import net.shopin.ldap.ws.client.SystemWSImplService;

import org.springframework.dao.DataAccessException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.shopin.core.util.LoadProperties;

public class MyUserDetailService implements UserDetailsService {

	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException, DataAccessException {
		
		
		String urlStr = LoadProperties.readValue("wsClientUrl");
    	SystemWSImpl port = SystemWSImplService.getPort(urlStr);
    	
    	net.shopin.ldap.ws.client.User u=port.getUserDetailByUid(username);
    	String Uid=u.getUid();

    	List roleList=port.findRolesByUserId(username);
    	
    	String password=u.getPassword();
    	Collection<GrantedAuthority> auths = new ArrayList<GrantedAuthority>();
    	for(Iterator iter=roleList.iterator();iter.hasNext();){
    		Role r=(Role)iter.next();
    		GrantedAuthorityImpl auth = new GrantedAuthorityImpl(r.getCn());
    		auths.add(auth);
    	}
		
		User user = new User(username, password, true, true, true, true, auths);
		return user;
	}

}