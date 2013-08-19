/**
 * 说明:
 *     规定了具体主题需要实现的添加,删除观察者以及通知
 *     观察者更新数据的方法
 * @Probject Name: design-pattern
 * @Path: subjectJobSubject.java
 * @Create By k
 * @Create In 2013-8-19 下午10:17:10
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
