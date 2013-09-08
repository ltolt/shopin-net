import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLClassLoader;
import java.net.URLStreamHandler;

import javax.servlet.Servlet;
import javax.servlet.ServletException;

import ex.ex02.Constants;
import ex.ex02.Request;

/**
 * 
 */

/**
 * @author k
 *
 */
public class Details {

	/**
	 * @param args
	 * @throws IOException 
	 * @throws MalformedURLException 
	 * @throws ClassNotFoundException 
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 * @throws ServletException 
	 */
	public static void main(String[] args) throws MalformedURLException, IOException, ClassNotFoundException, InstantiationException, IllegalAccessException, ServletException {
		//代码仓库 
		File classPath = new File(Constants.WEB_ROOT);
		String repository = (new URL("file", null, classPath.getCanonicalPath() + File.separator)).toString();
		System.out.println(repository);
		URLStreamHandler handler = null;
		URL[] urls = new URL[1];
		urls[0] = new URL(null,repository,handler);
 		URLClassLoader loader = new URLClassLoader(urls);
 		Class  myclass = loader.loadClass("PrimitiveServlet");
 		System.out.println(myclass);
 		Servlet servlet = (Servlet) myclass.newInstance();
 		
	}

}
