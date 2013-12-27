/**
 * @Probject Name: Algorithm
 * @Path: net.shopin.common.JavaCommon.java
 * @Create By kongm
 * @Create In 2013-12-26 下午8:17:13
 * TODO
 */
package net.shopin.common;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *  java常用代码
 * @Class Name JavaCommon
 * @Author kongm
 * @Create In 2013-12-26
 */
public class JavaCommon {

	/**
	 * @Methods Name main
	 * @Create In 2013-12-26 By kongm
	 * @param args void
	 * @throws IOException 
	 */
	public static void main(String[] args)  {
		//1. 字符串与整型的相互转换
		String a = String.valueOf(2);//
		int i = Integer.parseInt(a);//
		//2.向文件末尾添加内容
		BufferedWriter out = null;
		try {
			out = new BufferedWriter(new FileWriter("test.txt",true));
			out.write("bbb");
			out.flush();
		} catch (IOException e) {
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
		}
		
		//3.得到当前方法的名字
		String methodName = Thread.currentThread().getStackTrace()[1].getMethodName();
		System.out.println(methodName);
		
		//4. 转字符串到日期
//		try {
//			Date date = DateFormat.getDateInstance().parse("20131226");
//			System.out.println(date);
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		SimpleDateFormat format = new SimpleDateFormat( "dd.MM.yyyy" );  
		try {
			Date date = format.parse( "26.12.2013" );
			System.out.println(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 


	}

}
