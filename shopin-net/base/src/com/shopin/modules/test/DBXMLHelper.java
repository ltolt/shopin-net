//package com.shopin.modules.test;
//
//import java.io.FileNotFoundException;
//import java.io.FileOutputStream;
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.SQLException;
//import java.util.HashSet;
//import java.util.Iterator;
//import java.util.Map;
//import java.util.Set;
//
//import org.dbunit.DatabaseUnitException;
//import org.dbunit.database.DatabaseConfig;
//import org.dbunit.database.DatabaseConnection;
//import org.dbunit.database.ForwardOnlyResultSetTableFactory;
//import org.dbunit.database.IDatabaseConnection;
//import org.dbunit.database.QueryDataSet;
//import org.dbunit.database.search.TablesDependencyHelper;
//import org.dbunit.dataset.CachedDataSet;
//import org.dbunit.dataset.DataSetException;
//import org.dbunit.dataset.IDataSet;
//import org.dbunit.dataset.ITableIterator;
//import org.dbunit.dataset.stream.IDataSetProducer;
//import org.dbunit.dataset.stream.StreamingDataSet;
//import org.dbunit.dataset.xml.FlatXmlDataSet;
//import org.dbunit.dataset.xml.FlatXmlProducer;
//import org.dbunit.dataset.xml.XmlDataSet;
//import org.dbunit.dataset.xml.XmlProducer;
//import org.dbunit.operation.DatabaseOperation;
//import org.xml.sax.InputSource;
//
///**
// * Created by IntelliJ IDEA.
// * User: yanwt
// * Date: 2010-1-19
// * Time: 18:03:15
// */
//
//public class DBXMLHelper {
//
//    // partial database export
//    public static void exportPartial(IDatabaseConnection connection,
//            String fileName, Set tableNames, Map sqls, boolean streamed,
//            boolean flat) throws SQLException, DataSetException,
//            FileNotFoundException, IOException {
//        connection.getConfig().setFeature(
//                DatabaseConfig.FEATURE_QUALIFIED_TABLE_NAMES, true);
//        if (streamed)
//            connection.getConfig().setProperty(
//                    DatabaseConfig.PROPERTY_RESULTSET_TABLE_FACTORY,
//                    new ForwardOnlyResultSetTableFactory());
//
//        QueryDataSet partialDataSet = new QueryDataSet(connection);
//        // all data
//        if (null != tableNames)
//            for (Iterator it = tableNames.iterator(); it.hasNext();) {
//                partialDataSet.addTable((String) it.next());
//            }
//        // sql query
//        if (null != sqls)
//            for (Iterator it = sqls.keySet().iterator(); it.hasNext();) {
//                String key = (String) it.next();
//                partialDataSet.addTable(key, (String) sqls.get(key));
//            }
//
//        if (flat)
//            FlatXmlDataSet
//                    .write(partialDataSet, new FileOutputStream(fileName));
//        else
//            XmlDataSet.write(partialDataSet, new FileOutputStream(fileName));
//    }
//
//    // full database export
//    public static void exportDatabase(IDatabaseConnection connection,
//            String fileName, boolean streamed, boolean flat)
//            throws SQLException, DatabaseUnitException, FileNotFoundException,
//            IOException {
//        if (streamed)
//            connection.getConfig().setProperty(
//                    DatabaseConfig.PROPERTY_RESULTSET_TABLE_FACTORY,
//                    new ForwardOnlyResultSetTableFactory());
//
//
//        String[] depTableNames = new String[2];
//        depTableNames[0]="PRO_SUPPLY_PRICE";
//        depTableNames[1]="pro_detail";
//        IDataSet fullDataSet = connection.createDataSet(depTableNames);
//        if (flat)
//            FlatXmlDataSet.write(fullDataSet, new FileOutputStream(fileName));
//        else
//            XmlDataSet.write(fullDataSet, new FileOutputStream(fileName));
//    }
//
//    public static void refreshData(IDatabaseConnection connection,
//            String input, boolean streamed, boolean flat)
//            throws DatabaseUnitException, SQLException {
//        IDataSetProducer producer;
//        IDataSet dataSet;
//        if (flat)
//            producer = new FlatXmlProducer(new InputSource(input));
//        else
//            producer = new XmlProducer(new InputSource(input));
//        if (streamed)
//            dataSet = new StreamingDataSet(producer);
//        else
//            dataSet = new CachedDataSet(producer);
//
//        // 执行插入操作
//        DatabaseOperation.REFRESH.execute(connection, dataSet);
//    }
//
//    public static void cleanInsertData(IDatabaseConnection connection,
//            String input, boolean flat) throws DatabaseUnitException,
//            SQLException {
//        IDataSetProducer producer;
//        IDataSet dataSet;
//        if (flat)
//            producer = new FlatXmlProducer(new InputSource(input));
//        else
//            producer = new XmlProducer(new InputSource(input));
//
//        dataSet = new CachedDataSet(producer);
//
//        // 执行插入操作
//        DatabaseOperation.CLEAN_INSERT.execute(connection, dataSet);
//    }
//
//}