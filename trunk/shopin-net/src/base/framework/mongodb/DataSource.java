package base.framework.mongodb;

import javax.net.SocketFactory;

import org.springframework.util.Assert;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBDecoderFactory;
import com.mongodb.DBEncoderFactory;
import com.mongodb.Mongo;
import com.mongodb.MongoOptions;

/**
 * Mongodb的连接池。 支持Mongodb的各类参数的初始化。
 * 
 * 
 * @Class Name DataSource
 * @Author j
 * @Create In 2012-8-16
 */
public class DataSource {

	// 配置文件对象
	private Config config = new Config();

	public Config getConfig() {
		return config;
	}

	// mongodb的连接池实例。
	private Mongo m;

	public void init() throws IllegalArgumentException {

		try {

			MongoOptions mo = new MongoOptions();

			config.setMongoOptions(mo);

			this.m = new Mongo(new com.mongodb.ServerAddress(config.host,
					config.port.intValue()), mo);

		} catch (Exception e) {
			throw new IllegalArgumentException("Mongodb初始化参数不正确："
					+ e.getMessage());
		}
	}

	/**
	 * 关闭连接池。
	 * 
	 * @Methods Name close
	 * @Create In 2012-8-16 By j void
	 */
	public void close() {
		m.close();
	}

	/**
	 * 获取默认DB对象。
	 * 
	 * @Methods Name getDB
	 * @Create In 2012-8-16 By j
	 * @return DB
	 */
	public DB getDB() {
		Assert.notNull(config.defaultDBName);
		return m.getDB(config.defaultDBName);
	}

	/**
	 * 根据指定名称获取DB对象。
	 * 
	 * @Methods Name getDB
	 * @Create In 2012-8-16 By j
	 * @param dbName
	 * @return DB
	 */
	public DB getDB(String dbName) {
		Assert.notNull(dbName);
		return m.getDB(dbName);
	}

	/**
	 * 根据默认DB名获取集合。
	 * 
	 * @Methods Name getCollection
	 * @Create In 2012-8-16 By j
	 * @param collectionName
	 * @return
	 * @throws Exception
	 *             DBCollection
	 */
	public DBCollection getCollection(String collectionName) throws Exception {

		Assert.notNull(collectionName);
		Assert.notNull(config.defaultDBName);
		DB db = m.getDB(config.defaultDBName);

		return db.getCollection(collectionName);
	}

	/**
	 * 指定DB名称获取集合。
	 * 
	 * @Methods Name getCollection
	 * @Create In 2012-8-16 By j
	 * @param collectionName
	 * @param dbName
	 * @return
	 * @throws Exception
	 *             DBCollection
	 */
	public DBCollection getCollection(String collectionName, String dbName)
			throws Exception {

		Assert.notNull(dbName);
		DB db = m.getDB(dbName);

		return db.getCollection(collectionName);
	}

	/**
	 * 内部类，用于保存Mongodb客户端连接池的基本信息。
	 * 
	 * @Class Name Config
	 * @Author 王檬
	 * @Create In 2012-8-16
	 */
	public class Config {

		private Integer connectionsPerHost;

		private Integer port;

		private String host;

		private Integer connectTimeout;

		private DBDecoderFactory dbDecoderFactory;

		private DBEncoderFactory dbEncoderFactory;

		private String description;

		private Boolean fsync;

		private Boolean j;

		private Integer maxAutoConnectRetryTime;

		private Integer maxWaitTime;

		private Boolean safe;

		private SocketFactory socketFactory;

		private Boolean socketKeepAlive;

		private Integer socketTimeout;

		private Integer threadsAllowedToBlockForConnectionMultiplier;

		private Integer w;

		private Integer wtimeout;

		private Boolean autoConnectRetry;

		private String defaultDBName;

		public void setConnectionsPerHost(Integer connectionsPerHost) {
			this.connectionsPerHost = connectionsPerHost;
		}

		public void setPort(Integer port) {
			this.port = port;
		}

		public void setHost(String host) {
			this.host = host;
		}

