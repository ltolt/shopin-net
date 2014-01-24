/**
 * @Probject Name: Algorithm
 * @Path: net.shopin.interviewFileSystemClassLoader.java
 * @Create By kongm
 * @Create In 2014-1-16 下午4:21:35
 * TODO
 */
package net.shopin.interview;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

/**
 *  文件系统类加载器
 * @Class Name FileSystemClassLoader
 * @Author kongm
 * @Create In 2014-1-16
 */
public class FileSystemClassLoader extends ClassLoader {

	private String rootDir;
	
	
	
	
	public FileSystemClassLoader(String rootDir) {
		this.rootDir = rootDir;
	}

	
	


	@Override
	protected Class<?> findClass(String name) throws ClassNotFoundException {
		byte[] classData = getClassData(name);
		if(classData == null){
			throw new ClassNotFoundException();
		}else{
			return defineClass(name, classData, 0, classData.length);
		}
	}

	private byte[] getClassData(String className){
		String path  = classNameToPath(className);
		try {
			InputStream ins = new FileInputStream(path);
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			int buffersize = 4096;
			byte[] buffer = new byte[buffersize];
			int bytesNumRead  = 0;
			while((bytesNumRead = ins.read(buffer))!= -1){
				baos.write(buffer,0,bytesNumRead);
			}
			return baos.toByteArray();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	private String classNameToPath(String className){
		return rootDir + File.separatorChar 
				+ className.replace('.',File.separatorChar) + ".class";
	}
	
	
	

	@Override
	public String toString() {
		return "FileSystemClassLoader@" + hashCode();
	}





	/**
	 * @Methods Name main
	 * @Create In 2014-1-16 By kongm
	 * @param args void
	 * @throws ClassNotFoundException 
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 */
	public static void main(String[] args) throws ClassNotFoundException, InstantiationException, IllegalAccessException {
		FileSystemClassLoader loader = new FileSystemClassLoader("F:\\webapp\\Algorithm\\target\\classes");
		Class c =  loader.loadClass("net.shopin.interview.Sample");
		Object o =  c.newInstance();
		System.out.println(o);
		ClassLoader cl = o.getClass().getClassLoader();
		while(cl != null){
			System.out.println(cl.toString());
			cl = cl.getParent();
		}
	}

}
