/**
 * spring-mybaits-jpetstore--下午4:20:49--Administrator
 * net.shopin.jpetstore.mybatis--2012-11-22
 *  TODO 
 */
package base.framework.util;

import org.mybatis.generator.ant.GeneratorAntTask;

/**
 * mybatis - generator 工具类 
 * @author Administrator
 *
 */
public class MyBatisGenerator {

	/**
	 * @param args
	 *void
	 */
	public static void main(String[] args) {
		try{
			GeneratorAntTask task = new GeneratorAntTask();
			task.setConfigfile("src/generatorConfig.xml");
			task.execute();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		
		
		
		

	}

}
