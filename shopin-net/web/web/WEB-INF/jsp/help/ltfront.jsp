<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %><%
	String a_id  = request.getParameter("a_id");    //我们网站下联盟会员ID。
	String m_id  = request.getParameter("m_id");    //广告主在LINKTECH网站的ID
	String c_id  = request.getParameter("c_id");   //广告点击数。
	String l_id  = request.getParameter("l_id");   //广告序号
	String l_type1 = request.getParameter("l_type1"); //广告类型，
	String rd    = request.getParameter("rd");      //COOKIE生存周期
	String url   = request.getParameter("url");     //广告主banner目标地址 

	////set merchant domain name as ".linktech.cn"
	String merchant_domain = "www.shopin.net";

	if(a_id==null || m_id==null || c_id==null || l_id==null || l_type1==null || url==null)
   		out.print("<html><head><script language=\"javascript\"> alert('LPMS: Parameter Error'); history.go(-1);</script></head></html>");
	else
	{
		response.setHeader("P3P", "CP=\"NOI DEVa TAIa OUR BUS UNI\""); 
		Cookie ltinfo = new Cookie("LTINFO", a_id + "|" + c_id + "|" + l_id + "|" + l_type1 + "|");
		ltinfo.setPath("/"); 
		ltinfo.setDomain(merchant_domain);//添加广告主域名
		if(Integer.parseInt(rd)!=0) ltinfo.setMaxAge(60*60*24*Integer.parseInt(rd));
		Cookie ltype = new Cookie("LTYPE", "linktech");
		ltype.setPath("/");
        ltype.setDomain(merchant_domain);//添加广告主域名

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        Cookie ltypes = new Cookie("LTYPES", "linktech"+"time"+sdf.format(new Date()));
        ltypes.setPath("/");
        ltypes.setDomain(merchant_domain);
        if(Integer.parseInt(rd)!=0) ltype.setMaxAge(60*60*24*Integer.parseInt(rd));
		response.addCookie(ltinfo);
		response.addCookie(ltype);
		response.addCookie(ltypes);
	}
%>

<html><head><script language="javascript"> document.location.replace("<%=url%>"); </script><meta http-equiv="Content-Type" content="text/html; charset=utf-8"></head></html>
