/**
 * 说 明     : 系统相关
 * author: 陆湘星
 * data  : 2011-5-26
 * email : xiangxingchina@163.com
 **/
package base.framework.constants;


public class SystemConfig{
	//系统配置文件
	public final static String SYSTEM_PROPERTIES_FILE_NAME="system.properties";
	//定时任务配置文件
	public final static String CRON_CONFIG_FILE_NAME="cron.xml";	
	//字符分隔符
	public final static String  STRING_SPLIT_TAG = "|"; 
	
	/**
	 * 配置文件中定义的变量
	 * 1:开发 （默认）  2:测试   3:部署web 4.部署为web任务机
	 */
	public enum DeployType{
		DeployTypeDevelop(1,"开发（默认） "),
		DeployTypeTest(2,"测试"),
		DeployTypeWeb(3,"部署web"),
		DeployTypeCron(4,"部署为web任务机");
		private int type;
		private String name;
	
		private DeployType(int type) {
            this.type = type;
        }
		
	  	private DeployType(int type,String name) {
	            this.type = type;
	            this.name = name;
	    }

	  	public  static boolean hasTheDeployType(String value) {  
		     boolean flag = false;
		     DeployType[] types = DeployType.class.getEnumConstants();  
		         for (DeployType type : types) {  
		        	 if(value.trim().equalsIgnoreCase(String.valueOf(type.getType()))){
		        		 flag = true;
		        	 }
		         }  
		     return flag;
		}
	  	 
		public int getType() {
			return type;
		}

		public void setType(int type) {
			this.type = type;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}
	}
	
	public enum DebugType{
		默认(1,"默认（根据部署来确定） "),
		debug(2,"info"),
		wsInfo(3,"wsInfo"),
		importantInfo(4,"importantInfo"),
		exceptionInfo(5,"exceptionInfo"),		
		wsExceptionInfo(6,"wsExceptionInfo"),
		importantExceptionInfo(7,"importantExceptionInfo"),
		nolog(9,"nolog")
		;
		private int value;
		private String name;
		private DebugType(int value) {
            this.value = value;
        }
	  	private DebugType(int value,String name) {
	            this.value = value;
	            this.name = name;
	    }
		public int getValue() {
			return value;
		}
		public void setValue(int value) {
			this.value = value;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
	}	
	
}
