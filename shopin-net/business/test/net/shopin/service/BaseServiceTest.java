//package net.shopin.service;
//
//import org.dbunit.Assertion;
//import org.dbunit.database.DatabaseConfig;
//import org.dbunit.database.DatabaseConnection;
//import org.dbunit.database.IDatabaseConnection;
//import org.dbunit.dataset.*;
//import org.dbunit.dataset.xml.FlatXmlDataSet;
//import org.dbunit.ext.oracle.Oracle10DataTypeFactory;
//import org.dbunit.ext.oracle.OracleDataTypeFactory;
//import org.dbunit.operation.DatabaseOperation;
//import org.junit.Assert;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.core.io.ClassPathResource;
//import org.springframework.jdbc.datasource.DataSourceUtils;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
//import org.springframework.test.context.transaction.TransactionConfiguration;
//
//import javax.sql.DataSource;
//import java.sql.SQLException;
//
///**
// * Created by IntelliJ IDEA.
// * User: lixy
// * Date: 2010-1-18
// * Time: 18:33:03
// * <p/>
// * 测试基础类
// * <p/>
// * 用@Rollback(true)可以覆盖默认事务策略。
// */
//@ContextConfiguration(locations = {"classpath:applicationContext*.xml"})
//@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = true)
//public abstract class BaseServiceTest extends AbstractTransactionalJUnit4SpringContextTests {
//
//    @Autowired
//    private DataSource dataSource;
//
//    //DBUnit的数据库连接
//    private IDatabaseConnection conn;
//
//    /**
//     * 初始化DBUnit的数据库连接，在Spring事务中。
//     *
//     * @throws Exception
//     */
//    public void initConnectionInTX() throws Exception {
//        conn = new DatabaseConnection(DataSourceUtils.getConnection(dataSource), "lxy"); //lxy是oracle的SCHEMA
//        //ORACLE数据类型
//        conn.getConfig().setProperty(DatabaseConfig.PROPERTY_DATATYPE_FACTORY, new Oracle10DataTypeFactory());
//    }
//
//    /**
//     * 不在Spring事务中的DBUnit的数据库连接。
//     *
//     * @throws Exception
//     */
//    public void initConnection() throws Exception {
//        conn = new DatabaseConnection(dataSource.getConnection(), "lxy");
//        conn.getConfig().setProperty(DatabaseConfig.PROPERTY_DATATYPE_FACTORY, new Oracle10DataTypeFactory());
//    }
//
//    /**
//     * 清空file中包含的表中的数据，并插入file中指定的数据
//     *
//     * @param file
//     * @throws Exception
//     */
//    protected void setUpDataSet(String file) throws Exception {
//        /*
//        IDataSet dataset = new FlatXmlDataSet(new ClassPathResource(file).getFile());
//        */
//        /*
//        FlatXmlDataSetBuilder builder = new FlatXmlDataSetBuilder();
//        builder.setColumnSensing(true);   //更灵活插入数据,不会仅仅根据表的第一行.
//        IDataSet dataSet = builder.build(new File(file));
//        */
//        ReplacementDataSet dataSet = new ReplacementDataSet(
//                new FlatXmlDataSet(new ClassPathResource(file).getFile()));
//        dataSet.addReplacementObject("[NULL]", null);
//        DatabaseOperation.CLEAN_INSERT.execute(conn, dataSet);
//    }
//
//    /**
//     * 验证file中包含的表中的数据和数据库中的相应表的数据是否一致
//     *
//     * @param file
//     * @throws Exception
//     */
//    protected void verifyDataSet(String file) throws Exception {
//        IDataSet expected = new FlatXmlDataSet(new ClassPathResource(file)
//                .getFile());
//        IDataSet dataset = conn.createDataSet();
//
//        for (String tableName : expected.getTableNames()) {
//            Assertion.assertEquals(expected.getTable(tableName), dataset
//                    .getTable(tableName));
//        }
//    }
//
//    /**
//     * 清空指定的表中的数据
//     *
//     * @param tableName
//     * @throws Exception
//     */
//    protected void clearTable(String tableName) throws Exception {
//        DefaultDataSet dataset = new DefaultDataSet();
//        dataset.addTable(new DefaultTable(tableName));
//        DatabaseOperation.DELETE_ALL.execute(conn, dataset);
//    }
//
//    /**
//     * 验证指定的表为空
//     *
//     * @param tableName
//     * @throws DataSetException
//     * @throws SQLException
//     */
//    protected void verifyEmpty(String tableName) throws DataSetException,
//            SQLException {
//        Assert.assertEquals(0, conn.createDataSet().getTable(tableName)
//                .getRowCount());
//    }
//
//}
