/**
 * 说 明     : 验证接口
 * author: 陆湘星
 * data  : 2011-5-28
 * email : xiangxingchina@163.com
 **/
package base.framework.util;


public class Validation {
	private  Infos condInfos = null;
	private  boolean result =  true ;
	AbstractCondtion cond = null;
	public Validation(Infos condInfos) {
		this.condInfos = condInfos; 
	}
	
	public  void setCondtion(AbstractCondtion cond){
		this.cond = cond;
		condInfos.setCondMesssage(cond.toString());
		doBaseValidation(cond);
	}
	
	public  String getCondtionKey(){
		MD5Utils md5 = new MD5Utils();
		return md5.getMD5String(cond.toString());
	}
	
	//基本信息验证
	public  void doBaseValidation(AbstractCondtion cond ){
		if(cond.getOptUid()==null||"".equals(cond.getOptUid())){
			result = false;
			condInfos.setInfoFail4return("optUid 验证失败！");
		}else if(cond.getIpAddress()==null||"".equals(cond.getIpAddress())){
			result = false;
			condInfos.setInfoFail4return("IpAddress 验证失败！");
		}
	}
	
	//扩展自定义验证
	public  void errorInfo(String codeInfo){
			result = false;
			condInfos.setInfoFail4return("验证失败:"+codeInfo);
	}
	
	
	//权限信息验证
	public void doPowerValidation(){
		
//		if(result){
//			String action=condInfos.getAction();
//			String method=condInfos.getMethod();
//			String userName=cond.getUserName();
//			String userPasswd=cond.getPassword();
//			String userIp=cond.getIpAddress();
//			XMemcachedManager xmc=new XMemcachedManager();
//			Object obj=xmc.getVal("role_"+userName);
//			String userinfo="";
//			if(obj!=null){
//				userinfo=obj.toString();
//			}
//			JSONObject jo = JSONObject.fromObject(userinfo);
//			Map map = (Map)JSONObject.toBean(jo, Map.class);
//			String mUserName=map.get("userName").toString();
//			String mPasswd=map.get("userPasswd").toString();
//			String mUserIp=map.get("userIp").toString();
//			MorphDynaBean functionAction=(MorphDynaBean) map.get("functionAction");
//			if(!mUserName.equals(userName)){
//				result = false;
//				condInfos.setInfo4pda(CodeInfo.验权失败);
//				condInfos.printInfo("---------用户名不对-----------");
//			}else if(!mPasswd.equals(userPasswd)){
//				result = false;
//				condInfos.setInfo4pda(CodeInfo.验权失败);
//				condInfos.printInfo("---------密码不对-----------");
//			}else if(!mUserIp.equals(userIp)){
//				result = false;
//				condInfos.setInfo4pda(CodeInfo.验权失败);
//				condInfos.printInfo("---------IP地址不对-----------");
//			}
//			if(functionAction.getDynaClass().getDynaProperty(action)!=null){
//				MorphDynaBean methodmap=(MorphDynaBean) functionAction.get(action);
//				if(methodmap.getDynaClass().getDynaProperty(method)!=null){
//					if(!methodmap.get(method).toString().equals("1")){
//						result = false;
//						condInfos.setInfo4pda(CodeInfo.验权失败);
//						condInfos.printInfo("---------资源没权限-----------");
//					}
//				}
//			}
//		}
		
	}

	/**
	 * 扩展验证框架 
	 * @return
	 */
	public void doValidation(Object cond,String expression){
		if(result){
			ValidationFramework validation = new ValidationFramework();
			validation.doValidation(cond, expression);
			if(!validation.getResult()){
				result = false;
				condInfos.setInfoFail4return("验证失败:"+validation.getMessage());
			}
		}
	}

	public boolean getResult() {
		return result;
	}

	public void setResult(boolean result) {
		this.result = result;
	}

	
	
}
