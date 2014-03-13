<%--
	How NOT to write a JSP
--%>

<%@ page errorPage="jsp/debug/debug.jsp" %>

<%@ page import="javax.naming.InitialContext" %>
<%@ page import="com.wrox.expertj2ee.ticket.boxoffice.BoxOffice" %>
<%@ page import="com.wrox.expertj2ee.ticket.exceptions.NoSuchPerformanceException" %>
<%@ page import="com.wrox.expertj2ee.ticket.boxoffice.ejb.*" %>


<jsp:useBean id="queryBean" 
	class="com.wrox.expertj2ee.ticket.web.Model1Bean"
	scope="session">
	<jsp:setProperty name="queryBean" property="*" />
</jsp:useBean>

<html>
<head>
<title>Model 1 JSP</title>
</head>

<body>

Welcome to JSP Model 1!

Please select performance and seat type

<form method="GET" >
	<input type="text" name="id" value="<jsp:getProperty name="queryBean" property="id" />" />
	<input type="text" name="type" value="<jsp:getProperty name="queryBean" property="type" />" />
	<input type="submit" name="submit" value="Select" />
</form>


<% if (request.getParameter("submit") != null) { %>

	Checking seat availability...<br>


<%
	int freeSeats = 0;

	InitialContext ic = new InitialContext();
	Object o = ic.lookup("java:comp/env/ejb/BoxOffice");
	BoxOfficeHome home = (BoxOfficeHome) o;

	BoxOffice boxOffice = home.create();
	
	try {
		freeSeats = boxOffice.getFreeSeatCount(queryBean.getId(), queryBean.getType());
%>

		There are currently <%=freeSeats%> free seats 
		for performance with id <jsp:getProperty name="queryBean" property="id" />.

		<% } catch (NoSuchPerformanceException ex) { %>

		There's no performance with id <jsp:getProperty name="queryBean" property="id" />.
		
		<br>Please try another id.

<% }


} %>

</body>
</html>


