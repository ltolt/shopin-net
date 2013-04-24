package connect;

import java.util.Hashtable;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;

/**
 * 说明:
 *     测试ldap链接的测试类
 * @author k
 *
 */
public class LDAPTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		String root = "dc=maxcrc,dc=com";
		Hashtable env = new Hashtable();
		env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
		env.put(Context.PROVIDER_URL,"ldap://127.0.0.1:389/" + root);
		env.put(Context.SECURITY_AUTHENTICATION, "simple");
		env.put(Context.SECURITY_PRINCIPAL, "cn=Manager,dc=maxcrc,dc=com");
		env.put(Context.SECURITY_CREDENTIALS, "secret");
		
		DirContext ctx = null;
		
		try {
			ctx = new InitialDirContext(env);
			System.out.println("认证成功");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(ctx != null){
			try {
				ctx.close();
			} catch (NamingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.exit(0);
		}
		
		
		
		
		
	}

}
