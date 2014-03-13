
<%@  include file="/jsp/debug/commandTrace.jspf" %>


<br/>
<%
	java.util.Enumeration enum = request.getAttributeNames();
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
