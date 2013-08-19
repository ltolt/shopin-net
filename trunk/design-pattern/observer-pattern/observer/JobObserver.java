/**
 * 说明:
 *     观察者更新数据的接口
 * @Probject Name: design-pattern
 * @Path: observerJobObserver.java
 * @Create By k
 * @Create In 2013-8-19 下午10:20:04
 * TODO
 */
package observer;

/**
 * @Class Name JobObserver
 * @Author k
 * @Create In 2013-8-19
 */
public interface JobObserver {

	public void hearTelephone(String heardMess);
}
