

<%@ page session="false" %>

<%-- JSP STL --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>



<jsp:useBean id="performance"
		type="com.wrox.expertj2ee.ticket.referencedata.Performance"
			scope="request"
/>

<jsp:useBean id="priceband"
		type="com.wrox.expertj2ee.ticket.referencedata.PriceBand"
			scope="request"
/>

<jsp:useBean id="reservation"
		type="com.wrox.expertj2ee.ticket.boxoffice.Reservation"
			scope="request"
/>


<!-- JSP STL -->


<html>
<title>Seats reserved for <%=performance.getShow().getName()%></title>
</head>

<body>
<b><c:out value="${performance.show.name}"/>: 
<%-- Date format patterns are defined in java.text.SimpleDateFormat --%>
<fmt:formatDate value="${performance.when}" type="date" pattern="EEEE MMMM dd, yyyy"  />
at
<fmt:formatDate value="${performance.when}" type="time" pattern="h:mm a"   />
</b>
<br/>
<p>

<%= reservation.getSeats().length %>
<%--
<c:out value="${reservation.seats.length}"/> --%>
seats in 
<c:out value="${priceband.description}"/>
have been reserved
for you for
<c:out value="${reservation.minutesReservationWillBeValid}" /> 
minutes to give you time to complete your purchase.
The seat numbers are 

<ul>
<c:forEach var="seat" items="${reservation.seats}">
	<li><c:out value="${seat.name}"/> 
</c:forEach>
</ul>

</i>

<p/>
The total cost of these tickets will be 
<fmt:formatNumber value="${reservation.totalPrice}" type="currency"/>.
This includes a booking fee of
<fmt:formatNumber value="${reservation.quoteRequest.bookingFee}" type="currency"/>.

<p/>

<c:if test="${!reservation.seatsAreAdjacent}" >
	<b>Please note that due to lack of availability, some of the
	seats offered are not adjacent.</b>
	<form method="GET" action="payment.html">
		<input type="submit" value="Try another date"></input>
	</form>
</c:if>


</form>

</td>
<td>

<!-- Form without any parameters: just needs to look like a form to the user -->
<form method="GET" action="payment.html">

<input type="submit" value="Proceed"></input>


</form>

</td>
</tr>
</table>


Please check the seating plan below for the location of the reserved seats.

<br/>
<br/>


<img src="<c:out value="static/seatingplans/${performance.show.seatingPlanId}.jpg" />" />


<%--

<jsp:include page="jsp/debug/debug.jsp" />

--%>