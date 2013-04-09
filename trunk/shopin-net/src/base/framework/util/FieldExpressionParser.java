/**
 * 说 明  : 字段表达式
 * author: 陆湘星
 * data  : 2011-5-19
 * email : xiangxingchina@163.com
 **/

package base.framework.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;



public class FieldExpressionParser {
	static String VALIDATOR_BASE_PACKAGE = "com.framework.validation.validators.";// 验证规则类所在包
	private boolean result = true ;
	private String msg = null ;
	
	
	
	/**
	 * 针对一个表达式
	 * @author luxiangxing 
	 * @param objMap
	 * @param expression
	 */
	public void doValidation(Map objMap,String expression,boolean isAll){
		this.result =  true; this.msg = "";
		String[] parts = expression.split(",");
		if(parts!=null && parts.length>=3){
			String[] fieldNames = parts[0].trim().split(" ");
			 String[] fieldDescs = parts[1].trim().split(" ");
			 String[] expressions = parts[2].trim().split(" ");
			 if(fieldNames!=null && expressions !=null && fieldNames.length>0 && expressions.length>0){
				 List<Field> fields = new ArrayList<Field>();	
				 for (int i = 0; i < fieldNames.length; i++) {
					 String fieldName = fieldNames[i].trim();
					 String fieldDesc = fieldName;
					 if(fieldDescs!=null && fieldDescs.length==fieldNames.length){
						 fieldDesc = fieldDescs[i].trim();
					 }
					 Field field = new Field();
					 field.setFieldName(fieldName);
					 field.setFieldDesc(fieldDesc);
					 field.setValue(objMap.get(field.getFieldName()));
					 fields.add(field);
				 }
				 for (int i = 0; i < expressions.length; i++) {
					String theExpressions = expressions[i].trim();
					if(theExpressions!=null && !"".equals(theExpressions)){
						String[] theExpressionArgs= theExpressions.split("-");
						String className = VALIDATOR_BASE_PACKAGE;
						List<String> args = new ArrayList<String>(); 
						if( theExpressionArgs != null && theExpressionArgs.length > 0 ){
							for (int j = 0; j < theExpressionArgs.length; j++) {
								if(j<3){
									className += theExpressionArgs[j].trim().substring(0,1).toUpperCase()+theExpressionArgs[j].trim().substring(1);
								}else{
									args.add( theExpressionArgs[j].trim() );
								}
							}
						}
						AbstractValidator validator = null;
						try {
							 validator = (AbstractValidator)Class.forName(className).newInstance();
						} catch (Exception e) {
							//e.printStackTrace();
						} 
						if(validator!=null){
							validator.doValidator(fields, args, isAll);
							if(result) result = validator.getResult();
							this.msg += validator.getMessage()+" ";
						}
					}
				 }
			 
			 }
			
		}
	}
	
	public boolean getResult(){
		return result;
	}
	
	public String getMessage(){
		return msg;
	}
	
	
}
