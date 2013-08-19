/**
 * ˵��:
 *     ʵ��������ľ�������
 *     ��������ְ���ĵ�����
 * @Probject Name: design-pattern
 * @Path: subject.concreteSeekJobCenter.java
 * @Create By k
 * @Create In 2013-8-19 ����10:23:29
 * TODO
 */
package subject.concrete;

import java.util.ArrayList;

import observer.JobObserver;
import subject.JobSubject;

/**
 * @Class Name SeekJobCenter
 * @Author k
 * @Create In 2013-8-19
 */
public class SeekJobCenter implements JobSubject {

	String mess;
	boolean changed;
	ArrayList<JobObserver> personList;//��Ź۲������õ��������Ա�

	public SeekJobCenter() {
		personList = new ArrayList<JobObserver>();
		mess = "";
		changed = false;
	}

	/* (non-Javadoc)
	 * @see subject.JobSubject#addObserver(observer.JobObserver)
	 */
	@Override
	public void addObserver(JobObserver o) {
		if(!personList.contains(o)){
			personList.add(o);//�ѹ۲��ߵ�������ӵ��������Ա�
		}
	}

	/* (non-Javadoc)
	 * @see subject.JobSubject#deleteObserver(observer.JobObserver)
	 */
	@Override
	public void deleteObserver(JobObserver o) {
		if(personList.contains(o)){
			personList.remove(o);
		}
	}

	public void notifyObservers() {
		if(changed){  //֪ͨ���еĹ۲���
			for(int i = 0;i < personList.size();i++){
				JobObserver observer = personList.get(i);
				observer.hearTelephone(mess);//�ù۲��߽����绰
			}
			changed = false;
		}
		
	}

	public void giveNewMess(String str){
		if(str.equals(mess))
			changed = false;
		else
			mess = str;
		    changed = true;
	}
	

}
