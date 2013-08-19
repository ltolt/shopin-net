/**
 * 说明:
 *     实现了主题的具体主题
 *     类似于求职中心的作用
 * @Probject Name: design-pattern
 * @Path: subject.concreteSeekJobCenter.java
 * @Create By k
 * @Create In 2013-8-19 下午10:23:29
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
	ArrayList<JobObserver> personList;//存放观察者引用的数组线性表

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
			personList.add(o);//把观察者的引用添加到数组线性表
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
		if(changed){  //通知所有的观察者
			for(int i = 0;i < personList.size();i++){
				JobObserver observer = personList.get(i);
				observer.hearTelephone(mess);//让观察者接听电话
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
