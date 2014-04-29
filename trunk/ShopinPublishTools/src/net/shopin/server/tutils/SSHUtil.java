package net.shopin.server.tutils;

import java.util.List;

public class SSHUtil {

	public static void killAllTomcatProgress(SshExecuter se) throws Exception {
		killTomcatProgress(se, "-Dcatalina.home");
	}

	public static void showAllTomcatProgress(SshExecuter se) throws Exception {
		showTomcatProgress(se, "-Dcatalina.home");
	}

	public static List<Tomcat> listAllTomcatProgress(SshExecuter se)
			throws Exception {
		return listTomcatProgress(se, "-Dcatalina.home");

	}

	public static void killTomcatProgress(SshExecuter se, String tomcatPath)
			throws Exception {
		String execRtn = se.exec("ps -ef|grep " + tomcatPath + "\n");
		List<Tomcat> list = TomcatSSHUtil.drawTomcatProgress(execRtn);

		for (Tomcat t : list) {
			// System.out.println(t.getProgressId() + " " + t.getPath());
			se.exec("kill -9 " + t.getProgressId() + "\n");
			Thread.sleep(1);
		}
	}

	public static void showTomcatProgress(SshExecuter se, String tomcatPath)
			throws Exception {

		String execRtn = se.exec("ps -ef|grep " + tomcatPath + "\n");

		List<Tomcat> list = TomcatSSHUtil.drawTomcatProgress(execRtn);

		// System.out.println(list.size());

		for (Tomcat t : list) {
			// System.out.println(t.getProgressId() + " " + t.getPath());
			System.out.println(t.getPath());
		}
	}

	public static List<Tomcat> listTomcatProgress(SshExecuter se,
			String tomcatPath) throws Exception {

		String execRtn = se.exec("ps -ef|grep " + tomcatPath + "\n");

		List<Tomcat> list = TomcatSSHUtil.drawTomcatProgress(execRtn);

		return list;
	}

	public static void resetTomcatProgress(SshExecuter se, Tomcat tomcat)
			throws Exception {

		se.exec("kill -9 " + tomcat.getProgressId() + "\n");
		Thread.sleep(500);
		se.shell(tomcat.getPath() + "/bin/startup.sh\n", "c:\\out.txt");

	}

	public static void resetAllTomcatProgress(SshExecuter se) throws Exception {
		resetTomcatProgress(se, "-Dcatalina.home");
	}

	public static void resetTomcatProgress(SshExecuter se, String path)
			throws Exception {
		String execRtn = se.exec("ps -ef|grep " + path + "\n");

		// 1.Get all tomcat process.
		List<Tomcat> list = TomcatSSHUtil.drawTomcatProgress(execRtn);

		for (Tomcat t : list) {
			se.exec("kill -9 " + t.getProgressId() + "\n");
			Thread.sleep(500);
			se.shell(t.getPath() + "/bin/startup.sh\n", "c:\\out.txt");
		}
	}

	public static void startTomcatProgress(SshExecuter se, String tomcatPath)
			throws Exception {
		se.shell(tomcatPath + "/bin/startup.sh\n", "c:\\out.txt");
	}
}
