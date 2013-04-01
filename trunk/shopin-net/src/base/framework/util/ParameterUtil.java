/**
 * @author luxiangxing
 * @time   2008-4-25
 * @email  xiangxingchina@163.com
 * @tel    13488766519
 */

package base.framework.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Properties;

public class ParameterUtil {
	private String propertiesfilepath;
	private HashMap paras;
	public ParameterUtil() {
	
	}
	
	public void setPropertiesFile(String propertiesfilepath) {
		this.propertiesfilepath = propertiesfilepath;
		if(paras==null){
			initFile();
		}
	}

	//1.解析文件 放入存储对象
	public void initFile(){
		ClassLoader loader = this.getClass().getClassLoader();
	    InputStream is = loader.getResourceAsStream(this.propertiesfilepath);
	    Properties props = new Properties();
	    paras = new HashMap();
	    try {
	      props.load(is);
	      Enumeration propNames = props.propertyNames();
	      while(propNames.hasMoreElements()){
	        String propName = (String)propNames.nextElement();
	        paras.put(propName,props.get(propName));
	      }
	    }
	    catch (IOException ex) {
	      paras = null;
	      ex.printStackTrace();
	    }
	}
	
	//2.读取数据
	public String getValue(String key){
		if(paras==null) return "";
		return (String)paras.get(key)==null?"":(String)paras.get(key);
	}
	 
	//获取全部数据
	public HashMap getAll(){
		    return paras;
	}

	public String getPropertiesfilepath() {
		return propertiesfilepath;
	}

	public void setPropertiesfilepath(String propertiesfilepath) {
		this.propertiesfilepath = propertiesfilepath;
	}
	
	
}
