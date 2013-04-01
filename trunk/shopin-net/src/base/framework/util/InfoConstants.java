/**
 * 说 明     : 操作信息常量
 * author: 陆湘星
 * data  : 2011-5-26
 * email : xiangxingchina@163.com
 **/
package base.framework.util;

public class InfoConstants {
	private static String INFO_CODE_SUCCESS = "SUCCESS";
	private static String INFO_CODE_FAIL = "FAIL";
	private static String INFO_CODE_EXCEPTION = "EXCEPTION";


	public enum CodeInfo {
		操作成功(INFO_CODE_SUCCESS,"操作成功!"),
		登陆成功(INFO_CODE_SUCCESS,"登陆成功!"),
		操作失败(INFO_CODE_FAIL,"操作失败!"),
		验证失败(INFO_CODE_FAIL,"验证失败!"),
		操作异常(INFO_CODE_EXCEPTION,"操作异常!")
        ;
    	private String code;
    	private String codeInfo;
		private CodeInfo() { 	}
		private CodeInfo(String code, String codeInfo) {
			this.code = code;
			this.codeInfo = codeInfo;
		}
		public String getCodeInfo() {
			return codeInfo;
		}
		public void setCodeInfo(String codeInfo) {
			this.codeInfo = codeInfo;
		}

		public String getCode() {
			return code;
		}
		public void setCode(String code) {
			this.code = code;
		}
	}

	public enum DeployType{
		开发(1,"开发"),
		测试(2,"测试"),
		部署web(3,"部署web"),
		部署为web任务机(4,"部署为web任务机")		
		;
		private int value;
		private String desc;

		private DeployType() {
		}

		private DeployType(int value, String desc) {
			this.value = value;
			this.desc = desc;
		}

		public int getValue() {
			return value;
		}

		public void setValue(int value) {
			this.value = value;
		}

		public String getDesc() {
			return desc;
		}

		public void setDesc(String desc) {
			this.desc = desc;
		}
	}
	
	public enum CategoryType {
		主页("主页","Main"),
		任务管理("任务管理","Todo"),
		笔记管理("笔记管理","Note"),
		相册管理("相册管理","Picture"),
		订阅管理("订阅管理","Feed"),
		文档管理("文档管理","Document"),
		账目管理("账目管理","Account"),
		系统管理("系统管理","System"),
		;
    	private String name;
    	private String value;
		private CategoryType() { 	}
		private CategoryType(String name, String value) {
			this.name = name;
			this.value = value;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getValue() {
			return value;
		}
		public void setValue(String value) {
			this.value = value;
		}
		
	}
	
}
