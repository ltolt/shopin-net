package com.shopin.modules.test.spring;

/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2010-1-19
 * Time: 17:03:27
 */
import org.junit.Assert;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;
import org.springframework.test.context.support.DirtiesContextTestExecutionListener;

/**
 * Spring的支持依赖注入的JUnit4 集成测试基类.
 *
 * @author calvin
 */
//默认载入applicationContext-test.xml,子类中的@ContextConfiguration定义将合并父类的定义.
@ContextConfiguration(locations = { "/applicationContext-test.xml" })
@RunWith(SpringJUnit4ClassRunner.class)
@TestExecutionListeners( { DependencyInjectionTestExecutionListener.class, DirtiesContextTestExecutionListener.class })
public class SpringContextTestCase extends Assert implements ApplicationContextAware {

	protected Logger logger = LoggerFactory.getLogger(getClass());

	protected ApplicationContext applicationContext;

	public final void setApplicationContext(final ApplicationContext applicationContext) {
		this.applicationContext = applicationContext;
	}

	/**
	 * sleep等待,单位毫秒.
	 */
	protected void sleep(long millis) {
		try {
			Thread.sleep(millis);
		} catch (InterruptedException e) {//NOSONAR
		}
	}
}

