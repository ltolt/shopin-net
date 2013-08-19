/**
 * 说明:
 *     具体观察者角色
 *     
 * @Probject Name: design-pattern
 * @Path: observer.concreteUniversityObserver.java
 * @Create By k
 * @Create In 2013-8-19 下午10:35:36
 * TODO
 */
package observer.concrete;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.RandomAccessFile;

import observer.JobObserver;
import subject.JobSubject;

/**
 * @Class Name UniversityObserver
 * @Author k
 * @Create In 2013-8-19
 */
public class UniversityObserver implements JobObserver {

	File file;
	JobSubject subject;
	
	
	public UniversityObserver(String filename, JobSubject subject) {
		this.subject = subject;
		subject.addObserver(this);//注册当前观察者到主题
		this.file = new File(filename);
	}


	/* (non-Javadoc)
	 * @see observer.JobObserver#hearTelephone(java.lang.String)
	 */
	@Override
	public void hearTelephone(String heardMess) {
		
		try {
			RandomAccessFile out = new RandomAccessFile(file, "rw");
			out.seek(out.length());
			byte[] b = heardMess.getBytes();
			out.write(b);//更新文件中的内容
			System.out.println("我是一个中国大学生");
			System.out.println("我想文件:" + file.getName() + "写入如下内容:");
			System.out.println(heardMess);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}

}
