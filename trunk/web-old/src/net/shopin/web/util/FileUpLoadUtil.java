package net.shopin.web.util;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import static net.shopin.web.util.FTPUtil.*;

public class FileUpLoadUtil extends HttpServlet {

     private String filePath="";
     private int fileSize =1024;
     private String imageServer="";
	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        response.setContentType("text/plain");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();

		//判断是否是文件上传
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		//设置在内存中可以存放的最大值
		//factory.setSizeThreshold(4096);
		//设置临时目录
		//factory.setRepository(new File("d:/flexupload"));
		
		ServletFileUpload upload = new ServletFileUpload(factory);
		//设置最大上传文件大小


		List  items = null;
		
		try {
			items = upload.parseRequest(request);
            upload.setSizeMax(fileSize);
		} catch (FileUploadException e) {
			 out.write("error");
             return;
			
		}
        String fileName ="";
		Iterator iter = items.iterator();
		while (iter.hasNext()) {
		    FileItem item = (FileItem) iter.next();
		    if(!item.isFormField()){
		    	String temp = item.getName();
                if(temp!=null&&!temp.trim().equals("")){
                    int index = temp.lastIndexOf(".");
                    if(index>0){
                     fileName=System.currentTimeMillis()+temp.substring(index);
                    }else{
                        fileName=temp;
                    }

                }else{
                    // response.setContentType("text/html");
                      out.write("error");
                     return;
                 //   out.print("<script> alert( '提交成功 ') </script> ");
                 // out.write("<script>alert('文件上传错误：文件名为空！')</script>");
                }

		    	String contentType = item.getContentType();
		    	long size = item.getSize();
//		    	OutputStream outputStream =null;
		    	File file = new File(filePath+fileName);
		    	try {
					item.write(file);
//                    FTPUtil.saveToFTP(outputStream,filePath,fileName,item,"172.16.100.137","ftptest","ftptest");
				} catch (Exception e) {
                   //response.setContentType("text/html");
                 //  out.write("<script>alert('文件上传错误："+e.getMessage()+"')</script>");
                     out.write("error");
                    return;
				}
		    }

		}
        //(imageServer + fileName)=http://172.16.100.137:8080/images/20101341234.jpg
        out.print(imageServer + fileName);
		
	
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() {
        filePath = getServletConfig().getInitParameter("filePath");
        File f = new File(filePath);
        imageServer = getServletConfig().getInitParameter("urlPre");
        if(!f.exists()||!f.isDirectory()){
             f.mkdir();
        }
        if(filePath==null && filePath.trim().equals("")){
            throw new IllegalArgumentException("没有配置文件上传路径！");
        }
        String strSize = getServletConfig().getInitParameter("fileSize");
        if(strSize!=null && !strSize.equals("")){
            fileSize=Integer.parseInt(strSize);
        }
        if(imageServer==null || imageServer.trim().equals("")){
            throw new IllegalArgumentException("没有配置图片访问路径！");
        }


	}

}
