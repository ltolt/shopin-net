/**
 * ˵��:
 *     �涨�˾���������Ҫʵ�ֵ����,ɾ���۲����Լ�֪ͨ
 *     �۲��߸������ݵķ���
 * @Probject Name: design-pattern
 * @Path: subjectJobSubject.java
 * @Create By k
 * @Create In 2013-8-19 ����10:17:10
 * TODO
 */
package subject;

import observer.JobObserver;

/**
 * @Class Name JobSubject
 * @Author k
 * @Create In 2013-8-19
 */
public interface JobSubject {
	public void addObserver(JobObserver o);
	public void deleteObserver(JobObserver o);
	public void notifyObservers();

}
