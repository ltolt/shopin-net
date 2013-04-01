/**
*@author luxiangxing
*/

package base.framework.util;

import java.util.Map;

import com.util.BeanUtil;

public class ValidationFramework {
	boolean flag = true;
	StringBuffer msg = new StringBuffer();
	public void doValidation(Object obj,String expression) {
		 doValidation(obj, expression, false);
	}
	
	
	public void doValidation(Object obj,String expression,boolean isAll) {
		if(obj==null){
			flag = false;
			msg.append(obj.getClass().getName()+" 验证对象为空");
		}else{
			//1.实体对象 -- 存入map中
			Map objmap = BeanUtil.Obj2Map(obj);
			FieldExpressionParser parser = new FieldExpressionParser();
			//2.根据表达式 拆分成字段表达式
			String[] validations = expression.split(";");
			//3.根据字段表达式 进行验证
			if(validations!=null && validations.length >0){
				for (int i = 0; i < validations.length; i++) {
					 if(i==0 || flag || isAll  ){
						parser.doValidation(objmap, validations[i],isAll);
						if(flag) flag= parser.getResult();
						msg.append(parser.getMessage()).append(" ");
					 }
				}
			}
		}
	}
	
	
	public boolean getResult(){
		return flag;
	}
	public String getMessage(){
		return msg.toString();
	}
	
}
