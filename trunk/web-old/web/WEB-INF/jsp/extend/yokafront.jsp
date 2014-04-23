<%
	String a_id    = request.getParameter("a_id");      //合作商家为YOKA指定的标识
	String rd    = request.getParameter("rd");      //COOKIE生存周期
	String url   = request.getParameter("url");     //广告主banner目标地址 
	String yokainfo   = request.getParameter("yokainfo");     // yokainfo记录在cookie中，便于订单跟踪
    rd = rd == null||rd.equals("") ? "0" : rd;

	String merchant_domain = "www.shopin.net";

	if(url==null || yokainfo==null )
   		out.print("<html><head><script language=\"javascript\"> alert('LPMS: Parameter Error'); history.go(-1);</script></head></html>");
	else
	{
		response.setHeader("P3P", "CP=\"NOI DEVa TAIa OUR BUS UNI\""); 
		Cookie ltinfo = new Cookie("LTINFO", yokainfo);
		ltinfo.setPath("/");
		ltinfo.setDomain(merchant_domain);//添加广告主域名
		if(Integer.parseInt(rd)!=0) ltinfo.setMaxAge(60*60*24*Integer.parseInt(rd));
		Cookie ltype = new Cookie("LTYPE", a_id);
		ltype.setPath("/");
		ltype.setDomain(merchant_domain);//添加广告主域名
		if(Integer.parseInt(rd)!=0) ltype.setMaxAge(60*60*24*Integer.parseInt(rd));
		response.addCookie(ltinfo);
		response.addCookie(ltype);
	}
%>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8"></head>
<body><script language="javascript"> document.location.replace("<%=url%>"); </script></body>
</html>