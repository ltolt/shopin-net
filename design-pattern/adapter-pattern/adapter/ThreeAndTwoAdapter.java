/**
 * 角色:
 *     双向适配器
 * @Probject Name: design-pattern
 * @Path: adapterThreeAndTwoAdapter.java
 * @Create By k
 * @Create In 2013-8-15 上午12:36:35
 * TODO
 */
package adapter;

import target.ThreeElectriceOutlet;
import adaptee.TwoElectricOutlet;

/**
 * @Class Name ThreeAndTwoAdapter
 * @Author k
 * @Create In 2013-8-15
 */
public class ThreeAndTwoAdapter implements ThreeElectriceOutlet,
		TwoElectricOutlet {
	ThreeElectriceOutlet  threeOutlet;
	TwoElectricOutlet twoOutlet;
	
	
	
	
	public ThreeAndTwoAdapter(ThreeElectriceOutlet threeOutlet,
			TwoElectricOutlet twoOutlet) {
		super();
		this.threeOutlet = threeOutlet;
		this.twoOutlet = twoOutlet;
	}




	/* (non-Javadoc)
	 * @see target.ThreeElectriceOutlet#connectElectricCurrent()
	 */
	@Override
	public void connectElectricCurrent() {
		if(this instanceof ThreeElectriceOutlet)
			threeOutlet.connectElectricCurrent();//Three是被适配接口
		if(this instanceof TwoElectricOutlet)
			twoOutlet.connectElectricCurrent();//two是被适配接口
	}
	

}
