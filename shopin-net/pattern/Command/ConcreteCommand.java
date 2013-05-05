/**
 * @Probject Name: shopin-net-google
 * @Path: CommandConcreteCommand.java
 * @Create By k
 * @Create In 2013-5-5 下午9:04:52
 * TODO
 */
package Command;

/**
 *  说明:
 *    具体请求
 * @Class Name ConcreteCommand
 * @Author k
 * @Create In 2013-5-5
 */
public class ConcreteCommand implements Command {

	CompanyArmy army;//含有接受者的引用
	
   	
	
	public ConcreteCommand(CompanyArmy army) {
		super();
		this.army = army;
	}




	public void excute() {//封装这指挥官的请求
		// TODO Auto-generated method stub
		army.sneakAttack(); //偷袭敌人
	}
	
	
	
	

}
