
<%@ page session="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>



<jsp:useBean id="bookingData"
			type="com.wrox.expertj2ee.ticket.web.model.BookingFormModel"
			 scope="request"
/>

<html>

<fmt:formatDate value="${bookingData.performance.when}" type="date" pattern="EEEE MMMM dd, yyyy" var="performanceDate"  />




<head>
<title><%=bookingData.getPerformance().getShow().getName()%> on 
<c:out value="${performanceDate}"  />
</title>

</head>



<!-- Sep forms -->

<!-- PDF for ie -->
<form method="POST" action="reservation.html" >

	<input type="hidden" name="performanceID" value="<%=bookingData.getPerformance().getId()%>"/>
		<input type="hidden" name="classID" value="<%=bookingData.getSeatTypeInfo().getSeatTypeId()%>"/>


		<b><%=bookingData.getPerformance().getShow().getName()%>: 
		
<c:out value="${performanceDate}"  />
		at
<fmt:formatDate value="${bookingData.performance.when}" type="time" pattern="h:mm a"   />
		</b>

		<p/>

		<b><%=bookingData.getSeatTypeInfo().getDescription()%> (<%=bookingData.getSeatTypeInfo().getName()%>) at $<%=bookingData.getSeatTypeInfo().getPrice()%></b>
		<br/>

	<br/>
		Number of tickets:
		<select name="seatsRequested">
			<option value="1" selected="yes">1</option>
			<% for (int i = 1; i <= bookingData.getMaxDropdownValue(); i++) { %>
				<option value="<%=i %>"><%=i %></option>
			<% } %>
			
		</select>
	<br/>

	<br/>

	<input type="submit" value="Proceed" />

</form>

<br/>



