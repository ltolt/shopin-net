/**
 * 说明:
 *     加密策略一
 *     
 * @Probject Name: design-pattern
 * @Path: concretestrategyEncyptStrategyOne.java
 * @Create By k
 * @Create In 2013-8-18 下午6:19:52
 * TODO
 */
package concretestrategy;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import strategy.EncryptStrategy;

/**
 * @Class Name EncyptStrategyOne
 * @Author k
 * @Create In 2013-8-18
 */
public class EncyptStrategyOne implements EncryptStrategy {

	String password;
	
	
	
	public EncyptStrategyOne() {
		super();
		this.password = "I love this game";
	}

	
	
	public EncyptStrategyOne(String password) {
		if(password.length() == 0)
			this.password = "I love this game";
		this.password = password;
	}



	/* (non-Javadoc)
	 * @see strategy.EncryptStrategy#encryptFile(java.io.File)
	 */
	@Override
	public void encryptFile(File file) {
		try {
			byte[] a = password.getBytes();
			FileInputStream in = new FileInputStream(file);
			long length = file.length();
			byte[] c = new byte[((int)length)];
			int m = in.read(c);
			for(int k = 0;k<m;k++){
				int n = c[k] + a[k%a.length];
				c[k] = (byte)n;
			}
			in.close();
			FileOutputStream out = new FileOutputStream(file);
			out.write(c, 0, m);
			out.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		

	}

	/* (non-Javadoc)
	 * @see strategy.EncryptStrategy#decryptFile(java.io.File)
	 */
	@Override
	public String decryptFile(File file) {
		try {
			byte[] a = password.getBytes();
			long length = file.length();
			FileInputStream in = new FileInputStream(file);
			byte[] c= new byte[(int)length];
			int m = in.read(c);
			for(int k = 0;k<m;k++){
				int n = c[k] - a[k%a.length];
				c[k] = (byte)n;//解密
			}
			in.close();
			return new String(c,0,m);
		} catch (IOException e) {
			e.printStackTrace();
			return e.toString();
		}
	}

}
