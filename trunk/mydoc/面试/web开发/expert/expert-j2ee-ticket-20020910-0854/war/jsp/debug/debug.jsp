
<%@page import="java.util.*,javax.servlet.http.*" %>

<%@page session="false" %>


<html>

<%=new java.util.Date() %>

<a href="./noval.html">Link</a>

<hr>
<font size =-1 color="brown">
<b>Request parameters</b>
<%
	Enumeration enum = request.getParameterNames();
	while (enum != null && enum.hasMoreElements()) {
		String name = (String) enum.nextElement();
		String val = request.getParameter(name); %>
		<li><%=name%>=<%=val%>		
	<% }	// while
%>
</font>

<hr>
<font color="blue" size=-1>
<b>Request attributes</b>

<br>ServletPath=<%=request.getServletPath()%>
<br>RequestURI=<%=request.getRequestURI()%>
<br>ContextPath=<%=request.getContextPath()%>
<br>PathInfo=<%=request.getPathInfo()%>
<br>UserPrincipal=<%=request.getUserPrincipal()%>

<br>Request class is <%=request.getClass()%>
<br>

<!-- Request stuff -->
<%
	enum = request.getAttributeNames();
	while (enum.hasMoreElements()) {
		String name = (String) enum.nextElement();
		Object obj = request.getAttribute(name);
%>
		<li>
		<%=name%> =
<%
		if (obj instanceof Exception) { 
			Exception exception = (Exception) obj; %>
			<font color="red">
			<% exception.printStackTrace(new java.io.PrintWriter(out)); %>
			</font>
			<% }
		else { %>			
			<% if (obj != null) { %>
<%--				<%=new com.interface21.beans.BeanWrapperImpl(obj)%> --%>
				[<%=obj%>]
			<% } else { %>
				<b>null</b>
			<% } %>
			<br>
		<% } 
	}	// while
%>

<hr>
<font color="green">
<b>Session attributes</b>
<!-- Session stuff -->

<% HttpSession sess = request.getSession(false); %>


<%
	if (sess != null) {
		enum = sess.getAttributeNames();
		while (enum.hasMoreElements()) {
			String name = (String) enum.nextElement();
			Object obj = sess.getAttribute(name); %>
			<li><%=name%>=
			<% if (obj != null) { %>
				<%=obj%>
			<% } else { %>
				<b>null</b>
			<% } %>
		<% }	// while
	}	// if
	else {
		out.println("No session");
	}
%>
</font>

<hr>
<font color="magenta">
<b>Cookies</b>
<%
	Cookie[] cookies = request.getCookies();
        if (cookies != null)
	    for (int i = 0; i < cookies.length; i++) { %>
	        	<li><b><%=cookies[i].getName()%></b> : <%=cookies[i].getValue()%>
	    <% }
%>
</font>

<hr>
<font color="gray">
<b>Application attributes</b>
<!-- Session stuff -->
<%
	enum = pageContext.getAttributeNamesInScope(PageContext.APPLICATION_SCOPE);
	while (enum.hasMoreElements()) {
		String name = (String) enum.nextElement();
		Object obj = pageContext.getAttribute(name, PageContext.APPLICATION_SCOPE); %>
		<li><%=name%>=
		<% if (obj != null) { %>
			<%=obj%> hashCode=<%=obj.hashCode()%>
		<% } else { %>
			<b>null</b>
		<% } %>
	<% }	// while
%>
</font>

<hr>
<font color="black" size=-1>
<b>Request headers</b>

<!-- Request stuff -->
<%
	enum = request.getHeaderNames();
	while (enum.hasMoreElements()) {
		String name = (String) enum.nextElement();
		String header = request.getHeader(name);
		%>
		<li>
		<%=name%>=<%=header%>
	<% }	%>


</font>


<hr>
<font color="gray" size=-1>
<b>Class loader hierarchy</b>

<%
	out.println(com.interface21.beans.ClassLoaderAnalyzer.showClassLoaderHierarchy(this, "debug.jsp", "<br>", "&nbsp;&nbsp;&nbsp;"));
	
	out.println("<p>");
	
	out.println(com.interface21.beans.ClassLoaderAnalyzer.showClassLoaderHierarchy(request, "request", "<br>", "&nbsp;&nbsp;&nbsp;"));
%>

</font>
