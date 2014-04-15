<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%
	String a_id    = request.getParameter("a_id");      //合作商家为chanet指定的标识
	String rd    = request.getParameter("rd");      //COOKIE生存周期
	String url   = request.getParameter("url");     //广告主banner目标地址 
	String info   = request.getParameter("info");     // chanetinfo记录在cookie中，便于订单跟踪
    rd = rd == null||rd.equals("") ? "0" : rd;

	String merchant_domain = "shopin.net";

	if(url==null || info==null )
   		out.print("<html><head><script language=\"javascript\"> alert('LPMS: Parameter Error'); history.go(-1);</script></head></html>");
	else
	{
		response.setHeader("P3P", "CP=\"NOI DEVa TAIa OUR BUS UNI\""); 
		Cookie ltinfo = new Cookie("LTINFO", info);
		ltinfo.setPath("/");
		ltinfo.setDomain(merchant_domain);//添加广告主域名
		if(Integer.parseInt(rd)!=0) ltinfo.setMaxAge(60*60*24*Integer.parseInt(rd));
		Cookie ltype = new Cookie("LTYPE", a_id);
		ltype.setPath("/");
		ltype.setDomain(merchant_domain);//添加广告主域名
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        Cookie ltypes = new Cookie("LTYPES", "yiqifa"+"time"+sdf.format(new Date()));
        ltypes.setPath("/");
        ltypes.setDomain(merchant_domain);
		if(Integer.parseInt(rd)!=0) ltype.setMaxAge(60*60*24*Integer.parseInt(rd));
		response.addCookie(ltinfo);
		response.addCookie(ltype);
		response.addCookie(ltypes);
	}
%>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8"></head>
<body><script language="javascript"> document.location.replace("<%=url%>"); </script></body>
</html>