/**
 * @Probject Name: business
 * @Path: net.shopin.base.BaseTestContext.java
 * @Create By kongm
 * @Create In 2013-6-6 下午4:48:34
 * TODO
 */
package net.shopin.base;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.transaction.TransactionConfiguration;

/**
 * @Desc  测试基类(继承它可实现使用事务的单元测试)
 * @Class Name BaseTestContext
 * @Author kongm
 * @Create In 2013-6-6
 */
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
public class BaseTestContext extends AbstractTransactionalJUnit4SpringContextTests{

}
