package net.shopin.service;

import java.util.Map;

import net.shopin.api.ISysParameterService;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.util.Assert;

/**
 * 获取参数类型测试类
 * @Class Name SysParameterServiceImplTest
 * @Author huyy
 * @Create In 2013-7-12
 */
public class SysParameterServiceImplTest {
	   private static AbstractApplicationContext context;
	   private ISysParameterService sysParameterService;
	  @Before
	  public void setUp() throws Exception {
	      context = new ClassPathXmlApplicationContext("spring.xml");
	      this.sysParameterService = (ISysParameterService) context.getBean("sysParameterService");

	  }
	  @Test
	  public void testGetSysParameter(){
		  Map<String, String> sysParaMap=this.sysParameterService.getSysParameter("TEMPLATE_PARAMETER");
		  Assert.notNull(sysParaMap,"must not be null");
		  for (Map.Entry<String, String> map:sysParaMap.entrySet()) {
			System.out.println("key:=="+map.getKey()+"=======");
			System.out.println("value:=="+map.getValue()+"======");
		}
	  }
}
