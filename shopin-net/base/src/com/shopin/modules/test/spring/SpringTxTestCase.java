package com.shopin.modules.test.spring;


import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.EncodedResource;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.simple.SimpleJdbcTemplate;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.test.context.transaction.TransactionalTestExecutionListener;
import org.springframework.test.jdbc.SimpleJdbcTestUtils;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2010-1-19
 * Time: 17:04:55
 * Spring的支持数据库事务和依赖注入的JUnit4 集成测试基类.
 * @see SpringContextTestCase
 */
@Transactional
@TestExecutionListeners(TransactionalTestExecutionListener.class)
@TransactionConfiguration(defaultRollback = false) 
public class SpringTxTestCase extends SpringContextTestCase {

	protected SimpleJdbcTemplate simpleJdbcTemplate;

	protected String sqlScriptEncoding;

	protected SessionFactory sessionFactory;


	//-- JdbcTemplate函数--//
	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.simpleJdbcTemplate = new SimpleJdbcTemplate(dataSource);
	}

	public void setSqlScriptEncoding(String sqlScriptEncoding) {
		this.sqlScriptEncoding = sqlScriptEncoding;
	}

	protected int countRowsInTable(String tableName) {
		return SimpleJdbcTestUtils.countRowsInTable(this.simpleJdbcTemplate, tableName);
	}

	protected int deleteFromTables(String... names) {
		return SimpleJdbcTestUtils.deleteFromTables(this.simpleJdbcTemplate, names);
	}

	protected void executeSqlScript(String sqlResourcePath, boolean continueOnError) throws DataAccessException {

		Resource resource = this.applicationContext.getResource(sqlResourcePath);
		SimpleJdbcTestUtils.executeSqlScript(this.simpleJdbcTemplate, new EncodedResource(resource,
			this.sqlScriptEncoding), continueOnError);
	}

	//-- SessionFactory函数--//


	/**
	 * 刷新sessionFactory,强制Hibernate执行SQL以验证ORM配置.
	 * 因为没有执行commit操作,不会更改测试数据库.
	 *
	 * @see #flush(String)
	 */

	@Autowired(required=false)
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	protected void flush() {
		sessionFactory.getCurrentSession().flush();
	}

	/**
	 * 将对象从session中消除, 用于测试初对象的始化情况.
	 *
	 */
	protected void evict(final Object entity) {
		sessionFactory.getCurrentSession().evict(entity);
	}

}
