/**
 * 
 */
package net.shopin.zookeeper;

import java.io.IOException;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.zookeeper.CreateMode;
import org.apache.zookeeper.KeeperException;
import org.apache.zookeeper.WatchedEvent;
import org.apache.zookeeper.Watcher;
import org.apache.zookeeper.ZooKeeper;
import org.apache.zookeeper.Watcher.Event.EventType;
import org.apache.zookeeper.Watcher.Event.KeeperState;
import org.apache.zookeeper.ZooDefs.Ids;
import org.apache.zookeeper.data.Stat;

/**
 * zookeeper连接类
 * @author kongming
 *
 */
public class ZkClient implements Watcher,Runnable {

	private final static Logger LOG = Logger.getLogger(ZkClient.class);
	
	private final ConcurrentHashMap<String, Set<ZkDataListener>> registerDataListener = new ConcurrentHashMap<String, Set<ZkDataListener>>();
	
	
	protected Map<String, String> ackCache = new ConcurrentHashMap<String, String>();
	
	 /**
     * zookeeper instance
     */
    private ZooKeeper zk = null;
    
    String zkServers;
    
    int sessionTimeout;
	
    
    
    
	public ZkClient(String zkServers, int sessionTimeout) throws IOException {
		this.zkServers = zkServers;
		this.sessionTimeout = sessionTimeout;
		zk = new ZooKeeper(zkServers,sessionTimeout,this);
	}




