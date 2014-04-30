/**
 * 
 */
package net.shopin.zookeeper;

/**
 * 节点数据监听器
 * @author kongming
 *
 */
public interface ZkDataListener {
	
	
	/**
	 * 处理节点数据变化事件
	 * @param path
	 * @param data
	 */
	public void handleDataChange(String path, Object data) ;
	
	/**
	 * 处理节点删除事件
	 * @param path
	 */
	public void handleDataDeleted(String path);
	

}
