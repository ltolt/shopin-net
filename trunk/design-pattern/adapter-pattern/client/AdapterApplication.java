/**
 * ˵��:\
 *    
 *     ������ģʽ�Ŀͻ���
 * @Probject Name: design-pattern
 * @Path: clientAdapterApplication.java
 * @Create By k
 * @Create In 2013-8-15 ����12:10:28
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
		ThreeElectriceOutlet outlet;//Ŀ��ӿ�(��Ҷ�ʵ������ӿ�)
		Wash wash = new Wash();//ϴ�»�
		outlet = wash;//ϴ�»��������������
		System.out.println("ʹ�����������ͨ����:");
		outlet.connectElectricCurrent();//��ʼϴ�·�
		TV tv = new TV();//���ӻ�
		ThreeElectricAdapter adapter = new ThreeElectricAdapter(tv);//�ѵ��Ӳ�����������
		outlet = adapter;//�������������������
		System.out.println("ʹ�����������ͨ����:");
		outlet.connectElectricCurrent();
		
		TwoElectricOutlet twoOutlet;//�������
		ThreeAndTwoAdapter doubleAdapter = new ThreeAndTwoAdapter(wash, tv);//˫��������
		outlet = doubleAdapter;//˫���������������������
		System.out.println("ʹ������");
		outlet.connectElectricCurrent();
		twoOutlet = doubleAdapter;//˫���������������������
		System.out.println("�������");
		twoOutlet.connectElectricCurrent();

	}

}


/**
 * ˵��:
 *     ϴ�»�����ʹ���������
 * @Class Name Wash
 * @Author k
 * @Create In 2013-8-15
 */
class Wash implements ThreeElectriceOutlet{
	String name ;
	
	public Wash() {
		name = "СѼϴ�»�";
	}
	
	@Override
	public void connectElectricCurrent() {
		turnOn();
	}
	
	public void turnOn(){
		System.out.println(name + "��ʼϴ�·�");
	}
	
}
/**
 * ˵��:
 *      ���ӻ�ʹ�������ӿ�
 * @Class Name TV
 * @Author k
 * @Create In 2013-8-15
 */
class TV implements TwoElectricOutlet{
	String name;
	
	
	public TV() {
		this.name = "���ǵ��ӻ�";
	}
	

	@Override
	public void connectElectricCurrent() {
		turnOn();
	}
	void turnOn(){
		System.out.println(name + "��ʼ�Ž�Ŀ");
	}
	
}

