package net.shopin.service;

import net.shopin.api.ISecurityService;
import net.shopin.view.MemberVO;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SecurityServiceImplTest {
    private static AbstractApplicationContext context;
	   private ISecurityService securityService;
	  @Before
	  public void setUp() throws Exception {
	      context = new ClassPathXmlApplicationContext("spring.xml");
	      this.securityService = (ISecurityService) context.getBean("securityService");
	  }
	  
//	  @Test
	  public void addLoginUserTest(){
	      MemberVO memberVo = new MemberVO();
	      memberVo.setSid(10+"");
	      memberVo.setMemName("张三");
	      memberVo.setMobile("15811444444");
	      memberVo.setMemEmail("1212121212@qq.com");
	      memberVo.setMemPwd("123456");
	      memberVo.setOldPwd("654321");
	      securityService.addLoginUser(1+"", memberVo);
	  }
	  
//	  @Test
	  public void getLoginUserIdTest(){
	      MemberVO memberVo = securityService.getLoginUserId(1+"");
	      System.out.println(memberVo.toString());
	  }
	  
//	  @Test
	  public void isUserLoginTest(){
	      boolean flag = securityService.isUserLogin("1");
	      System.out.println(flag);
	  }
	  @Test
	  public void userLogoutTest(){
	      securityService.userLogout("1");
	  }
}
