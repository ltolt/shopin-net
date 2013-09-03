/**
 * @Probject Name: framework
 * @Path: ex.ex02.ServletProcessor.java
 * @Create By kongm
 * @Create In 2013-9-2 上午10:40:19
 * TODO
 */
package ex.ex02;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLClassLoader;
import java.net.URLStreamHandler;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * @Class Name ServletProcessor
 * @Author kongm
 * @Create In 2013-9-2
 */
public class ServletProcessor {

	public void process(Request request, Response response) {
		String uri = request.getUri();
		String servletName = uri.substring(uri.lastIndexOf("/") + 1);
		URLClassLoader loader = null;

		try {
			// create a urlClassloader
			URL[] urls = new URL[1];
			URLStreamHandler streamHandler = null;
			File classPath = new File(Constants.WEB_ROOT);
			// the forming of repository is taken from the
			// createClassLoader method in
			// org.apache.catalina.startup.ClassLoaderFactory
			String repository = (new URL("file", null,
					classPath.getCanonicalPath() + File.separator)).toString();
			urls[0] = new URL(null,repository,streamHandler);
			loader = new URLClassLoader(urls);
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Class myclass = null;
		try {
			myclass = loader.loadClass(servletName);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Servlet servlet = null;
		try {
			servlet = (Servlet) myclass.newInstance();
			servlet.service((ServletRequest)request, (ServletResponse)response);
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

	}

}
