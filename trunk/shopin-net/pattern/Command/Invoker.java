/**
 * @Probject Name: shopin-net-google
 * @Path: CommandInvoker.java
 * @Create By k
 * @Create In 2013-5-5 下午9:09:25
 * TODO
 */
package Command;

/**
 * @Class Name Invoker
 * @Author k
 * @Create In 2013-5-5
 */
public class Invoker {

	Command command;//用来存放具体命令的引用
	
	public void setCommand(Command command){
		this.command = command;
	}
	
	public void startExcuteCommand(){//让具体命令执行excute
		command.excute();
	}
	
}
