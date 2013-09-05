/**
 * @Probject Name: framework
 * @Path: base.framework.FtpTest2.java
 * @Create By kongm
 * @Create In 2013-9-5 上午10:18:18
 * TODO
 */
package base.framework;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @Class Name FtpTest2
 * @Author kongm
 * @Create In 2013-9-5
 */
public class FtpTest2 {
	
	/**
	 * @Methods Name main
	 * @Create In 2013-9-5 By kongm
	 * @param args void
	 */
	public static void main(String[] args) {
		System.out.println(new Date().getTime());
		System.out.println(System.currentTimeMillis());
		System.out.println(Calendar.getInstance().get(1));
		System.out.println(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));
		System.out.println(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));
	}

}
