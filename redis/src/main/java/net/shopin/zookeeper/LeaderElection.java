/**
 * 
 */
package net.shopin.zookeeper;

import java.net.InetAddress;
import java.net.UnknownHostException;

import org.apache.log4j.Logger;
import org.apache.zookeeper.CreateMode;
import org.apache.zookeeper.KeeperException;
import org.apache.zookeeper.WatchedEvent;
import org.apache.zookeeper.ZooDefs;
import org.apache.zookeeper.data.Stat;

/**
 * @author kongming
 *
 */
public class LeaderElection extends ZookeeperClient {
	
	public static final Logger logger = Logger.getLogger(LeaderElection.class);
	

	public LeaderElection(String connectString,String root) {
		super(connectString);
		this.root = root;
		if(zk != null){
			try {
				Stat s = zk.exists(root, false);
				if(s == null){
					zk.create(root, new byte[0],ZooDefs.Ids.OPEN_ACL_UNSAFE, CreateMode.PERSISTENT);
				}
			} catch (KeeperException e) {
				e.printStackTrace();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			
		}
	}
	
	void findLeader() throws KeeperException, UnknownHostException, InterruptedException{
		byte[]  leader = null;
		try {
			leader = zk.getData(root + "/leader", false, null);
		} catch (KeeperException e) {
			if(e instanceof KeeperException.NoNodeException){
				logger.error(e);
			}else{
				throw e;
			}
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(leader!=null){
			following();
		}else{
			String newLeader = null;
			byte[] localhost = InetAddress.getLocalHost().getAddress();
			newLeader = zk.create(root + "/leader", localhost, ZooDefs.Ids.OPEN_ACL_UNSAFE, CreateMode.PERSISTENT_SEQUENTIAL);
			if(newLeader!=null){
				leading();
			}else{
				mutex.wait();
			}
		}
		
		
	}
	 void leading() {
	        System.out.println("成为领导者");
	    }
	
	void following() {
        System.out.println("成为组成员");
    }

	@Override
	public synchronized void process(WatchedEvent event) {
		if(event.getPath().equals(root + "/leader")&&event.getType() == Event.EventType.NodeCreated){
			System.out.println("得到通知");
			super.process(event);
			following();
		}
		
	}
	
	public static void main(String[] args) {
		String connectString = "127.0.0.1:2181";
		LeaderElection le = new LeaderElection(connectString, "/GroupMembers");
		try {

			le.findLeader();
			le.findLeader();
			le.findLeader();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (KeeperException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	

}
