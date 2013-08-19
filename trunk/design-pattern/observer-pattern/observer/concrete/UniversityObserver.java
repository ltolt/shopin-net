/**
 * ˵��:
 *     ����۲��߽�ɫ
 *     
 * @Probject Name: design-pattern
 * @Path: observer.concreteUniversityObserver.java
 * @Create By k
 * @Create In 2013-8-19 ����10:35:36
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
		subject.addObserver(this);//ע�ᵱǰ�۲��ߵ�����
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
			out.write(b);//�����ļ��е�����
			System.out.println("����һ���й���ѧ��");
			System.out.println("�����ļ�:" + file.getName() + "д����������:");
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
