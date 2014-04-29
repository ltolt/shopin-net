package net.shopin.server.main;

import net.shopin.server.tutils.SSHUtil;
import net.shopin.server.tutils.SshExecuter;

public class RestartTools {

	/**
	 * 划定重启任务清单，执行重启任务
	 * 
	 * @throws Exception
	 */
	private static void doProcess() throws Exception {
		// 1.Do plain
		String[][] messionList = new String[][] {
		// { "103.145",
		// "/usr/local/apache-tomcat-cps-stock;/usr/local/apache-tomcat-subsystemb"
		// },
		// { "62", "/usr/local/apache-tomcat-order" },
		// { "63", "/usr/local/apache-tomcat-order" },
		// { "122", "/usr/local/apache-tomcat-oms1" },
		// { "122", "/usr/local/apache-tomcat-oms2" },
		// { "83", "/usr/local/tomcat-web;/usr/local/tmall-job/" },
		// {
		// "120",
		// "/usr/local/apache-tomcat-web1;/usr/local/apache-tomcat-web2;/usr/local/apache-tomcat-web3"
		// },
		// { "50", "/usr/local/apache-tomcat-web" },
		// { "17", "/usr/local/apache-tomcat-web" },
		// { "83", "/usr/local/tomcat-order" },
		// { "63", "/usr/local/apache-tomcat-job" },

		};

		//
		// stopServer(messionList, 100);

		// 2.Do restart
		restartServer(messionList, 5000);

		// startServer(messionList, 2000);
	}

	/**
	 * 根据任务列表，重启指定路径的tomcat
	 * 
	 * @param messionList
	 * @param i
	 * 
	 * @throws Exception
	 */
	private static void restartServer(String[][] messionList, int i)
			throws Exception {
		for (String[] mession : messionList) {
			SshExecuter se = Servers.getServerExecuter(mession[0]);
			if (se == null) {
				continue;
			}
			String[] pathary = mession[1].split(";");

			for (String tomcatPath : pathary) {
				SSHUtil.resetTomcatProgress(se, tomcatPath);

				Thread.sleep(i);
			}

		}
	}

	private static void stopServer(String[][] messionList, int i)
			throws Exception {
		for (String[] mession : messionList) {
			SshExecuter se = Servers.getServerExecuter(mession[0]);
			if (se == null) {
				continue;
			}
			String[] pathary = mession[1].split(";");

			for (String tomcatPath : pathary) {
				SSHUtil.killTomcatProgress(se, tomcatPath);

				Thread.sleep(i);
			}

		}
	}

	private static void startServer(String[][] messionList, int i)
			throws Exception {
		for (String[] mession : messionList) {
			SshExecuter se = Servers.getServerExecuter(mession[0]);
			if (se == null) {
				continue;
			}
			String[] pathary = mession[1].split(";");

			for (String tomcatPath : pathary) {
				SSHUtil.startTomcatProgress(se, tomcatPath);

				Thread.sleep(i);
			}

		}
	}

	/**
	 * 任务入口〄1�7
	 */
	public static void restart() {
		try {
			Servers.connect();

			doProcess();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				Servers.close();
			} catch (Exception e) {

				e.printStackTrace();
			}
		}

	}

	public static void main(String[] args) {
		try {
			RestartTools.restart();
		} catch (Exception e) {

			e.printStackTrace();
		}
	}
}
