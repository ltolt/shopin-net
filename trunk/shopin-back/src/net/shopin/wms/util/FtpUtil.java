/**
 * 说明:  
 *     图片ftp上传工具类
 * @Probject Name: shopin-back-wms
 * @Path: net.shopin.wms.utilFtpUtil.java
 * @Create By kongm
 * @Create In 2013-9-5 上午10:34:47
 * TODO
 */
package net.shopin.wms.util;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.fileupload.FileItem;

import com.constants.SystemConfig;
import com.enterprisedt.net.ftp.FTPException;
import com.enterprisedt.net.ftp.FileTransferClient;

/**
 * @Class Name FtpUtil
 * @Author kongm
 * @Create In 2013-9-5
 */
public class FtpUtil {
	
	private static final SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
	
	/**
	 * 说明: 
	 *     获取当前时间戳构造图片上传路径
	 * @Methods Name getImagePath
	 * @Create In 2013-9-5 By Administrator
	 * @return String
	 */
	public static String getImagePath(){
		return format.format(new Date());
	}
	
	
	/**
	 * 说明: 
	 *     上传活动图片到ftp服务器
	 * @Methods Name saveToFtp
	 * @Create In 2013-9-5 By kongm
	 * @param out
	 * @param fileDic
	 * @param filename
	 * @param item
	 * @param host
	 * @param username
	 * @param password void
	 */
	public static void saveToFtp(OutputStream out,String filename,
			FileItem item){
		FileTransferClient ftp = null;
		
		try {
			ftp = new FileTransferClient();
			ftp.setRemoteHost(SystemConfig.FTP_HOST);
			ftp.setUserName(SystemConfig.FTP_USERNAME);
			ftp.setPassword(SystemConfig.FTP_PASSWORD);
			ftp.setRemotePort(Integer.valueOf(SystemConfig.FTP_PORT));
			ftp.connect();
			ftp.changeDirectory(SystemConfig.PROMOTION_PATH);
			if(!ftp.exists(filename)){
				out = ftp.uploadStream(filename);
				out.write(item.get());
			}
		} catch (FTPException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(out!=null){
				try {
					out.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			try {
				ftp.disconnect();
			} catch (FTPException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		
	}
	
	public static void main(String[] args) {
		System.out.println(getImagePath());
		OutputStream output;
		
		
	}
	
	

}
