package base.framework;

import java.lang.reflect.Method;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;


import base.framework.util.BeanUtil;
import base.framework.util.Infos;
import base.framework.util.Validation;


public class AbstractControllerSupport {
	
	
	
	public Infos init(HttpServletRequest request,String action,String method,Object cond,String validate) {
		String url = request.getRequestURI();
		Infos infos = new Infos(url,action, method);
		if(cond!=null){
			infos.setCondMesssage(BeanUtil.Cond2UrlParams(cond));
		}
		if(validate!=null && !"".equals(validate.toString())) doMethodValidate(infos, cond, validate);
		return infos;
	}
	
	public Infos init(HttpServletRequest request,String action,String method,String validate) {
		String url = request.getRequestURI();
		StringBuffer condStr = new StringBuffer("");
		Enumeration paramNames = request.getParameterNames();
		while(paramNames.hasMoreElements()) {
			String paramString = (String)paramNames.nextElement();
			if("password".equals(paramString)) {
				condStr.append(paramString + "=******, ");
			} else {
				condStr.append(paramString + "=" + request.getParameter(paramString) + ", ");
			}
		}
		Infos infos = new Infos(url,action, method, condStr.toString());
		return infos;
	}
	
	
	//方法级验证
		public void doMethodValidate(Infos infos, Object cond,String validate) {
			Validation validation = new Validation(infos);
			String validationMethodName ="do"+ validate.substring(0,1).toUpperCase()+validate.substring(1)+"Validate";
			 Method validationMethod = null;
				try {
						synchronized (this) { //获取方法需要同步 
							if(cond.getClass()!=null && cond.getClass().getMethod(validationMethodName,Validation.class)!=null){
								validationMethod = cond.getClass().getMethod(validationMethodName,Validation.class);
							}
						}
						if( validationMethod!=null ) 	validationMethod.invoke(cond, validation);
				} catch (Exception e) {
				} 
		}
		
	
	
	
	
	
	

}
