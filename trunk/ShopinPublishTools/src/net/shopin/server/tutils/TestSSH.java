package net.shopin.server.tutils;

import java.util.LinkedHashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class TestSSH {

	private static Map<String, String> servers = new LinkedHashMap<String, String>();

	private static Map<String, String> tomcatPaths = new LinkedHashMap<String, String>();

	private static final Log logger = LogFactory.getLog("servicelog");

	static {
		// servers.put("100.31", "172.16.100.31,22,root,$linux12chriq");
		// tomcatPaths.put("100.31", "/opt/tomcat1;/opt/tomcat2");
		// servers.put("103.135", "172.16.103.135,22,root,$linux12chriq");
		// servers.put("103.145", "172.16.103.145,22,root,123123wan");
		// servers.put("103.146", "172.16.103.146,22,root,123123wang");
		// servers.put("103.147", "172.16.103.147,22,root,123123wang");
		// servers.put("103.133", "172.16.103.133,22,root,$linux12chriq");

		// servers.put("200.59", "172.16.200.59,22,root,$mem590214");
		// servers.put("200.50", "172.16.200.50,22,root,$web50linux");
		// servers.put("200.17", "172.16.200.17,22,root,$web17linux");
		// servers.put("200.29", "172.16.200.29,22,root,$app290214");
		// servers.put("200.2", "172.16.200.2,22,root,$app20214");
		// servers.put("200.62", "172.16.200.62,22,root,$linux12chrir");
		// servers.put("200.122", "172.16.200.122,22,root,sanban-30214");
		servers.put("200.63", "172.16.200.63,22,root,$linux12chril");
		// servers.put("200.120", "172.16.200.120,22,root,sanban-10214");
		// servers.put("200.83", "172.16.200.83,6699,root,$linux12chrih");

		// tomcatPaths.put("103.135", "/usr/local/apache-tomcat-app");
		// tomcatPaths.put("103.145", "/usr/local/apache-tomcat-app");

		// tomcatPaths.put("200.50", "/usr/local/apache-tomcat-web");
		// tomcatPaths.put("200.17", "/usr/local/apache-tomcat-web");
		// tomcatPaths.put("200.29", "/usr/local/apache-tomcat-app");
		// tomcatPaths.put("200.29", "/usr/local/apache-tomcat-common");
		// tomcatPaths.put("200.2", "/usr/local/apache-tomcat-app");
		// tomcatPaths.put("200.62", "/usr/local/apache-tomcat-order");
		// tomcatPaths.put("200.122", "/usr/local/apache-tomcat-order");
		tomcatPaths.put("200.63", "/usr/local/apache-tomcat-order");
		// tomcatPaths
		// .put("200.120",
		// "/usr/local/apache-tomcat-web1;/usr/local/apache-tomcat-web2;/usr/local/apache-tomcat-web3");
		// tomcatPaths.put("200.120", "/usr/local/apache-tomcat-pricesynoci/");

		// tomcatPaths
		// .put("200.83",
		// "/usr/local/tomcat-back;/usr/local/tmall-job;/usr/local/tomcat-web");

		// tomcatPaths.put("200.83", "/usr/local/tomcat-web");
		// tomcatPaths
		// .put("200.59",
		// "/usr/local/apache-tomcat-gghd;/usr/local/apache-tomcat-360web");//;/usr/local/apache-tomcat-swd
	}

	/**
	 * @param args
	 * @throws InterruptedException
	 */
	public static void main(String[] args) throws Exception {

		resetServer();
		// showAll();

	}

	public static void showAll() throws Exception {
		for (String key : servers.keySet()) {
			String[] server = servers.get(key).split(",");

			SshExecuter se = SshExecuter.newInstance(server[0],
					Integer.valueOf(server[1]), server[2], server[3]);

			System.out.println("开始处理--IP:" + server[0] + " ");
			logger.info("开始处理--IP:" + server[0] + " ");
			SSHUtil.showAllTomcatProgress(se);

			se.close();
		}
	}

	public static void resetServer() throws Exception {

		for (String key : servers.keySet()) {
			String[] server = servers.get(key).split(",");

			SshExecuter se = SshExecuter.newInstance(server[0],
					Integer.valueOf(server[1]), server[2], server[3]);

			String[] pathary = tomcatPaths.get(key).split(";");

			for (String tomcatPath : pathary) {

				// SSHUtil.showTomcatProgress(se, tomcatPath);
				SSHUtil.resetTomcatProgress(se, tomcatPath);
				// Thread.sleep(1000);
			}

			se.close();
		}
	}
}