	/* (non-Javadoc)
	 * @see org.apache.zookeeper.Watcher#process(org.apache.zookeeper.WatchedEvent)
	 */
	@Override
	public void process(WatchedEvent event) {
		
		String path = event.getPath();
		boolean dataChanged = event.getType() == EventType.NodeDataChanged
        		|| event.getType() == EventType.NodeDeleted
        		|| event.getType() == EventType.NodeCreated;
		 LOG.debug("Process: " + event.getType() + "===>" + event.getState() + "====>" + dataChanged);
		 
		 if(dataChanged){
			 //处理ack信息
			  String ackPath = event.getPath() + "/ack";
              if(!exists(ackPath)){
                  create(ackPath, new byte[1], CreateMode.PERSISTENT);
              }
              String oldAckSessionPath = ackCache.get(path);
              if(StringUtils.isNotEmpty(oldAckSessionPath)){
            	  delete(oldAckSessionPath);
              }
              String ackSessionPath = ackPath + "/" + LocalIpUtils.getAckData(getZk().getSessionId() + "");
              try {
				recursiveSafeCreate(ackSessionPath, new byte[1], CreateMode.EPHEMERAL);
				 ackCache.put(path, ackSessionPath);
			} catch (KeeperException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
              processDataChanged(event);
		 }
		//　重连时得重新注册监听
			if(path == null && event.getState() ==  KeeperState.SyncConnected){
				subscribeAll();
			}
			if (event.getState() == KeeperState.Expired) {
				expired();
		      }
	}
	
	
	public void expired(){
    	LOG.error("[[session expired]] try reconnect....");
    	if(zk == null || !getZk().getState().isAlive()){
    		return ;
    	}
    	synchronized (this) {
			try {
				getZk().close();
				zk = new ZooKeeper(zkServers, sessionTimeout, this);
			} catch (InterruptedException e) {
				LOG.error("reconnect error!", e);
			} catch (IOException e) {
				LOG.error("reconnect error!", e);
			}
		}
    }
	
	/**
     * 重新注册watch
     */
    private void subscribeAll() {
    	LOG.error("===================subscribe All listener's path========================");
		synchronized (registerDataListener) {
			for(String path : registerDataListener.keySet()){
				watchForData(path);
			}
		}
	}
	
	
	 private void processDataChanged(WatchedEvent event) {
	        final String path = event.getPath();

	        if (event.getType() == EventType.NodeDataChanged || event.getType() == EventType.NodeDeleted || event.getType() == EventType.NodeCreated) {
	            Set<ZkDataListener> listeners = registerDataListener.get(path);
	            if (listeners != null && !listeners.isEmpty()) {
	                fireDataChangedEvents(event.getPath(), listeners);
	            }
	        }
	    }

	 private void fireDataChangedEvents(final String path, Set<ZkDataListener> listeners) {
	        for (final ZkDataListener listener : listeners) {
	        	// reinstall watch
	            exists(path, true);
	            try {
	                Object data = readData(path, null, true);
	                listener.handleDataChange(path, data);
	            } catch (ZkException e) {
	            	LOG.error("fireDataChangedEvents error!!", e);
	            }
	        }
	    }

	
	/**
	 * 递归节点
	 * @param node
	 * @param data
	 * @param createMode
	 * @return
	 * @throws KeeperException
	 * @throws InterruptedException
	 */
	   public  String recursiveSafeCreate(String node,byte[] data,CreateMode createMode) throws KeeperException,InterruptedException {
	        if(node==null||node.length()<0)
	        	return node;
	        else if("/".equals(node))
	        	return node;
	        else{
	            int index = node.lastIndexOf("/");
	            if(index==-1)
	            	return node;
	            String parent = node.substring(0,index);

	            recursiveSafeCreate(parent,data, createMode);
	            try{
	            	return create(node,data, createMode);
	            }catch (Exception e) {
					return node;
				}
	        }
	    }


	
	 /**
     * 判断节点为是否存在
     * @param path
     * @return
     */
    public boolean exists(final String path) {
        return exists(path, hasListeners(path));
    }

	
	
	  /**
     * 判断节点为是否存在
     * @param path
     * @param watch
     * @return
     */
    public  boolean exists(final String path, final boolean watch) {
        try {
			Stat stat = getZk().exists(path, watch);
			return stat != null ? true : false;
		} catch (KeeperException e) {
			LOG.error("path==>{} error!"+path,  e);
			return false;
		} catch (InterruptedException e) {
			LOG.error("path==>{} error!"+path,  e);
			return false;
		}
    }

	
	/**
     * 注册内容监听
     * @param path
     * @param listener
     */
    public void subscribeDataChanges(String path, ZkDataListener listener) {
        Set<ZkDataListener> listeners;
        synchronized (registerDataListener) {
            listeners = registerDataListener.get(path);
            if (listeners == null) {
                listeners = new CopyOnWriteArraySet<ZkDataListener>();
                registerDataListener.put(path, listeners);
            }
            listeners.add(listener);
        }
        watchForData(path);
        LOG.error("Subscribed data changes for " + path);
    }

    
    /**
     * 取消内容监听
     * @param path
     * @param dataListener
     */
    public void unsubscribeDataChanges(String path, ZkDataListener dataListener) {
        synchronized (registerDataListener) {
            final Set<ZkDataListener> listeners = registerDataListener.get(path);
            if (listeners != null) {
                listeners.remove(dataListener);
            }
            if (listeners == null || listeners.isEmpty()) {
                registerDataListener.remove(path);
            }
        }
    }



    /**
     * 删除节点
     * @param path
     * @return
     */
    public boolean delete(final String path) {
        try {
            getZk().delete(path, -1);
            return true;
        } catch (ZkException e) {
            return false;
        } catch (InterruptedException e) {
        	 return false;
		} catch (KeeperException e) {
			 return false;
		}
    }


    
	/**
     * 创建节点
     * @param path
     * @param data
     * @param mode
     * @return
     * @throws ZkException
     */
    public String create(final String path, byte[] data, final CreateMode mode) throws ZkException {
        if (path == null) {
            throw new NullPointerException("path must not be null.");
        }
        final byte[] bytes = data;

        try {
			return getZk().create(path, bytes, Ids.OPEN_ACL_UNSAFE, mode);
		} catch (KeeperException e) {
			throw new ZkException(e);
		} catch (InterruptedException e) {
			throw new ZkException(e);
		}
    }

	
	
	public ZooKeeper getZk() {
		if(zk != null && zk.getState().isAlive()){
    		return zk;
    	}
    	synchronized (this) {
			try {
				if(zk != null){
					zk.close();
				}
				zk = new ZooKeeper(zkServers, sessionTimeout, this);

			} catch (IOException e) {
				LOG.error("reconnect error!", e);
			} catch (InterruptedException e) {
				LOG.error("reconnect error!", e);
			}
		}
		return zk;
	}

	/**
     * 写节点数据
     * @param path
     * @param data
     */
    public void writeData(String path, byte[] data) {
        writeData(path, data, -1);
    }
    
    /**
     * 写节点数据
     * @param path
     * @param data
     * @param version
     */
    public void writeData(final String path, byte[] data, final int version) {
        try {
			getZk().setData(path, data, version);
		} catch (KeeperException e) {
			throw new ZkException(e);
		} catch (InterruptedException e) {
			throw new ZkException(e);
		}
    }
    
    
    
    /**
     * 取节点数据
     * @param path
     * @return
     */
    public byte[] readData(String path) {
        return  readData(path, false);
    }

    /**
     * 取节点数据
     * @param path
     * @param returnNullIfPathNotExists
     * @return
     */
    public byte[] readData(String path, boolean returnNullIfPathNotExists) {
    	byte[] data = null;
        try {
            data = readData(path, null);
        } catch (ZkException e) {
            if (!returnNullIfPathNotExists) {
                throw e;
            }
        }
        return data;
    }

    /**
     * 取节点数据
     * @param path
     * @param stat
     * @return
     */
    public byte[] readData(String path, Stat stat) {
        return readData(path, stat, hasListeners(path));
    }

    public  byte[] readData(final String path, final Stat stat, final boolean watch) {
    	 byte[] data = null;
		try {
			data = getZk().getData(path, watch , stat);
		} catch (KeeperException e) {
			LOG.error("read data error!!!", e);
			throw new ZkException(e);
		} catch (InterruptedException e) {
			throw new ZkException(e);
		}
         return data;
    }
    
    /**
     * 判断节点上是否有监听
     * @param path
     * @return
     */
    private boolean hasListeners(String path) {
        Set<ZkDataListener> dataListeners = registerDataListener.get(path);
        if (dataListeners != null && dataListeners.size() > 0) {
            return true;
        }
        return false;
    }


    /**
     * 监控节点
     * @param path
     */
    public void watchForData(final String path) {
        try {
        	getZk().exists(path, true);
		} catch (KeeperException e) {
			//throw new ZkException(e);
            LOG.error("watchForData error!", e);
		} catch (InterruptedException e) {
			//throw new ZkException(e);
            LOG.error("watchForData error!", e);
		}
    }



	
	public static void main(String[] args) throws IOException, KeeperException, InterruptedException {
		ZkClient zk = new ZkClient("127.0.0.1:2181", 3000);
//		zk.create("/collection", "master1".getBytes(), CreateMode.PERSISTENT);
//		zk.writeData("/collection", "master2".getBytes(), -1);
		byte[] ret =  zk.readData("/collection");
		System.out.println(new String(ret));
		zk.subscribeDataChanges("/collection",null);
		boolean b = zk.exists("/collection");
		System.out.println(b);
		zk.recursiveSafeCreate("/election/leader/valid", "127.0.0.1".getBytes(), CreateMode.PERSISTENT);
	
		new Thread(zk).start();
		Thread.sleep(100000);
		
	}




	@Override
	public void run() {
		
	}
	
}