		public void setConnectTimeout(Integer connectTimeout) {
			this.connectTimeout = connectTimeout;
		}

		public void setDbDecoderFactory(DBDecoderFactory dbDecoderFactory) {
			this.dbDecoderFactory = dbDecoderFactory;
		}

		public void setDbEncoderFactory(DBEncoderFactory dbEncoderFactory) {
			this.dbEncoderFactory = dbEncoderFactory;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		public void setFsync(Boolean fsync) {
			this.fsync = fsync;
		}

		public void setJ(Boolean j) {
			this.j = j;
		}

		public void setMaxAutoConnectRetryTime(Integer maxAutoConnectRetryTime) {
			this.maxAutoConnectRetryTime = maxAutoConnectRetryTime;
		}

		public void setMaxWaitTime(Integer maxWaitTime) {
			this.maxWaitTime = maxWaitTime;
		}

		public void setSafe(Boolean safe) {
			this.safe = safe;
		}

		public void setSocketFactory(SocketFactory socketFactory) {
			this.socketFactory = socketFactory;
		}

		public void setSocketKeepAlive(Boolean socketKeepAlive) {
			this.socketKeepAlive = socketKeepAlive;
		}

		public void setSocketTimeout(Integer socketTimeout) {
			this.socketTimeout = socketTimeout;
		}

		public void setThreadsAllowedToBlockForConnectionMultiplier(
				Integer threadsAllowedToBlockForConnectionMultiplier) {
			this.threadsAllowedToBlockForConnectionMultiplier = threadsAllowedToBlockForConnectionMultiplier;
		}

		public void setW(Integer w) {
			this.w = w;
		}

		public void setWtimeout(Integer wtimeout) {
			this.wtimeout = wtimeout;
		}

		public void setAutoConnectRetry(Boolean autoConnectRetry) {
			this.autoConnectRetry = autoConnectRetry;
		}

		public void setDefaultDBName(String defaultDBName) {
			this.defaultDBName = defaultDBName;
		}

		/**
		 * 根据配置链接属性。
		 * 
		 * @Methods Name setConfig
		 * @Create In 2012-8-16 By j
		 * @param mo
		 *            void
		 */
		public void setMongoOptions(MongoOptions mo) {
			if (this.connectionsPerHost != null) {
				mo.connectionsPerHost = this.connectionsPerHost;
			}

			if (this.connectTimeout != null) {
				mo.connectTimeout = this.connectTimeout;
			}

			if (this.dbDecoderFactory != null) {
				mo.dbDecoderFactory = this.dbDecoderFactory;

			}

			if (this.dbEncoderFactory != null) {
				mo.dbEncoderFactory = this.dbEncoderFactory;
			}

			if (this.description != null) {
				mo.description = this.description;
			}
			if (this.fsync != null) {
				mo.fsync = this.fsync;
			}

			if (this.j != null) {
				mo.j = this.j;
			}

			if (this.maxAutoConnectRetryTime != null) {
				mo.maxAutoConnectRetryTime = this.maxAutoConnectRetryTime;
			}

			if (this.maxWaitTime != null) {
				mo.maxWaitTime = this.maxWaitTime;
			}

			if (this.safe != null) {
				mo.safe = this.safe;
			}

			if (this.socketFactory != null) {
				mo.socketFactory = this.socketFactory;
			}

			if (this.socketKeepAlive != null) {
				mo.socketKeepAlive = this.socketKeepAlive;
			}

			if (this.socketTimeout != null) {
				mo.socketTimeout = this.socketTimeout;
			}
			if (this.threadsAllowedToBlockForConnectionMultiplier != null) {
				mo.threadsAllowedToBlockForConnectionMultiplier = this.threadsAllowedToBlockForConnectionMultiplier;
			}

			if (this.wtimeout != null) {
				mo.wtimeout = this.wtimeout;
			}

			if (this.w != null) {
				mo.w = this.w;
			}

			if (this.autoConnectRetry != null) {
				mo.autoConnectRetry = this.autoConnectRetry;
			}

		}

	}

}
