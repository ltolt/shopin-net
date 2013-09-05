/**
 * @Probject Name: framework
 * @Path: base.upload.FileUploadServlet.java
 * @Create By kongm
 * @Create In 2013-9-3 下午5:26:50
 * TODO
 */
package base.upload;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import base.ftp.FtpUtil;

/**
 * @Class Name FileUploadServlet
 * @Author kongm
 * @Create In 2013-9-3
 */
public class FileUploadServlet extends HttpServlet {
	private String savePath;

	private ServletContext sc;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		OutputStream output = null;
		req.setCharacterEncoding("UTF-8");
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		try {
			List items = upload.parseRequest(req);
			Iterator iter = items.iterator();
			while(iter.hasNext()){
				FileItem item = (FileItem) iter.next();
				
				if(item.isFormField()){
					System.out.println("表单参数名:" + item.getFieldName() + 
							 "表单参数值:" + item.getString("UTF-8"));
				}else{
					if(item.getName()!=null && !item.getName().equals("")){
						  System.out.println("上传文件的大小:" + item.getSize());
					      System.out.println("上传文件的类型:" + item.getContentType());
					      // item.getName()返回上传文件在客户端的完整路径名称
					      System.out.println("上传文件的名称:" + item.getName());
					      File tempFile = new File(item.getName());
					      
					      FtpUtil.saveToFtp(output, "promotions" ,item.getName(), item, "172.16.103.163","ftptest", "ftptest");
					      
					      //上传文件的保存路径
					      
					      File file = new File(sc.getRealPath("/") + savePath,tempFile.getName());
					      item.write(file);
					      
					      req.setAttribute("upload.message", "success");
					}else{
						 req.setAttribute("upload.message", "false");
					}
				}
				
			}
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		//在web.xml中设置一个初始化参数
		savePath = config.getInitParameter("savePath");
		sc = config.getServletContext();
	}

	/**
	 * @Field long serialVersionUID 
	 */
	private static final long serialVersionUID = -6958408433250473044L;

}
