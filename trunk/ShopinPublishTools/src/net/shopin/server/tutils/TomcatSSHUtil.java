package net.shopin.server.tutils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class TomcatSSHUtil {

	// 
	public static List<Tomcat> drawTomcatProgress(String execRtn) {
		List<Tomcat> tList = new ArrayList<Tomcat>();

		String[] progressAry = execRtn.split("\n");

		for (String progress : progressAry) {
			if (!isTomcatProgress(progress))
				continue;
			Tomcat t = new Tomcat();

			t.setPath(getTomcatPath(progress));

			t.setProgressId(getProgressId(progress));
			tList.add(t);

		}

		Collections.sort(tList, new Comparator<Tomcat>() {

			@Override
			public int compare(Tomcat o1, Tomcat o2) {

				return o1.getPath().compareTo(o2.getPath());
			}

		});

		return tList;
	}

	private static boolean isTomcatProgress(String progress) {
		// TODO Auto-generated method stub
		return progress.indexOf("-Dcatalina.home=") != -1;
	}

	private static String getProgressId(String execRtn) {

		int start = execRtn.indexOf(" ");
		for (int i = start; i < execRtn.length(); i++) {
			if (execRtn.charAt(i) != ' ') {
				start = i;
				break;
			}
			continue;
		}

		int end = execRtn.indexOf(" ", start);

		return execRtn.substring(start, end);
	}

	private static String getTomcatPath(String execRtn) {

		int start = execRtn.indexOf("-Dcatalina.home=")
				+ "-Dcatalina.home=".length();

		int end = execRtn.indexOf(" ", start);

		return execRtn.substring(start, end);
	}

	public static void main(String[] args) {

		List<Tomcat> list = TomcatSSHUtil
				.drawTomcatProgress("root      3762     1 12 Apr28 ?        15:42:09 /opt/jdk1.6.0_26/bin/java -Djava.util.logging.config.file=/opt/tomcat1/conf/logging.properties -Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager -server -Xms1G -Xmx1G -Xss128k -Xverify:none -XX:MaxPermSize=1G -XX:MaxNewSize=1G -XX:ParallelGCThreads=20 -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:SurvivorRatio=8 -XX:TargetSurvivorRatio=90 -XX:MaxTenuringThreshold=31 -Djava.awt.headless=true -Djava.endorsed.dirs=/opt/tomcat1/endorsed -classpath /opt/tomcat1/bin/bootstrap.jar -Dcatalina.base=/opt/tomcat1 -Dcatalina.home=/opt/tomcat1 -Djava.io.tmpdir=/opt/tomcat1/temp org.apache.catalina.startup.Bootstrap start");

		System.out.println(list.size());
		for (Tomcat t : list) {
			System.out.println(t.getProgressId() + " :" + t.getPath());
		}
	}
}
