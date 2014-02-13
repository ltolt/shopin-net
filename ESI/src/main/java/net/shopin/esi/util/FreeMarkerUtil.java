/**
 * @Probject Name: ESI
 * @Path: net.shopin.esi.utilFreeMarkerUtil.java
 * @Create By kongm
 * @Create In 2014-2-12 下午2:09:16
 * TODO
 */
package net.shopin.esi.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletContext;

import freemarker.cache.StringTemplateLoader;
import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;

/**
 * @Class Name FreeMarkerUtil
 * @Author kongm
 * @Create In 2014-2-12
 */
public class FreeMarkerUtil {
	
	private static Configuration config = new Configuration();
	
	private static boolean initial = false;
	
	/**
	 * 初始化模板位置
	 * @Methods Name initConfig
	 * @Create In 2014-2-12 By kongm
	 * @param servletContext
	 * @param templateDir void 模板位置
	 * @throws IOException 
	 */
	public static void initConfig(ServletContext servletContext,String templateDir) throws IOException{
		config.setLocale(Locale.CHINA);
		config.setDefaultEncoding("utf-8");
		config.setEncoding(Locale.CHINA, "utf-8");
		config.setDirectoryForTemplateLoading(new File("F:\\webapp\\ESI\\target\\ESI\\WEB-INF\\pages"));
//		config.setServletContextForTemplateLoading(servletContext, "/WEB-INF/pages");
		//config.setDirectoryForTemplateLoading(new File("F:\\webapp\\ESI\\target\\ESI\\WEB-INF\\pages"));
		config.setObjectWrapper(new DefaultObjectWrapper());
	}
	
	
	/**
	 * 
	 * @Methods Name processTemplate
	 * @Create In 2014-2-12 By kongm
	 * @param temlpateName 模板名称
	 * @param root 模板根 用于在模板内输出结果集
	 * @param out void 输出对象 
	 */
	public static void processTemplate(String temlpateName,Map<?, ?> root,Writer out){
		if(!initial){
			try {
				initConfig(null, null);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		try {
			//获得模板
			Template template = config.getTemplate(temlpateName,"utf-8");
			//生成文件(html)
			template.process(root, out);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (TemplateException e) {
			e.printStackTrace();
		}finally{
			try {
				out.close();
				out = null;
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		
		
		
	}
	
	public static void main(String[] args) throws UnsupportedEncodingException, FileNotFoundException {
		Writer out = new OutputStreamWriter(
				new FileOutputStream("F:\\webapp\\ESI\\target\\ESI\\WEB-INF\\pages\\html" + "\\" + "index.java"),"UTF-8");
		Map root = new HashMap();
		//root.put("user", "kongm");
		root.put("package", "net.shopin");
		root.put("class", "test");
		FreeMarkerUtil.processTemplate("java.ftl", root, out);
		
	}
	

}
