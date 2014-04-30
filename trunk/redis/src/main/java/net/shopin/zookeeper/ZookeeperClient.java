/**
 * 
 */
package net.shopin.zookeeper;

import java.io.IOException;

import org.apache.log4j.xml.DOMConfigurator;
import org.apache.zookeeper.WatchedEvent;
import org.apache.zookeeper.Watcher;
import org.apache.zookeeper.ZooKeeper;

/**
 * @author kongming
 *
 */
public class ZookeeperClient implements Watcher {
	
	protected static ZooKeeper zk = null;
	
	protected static Integer mutex;
	
	int sessionTimeout = 10000;
	
	protected String root;
	
	public ZookeeperClient(String connectString) {
		if(zk == null){
			try {
				String configFile = this.getClass().getResource("/").getPath() + "net/shopin/zookeeper/log4j.xml";
				DOMConfigurator.configure(configFile);
				System.out.println("创建一个新的连接:");
				zk = new ZooKeeper(connectString, sessionTimeout, this);
				mutex = new Integer(-1);
			} catch (IOException e) {
				zk = null;
			}
		}
		
	}

	/* (non-Javadoc)
	 * @see org.apache.zookeeper.Watcher#process(org.apache.zookeeper.WatchedEvent)
	 */
	@Override
	synchronized public void process(WatchedEvent event) {
		synchronized (mutex) {
			mutex.notify();
		}
	}

}
