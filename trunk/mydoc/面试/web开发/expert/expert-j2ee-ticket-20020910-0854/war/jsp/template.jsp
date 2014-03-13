<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">


<%@ page session="false" %>

<%-- 
	The following bean definitions list the
	parameters required by this JSP, as either static
	or dynamic attributes.
--%>

<jsp:useBean id="header" 
    type="java.lang.String" 
    scope="request"
/>

<jsp:useBean id="contentWell" 
    type="java.lang.String" 
    scope="request"
/>

<jsp:useBean id="footer" 
    type="java.lang.String" 
    scope="request"
/>


<!-- Main template -->

<HTML>
<HEAD>
<TITLE>Could parameterize title</TITLE>
</HEAD>

<!-- Begin content from <%=header%> -->
<jsp:include page="<%=header%>" />
<!-- End content from <%=header%> -->

<hr>


<!-- Begin content from <%=contentWell%> -->
<jsp:include page="<%=contentWell%>" />
<!-- End content from <%=contentWell%> -->


<%-- Optional section 
<% if (request.getAttribute("note") != null) { %>
	<div id="legal">
		<%=request.getAttribute("note")%>
	</div>
<% } %>
--%>


<hr>
<font size="2">

<!-- Begin content from <%=footer%> -->
<jsp:include page="<%=footer%>" />
<!-- End content from <%=footer%> -->

</font>

</BODY>
</HTML>
