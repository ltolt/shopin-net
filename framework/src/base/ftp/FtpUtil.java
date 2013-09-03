/**
 * @Probject Name: framework
 * @Path: base.ftp.FtpUtil.java
 * @Create By kongm
 * @Create In 2013-9-3 下午6:06:45
 * TODO
 */
package base.ftp;

import java.io.IOException;
import java.io.OutputStream;

import org.apache.commons.fileupload.FileItem;

import com.enterprisedt.net.ftp.FTPException;
import com.enterprisedt.net.ftp.FileTransferClient;

/**
 * @Class Name FtpUtil
 * @Author kongm
 * @Create In 2013-9-3
 */
public class FtpUtil {
	
	public static void saveToFtp(OutputStream out,String fileDic,String filename,
			FileItem item,String host,String username,String password){
		FileTransferClient ftp = null;
		
		try {
			ftp = new FileTransferClient();
			ftp.setRemoteHost(host);
			ftp.setUserName(username);
			ftp.setPassword(password);
			ftp.setRemotePort(21);
			ftp.connect();
			ftp.changeDirectory(fileDic);
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
	

	/**
	 * @Methods Name main
	 * @Create In 2013-9-3 By kongm
	 * @param args void
	 */
	public static void main(String[] args) {
		FtpUtil ftp = new FtpUtil();
		OutputStream output = null;
		
//		ftp.saveToFtp(output, "promotions","1.jpg", item, host, username, password)
		
		

	}

}
