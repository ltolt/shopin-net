/**
 * 说明:  
 *     适配器模式中适配器角色
 *     
 * @Probject Name: design-pattern
 * @Path: adapterThreeElectricAdapter.java
 * @Create By k
 * @Create In 2013-8-15 上午12:07:00
 * TODO
 */
package adapter;

import adaptee.TwoElectricOutlet;
import target.ThreeElectriceOutlet;

/**
 * @Class Name ThreeElectricAdapter
 * @Author k
 * @Create In 2013-8-15
 */
public class ThreeElectricAdapter implements ThreeElectriceOutlet {

	TwoElectricOutlet outlet;
	
	
	public ThreeElectricAdapter(TwoElectricOutlet outlet) {
		this.outlet = outlet;
	}


	
	
	/* (non-Javadoc)
	 * @see target.ThreeElectriceOutlet#connectElectricCurrent()
	 */
	@Override
	public void connectElectricCurrent() {
		outlet.connectElectricCurrent();

	}

}
