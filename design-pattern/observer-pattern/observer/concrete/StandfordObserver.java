/**
 * @Probject Name: design-pattern
 * @Path: observer.concreteStandfordObserver.java
 * @Create By k
 * @Create In 2013-8-19 下午10:42:42
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
 * @Class Name StandfordObserver
 * @Author k
 * @Create In 2013-8-19
 */
public class StandfordObserver implements JobObserver {
	File file;
	JobSubject subject;

	public StandfordObserver(String filename, JobSubject subject) {
		this.subject = subject;
		subject.addObserver(this);
		this.file = new File(filename);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see observer.JobObserver#hearTelephone(java.lang.String)
	 */
	@Override
	public void hearTelephone(String heardMess) {
		boolean flag = heardMess.contains("程序员")||heardMess.contains("软件");
		if(flag){
			try {
				RandomAccessFile out = new RandomAccessFile(file, "rw");
				out.seek(out.length());
				byte[] b = heardMess.getBytes();
				out.write(b);
				System.out.println("我是斯坦福毕业");
				System.out.println("我想" + file.getName() + "写入");
				System.out.println(heardMess);
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}else{
				System.out.println("为包含内容");
		}
		
	}

}
