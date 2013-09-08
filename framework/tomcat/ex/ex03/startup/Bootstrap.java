/**
 * @Probject Name: framework
 * @Path: ex.ex03.startupBootstrap.java
 * @Create By kimi
 * @Create In 2013年9月9日 上午12:03:57
 * TODO
 */
package ex.ex03.startup;

import ex.ex03.connector.http.HttpConnector;

/**
 * @Class Name Bootstrap
 * @Author kimi
 * @Create In 2013年9月9日
 */
public final class Bootstrap {

	/**
	 * 说明:
	 *     应用程序启动类
	 * @Methods Name main
	 * @Create In 2013年9月9日 By kimi
	 * @param args void
	 */
	public static void main(String[] args) {
		HttpConnector connector = new HttpConnector();
		connector.start();
	}

}
