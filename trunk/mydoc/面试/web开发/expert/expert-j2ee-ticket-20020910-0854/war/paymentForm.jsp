
<%@ taglib uri="/i21" prefix="i21" %>

<%@ taglib uri="/c" prefix="c" %>


<html>

<head>


<form action="test.html" method="POST">

<i21:hasBindErrors>
	There were <%=count%> errors
	<p>
</i21:hasBindErrors>


		

Postal code:
<br>
<i21:bind value="user.billingAddress.postcode">


		<c:if test="${bind.error}">
			<font color="red"><b>
				<c:out value="${bind.errorMessage}"/>
			</b></font>
			<br>
		</c:if>

<input type="text" length="16" name="billingAddress.postcode"
		value="<c:out value="${bind.value}" />">
		
		
<c:forTokens var="postcode" items="SE10,N1,SE8"
              delims=",">
     <c:if test="${bind.value == postcode}">--></c:if>
  		<c:out value="${postcode}"/>
  	<br>
</c:forTokens>
		
		
</i21:bind>		
			
<p>		
			
Email:	
<br>
<i21:bind value="user.email">

	<c:choose>
	<c:when test="${bind.fromBean}">
		<c:out value="${bind.value}" />
	</c:when>
	<c:when test="${bind.fromError}">
		<font color="red"><b><c:out value="${bind.errorMessage}"/></b></font>
		<br>
		<center>
		<input type="text" length="2" size="30" name="email" value="<c:out value="${bind.value}" />"  />
		</center>
	</c:when>
	
	<c:otherwise>
		<input type="text" length="2" size="30" name="email" value="<c:out value="${bind.value}" />"  />
	</c:otherwise>
	</c:choose>

</i21:bind>







<%--
Postal code:
<br>
<i21:bind name="user" property="billingAddress.postcode">
	<i21:bindError>
		<font color="red"><b><%=message%></b></font>
		<br>
	</i21:bindError>

<input type="text" length="16" name="billingAddress.postcode"
				value="<%=value%>">
</i21:bind>		
			
<p>		
			
Email:	
<br>
<i21:bind name="user" property="email">
	<i21:bindError>
		<font color="red"><b><%=message%></b></font>
		<br>
		<center>
		<input type="text" length="2" size="30" name="email" value="<%=value%>"  />
		</center>
	</i21:bindError>


	<i21:noBindError>
		<input type="text" length="2" size="30" name="email" value="<%=value%>"  />
	</i21:noBindError>

</i21:bind>

--%>

<p/>

<input type = "submit" value="Submit"  />




</form>

</body>

</html>
