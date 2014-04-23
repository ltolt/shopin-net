package net.shopin.web.util;

import com.enterprisedt.net.ftp.FTPException;
import com.enterprisedt.net.ftp.FileTransferClient;
import org.apache.commons.fileupload.FileItem;

import java.io.IOException;
import java.io.OutputStream;

public class FTPUtil {

    public static void saveToFTP(OutputStream out, String fileDic, String filename,
                                 FileItem item, String host, String username, String password) {



     FileTransferClient ftp = null;
    try {
        ftp = new FileTransferClient();
        ftp.setRemoteHost(host);
        ftp.setUserName(username);
        ftp.setPassword(password);
        ftp.setRemotePort(21);
        ftp.connect();
        ftp.changeDirectory(fileDic);
        if (!ftp.exists(filename)) {
            out = ftp.uploadStream(filename);
            out.write(item.get());
        }

        // ftp.uploadFile("d:\\shopin\\report.sql", "test.jpg");
            // ftp.createDirectory("test");
        } catch (FTPException e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        } catch (IOException e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                ftp.disconnect();
            } catch (FTPException e) {
                System.out.println(e.getMessage());
                e.printStackTrace();
            } catch (IOException e) {
                System.out.println(e.getMessage());
                e.printStackTrace();
            }
        }
    }

    public static void delFromFTP(String fileDic, String filename,
                                  String host, String username, String password) {
        FileTransferClient ftp = null;
        try {
            ftp = new FileTransferClient();
            ftp.setRemoteHost(host);
            ftp.setUserName(username);
            ftp.setPassword(password);
            ftp.setRemotePort(21);
            ftp.connect();

            ftp.changeDirectory(fileDic);
            boolean flag = ftp.exists(filename);
//            System.out.println("--------"+flag);
            if (flag) {
                ftp.deleteFile(filename);
            }
            // ftp.uploadFile("d:\\shopin\\report.sql", "test.jpg");
            // ftp.createDirectory("test");
        } catch (FTPException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                ftp.disconnect();
            } catch (FTPException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }


}
