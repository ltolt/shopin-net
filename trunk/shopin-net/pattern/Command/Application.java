/**
 * @Probject Name: shopin-net-google
 * @Path: CommandApplication.java
 * @Create By k
 * @Create In 2013-5-5 下午10:25:46
 * TODO
 */
package Command;

/**
 * 说明:
 *     使用命令模式的应用程序
 * @Class Name Application
 * @Author k
 * @Create In 2013-5-5
 */
public class Application {

	/**
	 * @Methods Name main
	 * @Create In 2013-5-5 By k
	 * @param args void
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		CompanyArmy army = new CompanyArmy();//创建接受者
		Command command = new ConcreteCommand(army);//创建具体命令并指定接受者
		Invoker invoker = new Invoker();
		invoker.setCommand(command);
		invoker.startExcuteCommand();
		
		
	}

}
