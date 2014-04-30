/**
 * 
 */
package net.shopin.zookeeper;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.Socket;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * @author kongming
 *
 */
public class LocalIpUtils {
	
	private static final Logger LOG = LoggerFactory.getLogger(LocalIpUtils.class);
	
	public static String ip;
	
	static {
		List<String> ips = getLocalIps();
		if (ips.isEmpty()) {
			ip = "not.found";
		} else {
			ip = ips.get(0);
		}
	}
	
	
	public static String getAckData(String sessionId) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
		return ip + "__" + sessionId + "__" + sdf.format(new Date());
	}
	

	/**
	 * 获取本机的内
	 * 
	 * @return
	 */
	public static List<String> getLocalIps() {
		List<String> ipList = new ArrayList<String>();
		try {
			Enumeration<NetworkInterface> netInterfaces = NetworkInterface.getNetworkInterfaces();
			InetAddress ip = null;
			while (netInterfaces.hasMoreElements()) {
				NetworkInterface ni = (NetworkInterface) netInterfaces.nextElement();
				Enumeration<InetAddress> ips = ni.getInetAddresses();
				while (ips.hasMoreElements()) {
					ip = (InetAddress) ips.nextElement();
					if (ip.isSiteLocalAddress() && !ip.isLoopbackAddress() && ip.getHostAddress().indexOf(":") == -1) {
						ipList.add(ip.getHostAddress());
						break;
					} else {
						ip = null;
					}
				}
			}
		} catch (Exception e) {
			LOG.error("getLocalIps error!!!", e);
		}
		return ipList;
	}

	/**
	 * 判断商品是否开启
	 * 
	 * @param ip
	 * @param port
	 * @return
	 */
	public static boolean addressIsUsed(String ip, int port) {
		Socket clientSocket = null;
		try {
			clientSocket = new Socket(ip, port);
			return true;
		} catch (Exception e) {
			return false;
		} finally {
			if (clientSocket != null) {
				try {
					clientSocket.close();
				} catch (Exception e) {
					LOG.error("close addressIsUsed socket error!", e);
				}
			}
		}
	}

	
	public static void main(String[] args) {
		List list = getLocalIps();
		System.out.println(list);
		boolean result =  addressIsUsed("127.0.0.1", 80);
		System.out.println(result);	
		System.out.println(getAckData("sfsf"));
	}
	

}
