/**
 * 说明:\
 *    
 *     适配器模式的客户端
 * @Probject Name: design-pattern
 * @Path: clientAdapterApplication.java
 * @Create By k
 * @Create In 2013-8-15 上午12:10:28
 * TODO
 */
package client;

import adaptee.TwoElectricOutlet;
import adapter.ThreeAndTwoAdapter;
import adapter.ThreeElectricAdapter;
import target.ThreeElectriceOutlet;

/**
 * @Class Name AdapterApplication
 * @Author k
 * @Create In 2013-8-15
 */
public class AdapterApplication {

	/**
	 * @Methods Name main
	 * @Create In 2013-8-15 By k
	 * @param args void
	 */
	public static void main(String[] args) {
		ThreeElectriceOutlet outlet;//目标接口(大家都实现三相接口)
		Wash wash = new Wash();//洗衣机
		outlet = wash;//洗衣机插在三相插座上
		System.out.println("使用三相插座接通电流:");
		outlet.connectElectricCurrent();//开始洗衣服
		TV tv = new TV();//电视机
		ThreeElectricAdapter adapter = new ThreeElectricAdapter(tv);//把电视插在适配器上
		outlet = adapter;//适配器插在三相插座上
		System.out.println("使用三相插座接通电流:");
		outlet.connectElectricCurrent();
		
		TwoElectricOutlet twoOutlet;//俩相插座
		ThreeAndTwoAdapter doubleAdapter = new ThreeAndTwoAdapter(wash, tv);//双向适配器
		outlet = doubleAdapter;//双向适配器插在三相插座上
		System.out.println("使用三相");
		outlet.connectElectricCurrent();
		twoOutlet = doubleAdapter;//双向适配器插在俩相插座上
		System.out.println("俩相插座");
		twoOutlet.connectElectricCurrent();

	}

}


/**
 * 说明:
 *     洗衣机对象使用三相插座
 * @Class Name Wash
 * @Author k
 * @Create In 2013-8-15
 */
class Wash implements ThreeElectriceOutlet{
	String name ;
	
	public Wash() {
		name = "小鸭洗衣机";
	}
	
	@Override
	public void connectElectricCurrent() {
		turnOn();
	}
	
	public void turnOn(){
		System.out.println(name + "开始洗衣服");
	}
	
}
/**
 * 说明:
 *      电视机使用俩相电接口
 * @Class Name TV
 * @Author k
 * @Create In 2013-8-15
 */
class TV implements TwoElectricOutlet{
	String name;
	
	
	public TV() {
		this.name = "三星电视机";
	}
	

	@Override
	public void connectElectricCurrent() {
		turnOn();
	}
	void turnOn(){
		System.out.println(name + "开始放节目");
	}
	
}

