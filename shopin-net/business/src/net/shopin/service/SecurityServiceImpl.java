package net.shopin.service;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.shopin.modules.utils.Codec;

import net.rubyeye.xmemcached.MemcachedClient;
import net.shopin.api.ISecurityService;
import net.shopin.view.MemberVO;

/**
 * 
 * @Class Name SecurityServiceImpl
 * @Author jiangzx
 * @Create In 2013-8-14
 */
@Transactional(readOnly = true)
@Component("securityService")
@Scope("prototype")
public class SecurityServiceImpl implements ISecurityService {

	@Resource(name = "securityCacheClient")
	private MemcachedClient memcachedClient = null;

	@Override
	public void addLoginUser(String uid, MemberVO memberVo) {
		try {
			this.memcachedClient.add(Codec.encodeMd5(uid + SecurityServiceImpl.class.getName() ), 0, memberVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public MemberVO getLoginUserId(String uid) {
		try {
			return (MemberVO) this.memcachedClient.get(Codec.encodeMd5(uid + SecurityServiceImpl.class.getName()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean isUserLogin(String uid) {
		try {
			return this.memcachedClient.get(Codec.encodeMd5(uid + SecurityServiceImpl.class.getName())) != null;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public void userLogout(String uid) {
		try {
			this.memcachedClient.delete(Codec.encodeMd5(uid + SecurityServiceImpl.class.getName()));
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
