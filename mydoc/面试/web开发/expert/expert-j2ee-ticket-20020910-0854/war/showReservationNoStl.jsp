

<%@ page session="false" %>



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

<html>
<title>Seats reserved for <%=performance.getShow().getName()%></title>

<% 
	java.text.SimpleDateFormat df = new java.text.SimpleDateFormat();
	df.applyPattern("EEEE MMMM dd, yyyy");
	String formattedDate = df.format(performance.getWhen()); 
	df.applyPattern("h:mm a");
	String formattedTime = df.format(performance.getWhen()); 
	
	java.text.NumberFormat cf = java.text.NumberFormat.getCurrencyInstance();
	String formattedTotalPrice = cf.format(reservation.getTotalPrice());
	String formattedBookingFee = cf.format(reservation.getQuoteRequest().getBookingFee());
%>

</head>

<body>
<b><%=performance.getShow().getName()%>: <%=formattedDate%>
at
<%=formattedTime%>
</b>
<br/>
<p>




<%= reservation.getSeats().length %> seats in 


<%=priceband.getDescription()%>

<%--
WHOA! this is broken in Jetty/Jasper!! can't find this property, 
presumably because it comes from a superinterface of PriceBand.
<jsp:getProperty name="priceband" property="description" /> 
--%>

have been reserved
for you for
<jsp:getProperty name="reservation" property="minutesReservationWillBeValid" /> 
minutes to give you time to complete your purchase.
The seat numbers are 
<ul>
<% for (int i = 0; i < reservation.getSeats().length; i++) { %>
	
	<li><%= reservation.getSeats()[i].getName()%>
<% } %>

</ul>

<p/>
The total cost of these tickets will be <%=formattedTotalPrice%>.
This includes a booking fee of
<%=formattedBookingFee%>.

<p/>

<% if (!reservation.getSeatsAreAdjacent()) { %>
	<b>Please note that due to lack of availability, some of the
	seats offered are not adjacent.
</b>


	<table cellspacing="0" cellpadding="10">
	<tr>
	<td>
	<form method="GET" action="payment.html">


	<input type="submit" value="Try another date"></input>

<% } %>


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

<% String seatingPlanImage = "static/seatingplans/" + performance.getShow().getSeatingPlanId() + ".jpg"; %>


<img src="<%=seatingPlanImage%>" />