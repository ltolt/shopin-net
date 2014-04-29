package net.shopin.server.main;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import net.shopin.server.tutils.SshExecuter;

public class Servers {

	public static Map<String, String> serverMap = new HashMap<String, String>();

	public static Map<String, SshExecuter> executerMap = new HashMap<String, SshExecuter>();
	private static final Log logger = LogFactory.getLog("servicelog");
	static {
		// serverMap.put("100.31", "172.16.100.31,22,root,$linux12chriq");
		// serverMap.put("103.135", "172.16.103.135,22,root,$linux12chriq");
		// serverMap.put("103.145", "172.16.103.145,22,root,123123wan");
		// serverMap.put("103.146", "172.16.103.146,22,root,123123wang");
		// serverMap.put("103.147", "172.16.103.147,22,root,123123wang");

		// serverMap.put("59", "172.16.200.59,22,root,$mem590214");
		// serverMap.put("50", "172.16.200.50,22,root,$web50linux");
		// serverMap.put("17", "172.16.200.17,22,root,$web17linux");
		serverMap.put("120", "172.16.200.120,22,root,sanban-10214");
		// serverMap.put("29", "172.16.200.29,22,root,$app290214");
		// serverMap.put("2", "172.16.200.2,22,root,$app20214");
		// serverMap.put("62", "172.16.200.62,22,root,$linux12chrir");
		// serverMap.put("122", "172.16.200.122,22,root,sanban-30214");
		// serverMap.put("63", "172.16.200.63,22,root,$linux12chril");
		// serverMap.put("83", "172.16.200.83,6699,root,$linux12chrih");

	}

	public static void connect() throws Exception {
		logger.info("开始初始化连接--");
		for (String key : serverMap.keySet()) {

			String[] server = serverMap.get(key).split(",");
			logger.info("开始创建" + key + "的链接...");
			SshExecuter se = SshExecuter.newInstance(server[0],
					Integer.valueOf(server[1]), server[2], server[3]);
			logger.info("成功");
			executerMap.put(key, se);
		}
		logger.info("--初始化连接完成");
	}

	public static void close() throws Exception {
		logger.info("关闭链接--");

		for (String key : executerMap.keySet()) {
			SshExecuter se = executerMap.get(key);
			se.close();
			executerMap.put(key, null);
		}
		logger.info("--关闭链接完成");
	}

	public static SshExecuter getServerExecuter(String key) {
		return executerMap.get(key);
	}
}
