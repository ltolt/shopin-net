/**
 * 说明:
 *     策略模式客户端
 *
 * @Probject Name: design-pattern
 * @Path: clientEncryptApplication.java
 * @Create By k
 * @Create In 2013-8-18 下午6:38:13
 * TODO
 */
package client;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

import concretestrategy.EncryptStrategyTwo;
import concretestrategy.EncyptStrategyOne;
import context.EncryptContext;

/**
 * @Class Name EncryptApplication
 * @Author k
 * @Create In 2013-8-18
 */
public class EncryptApplication {

	/**
	 * @Methods Name main
	 * @Create In 2013-8-18 By k
	 * @param args void
	 */
	public static void main(String[] args) {
		File fileOne = new File("F://A.txt");
		System.out.println(fileOne.canRead());
		System.out.println(fileOne.exists());
		File fileTwo = new File("F://B.txt");
		String s = "";
		EncryptContext context = new EncryptContext();//创建上下文对象
		context.setStrategy(new EncyptStrategyOne("你好 hello"));//上下文对象使用策略
		context.encryptFile(fileOne);
		System.out.println(fileOne.getName() + "加密后的内容:");
		try {
			FileReader in = new FileReader(fileOne);
			BufferedReader inTwo = new BufferedReader(in);
			while((s=inTwo.readLine())!=null){
				System.out.println(s);
			}
			in.close();
			inTwo.close();
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String str = context.decryptFile(fileOne);
		System.out.println(fileOne.getName() + "解密后的内容");
		System.out.println(str);
		context.setStrategy(new EncryptStrategyTwo());//使用策略2
		context.encryptFile(fileTwo);
		System.out.println(fileTwo.getName() + "加密后的内容");
		try {
			FileReader reader = new FileReader(fileTwo);
			BufferedReader buffer = new BufferedReader(reader);
			while((s = buffer.readLine())!=null){
				System.out.println(s);
			}
			reader.close();
			buffer.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String str2 = context.decryptFile(fileTwo);
		System.out.println(fileTwo.getName() +  "解密后的内容");
		System.out.println(str2);
		
	}

}
