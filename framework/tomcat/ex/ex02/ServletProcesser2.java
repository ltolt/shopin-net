/**
 * @Probject Name: framework
 * @Path: ex.ex02ServletProcesser2.java
 * @Create By kimi
 * @Create In 2013年9月8日 下午9:37:20
 * TODO
 */
package ex.ex02;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.net.URLClassLoader;
import java.net.URLStreamHandler;

import javax.servlet.Servlet;
import javax.servlet.ServletException;

/**
 * @Class Name ServletProcesser2
 * @Author kimi
 * @Create In 2013年9月8日
 */
public class ServletProcesser2 {
	
	public void process(Request request,Response response){
		    String uri = request.getUri();
		    String servletName = uri.substring(uri.lastIndexOf("/") + 1);
		    URLClassLoader loader = null;

		    try {
		      // create a URLClassLoader
		      URL[] urls = new URL[1];
		      URLStreamHandler streamHandler = null;
		      File classPath = new File(Constants.WEB_ROOT);
		      // the forming of repository is taken from the createClassLoader method in
		      // org.apache.catalina.startup.ClassLoaderFactory
		      String repository = (new URL("file", null, classPath.getCanonicalPath() + File.separator)).toString() ;
		      // the code for forming the URL is taken from the addRepository method in
		      // org.apache.catalina.loader.StandardClassLoader class.
		      urls[0] = new URL(null, repository, streamHandler);
		      loader = new URLClassLoader(urls);
		    }
		    catch (IOException e) {
		      System.out.println(e.toString() );
		    }
		    Class myClass = null;
		    try {
		      myClass = loader.loadClass(servletName);
		    }
		    catch (ClassNotFoundException e) {
		      System.out.println(e.toString());
		    }
		    Servlet servlet = null;
		    RequestFacade requestFacade = new RequestFacade(request);
		    ResponseFacade responseFacade = new ResponseFacade(response);
		    
		    try {
				servlet= (Servlet) myClass.newInstance();
				servlet.service(requestFacade, responseFacade);
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
