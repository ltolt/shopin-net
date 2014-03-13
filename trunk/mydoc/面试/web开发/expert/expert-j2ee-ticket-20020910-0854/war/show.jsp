<%-- USE JSTL --%>

<%@ page session="false" %>

<%@ page import="com.wrox.expertj2ee.ticket.referencedata.*,com.wrox.expertj2ee.ticket.command.*" %>


<jsp:useBean id="show"
	type="com.wrox.expertj2ee.ticket.referencedata.Show"
	 scope="request"
/>

<!-- Sep forms -->

<html>

<head>

<script language="JavaScript" >
	function submitForm(performance, type) {
		document.seatsForm.id.value = performance;
		document.seatsForm.type.value = type;
		document.seatsForm.submit();
		//alert("p=" + performance + ", type=" + type);
	}
</script>

<title>Performances of <%=show.getName()%></title>

</head>


<body>

<form name="seatsForm" method="GET" action="bookseats.html">

	<%-- These form fields are populated by JavaScript --%>
	<input type="hidden" name="id" value=""/>
	<input type="hidden" name="type" value=""/>


	<table cellpadding=10 cellspacing="0">


	<tr>

	<td width="55%"><font size='4'>Showing <i><%=show.getName()%></i> until July 2 2002</font></td>
	<td width="*"><font size='4'>Performances & availability</font></td>

	</tr>


		<tr>

		<td>

	<% String infoUrl = "static/shows/" + show.getId() + ".htm"; %>
	
	<!-- Included information about show from <%=infoUrl%> -->
	
	<jsp:include page="<%=infoUrl%>" />
	
	<!-- End included information about show from <%=infoUrl%> -->
	</td>

	<td align="top">


<!-- BOX THIS -->
<div border="10">
<font size="2">
	<i>


	Legend:
	<% for (int i = 0; i < show.getSeatTypes().size(); i++) { %>
		<% SeatType st = (SeatType) show.getSeatTypes().get(i); %>
		<%= st.getName()%> = <%= st.getDescription() %>;
	<% } %>
	<font color="red">*</font> = sold out
	</i>
	

	<br/>
	<a href="seating_plan.html">View a seating plan</a>

</font>
</div>


	<br/>
	<br/>

	<table >

	<% for (int i = 0; i < show.getPerformances().size(); i++) { %>
		<% PerformanceWithAvailability p = (PerformanceWithAvailability) show.getPerformances().get(i); %>
		<!-- Gray out if no avail? -->
		<tr <%= (i % 2 == 0) ? "" : "bgcolor=\"#E0E0E0\"" %>
		>
			<td width="150"><%= p.getWhen()%></td>
			<% for (int pbi = 0; pbi < p.getPriceBands().size(); pbi++) { %>
				<% PriceBandWithAvailability pb = (PriceBandWithAvailability) p.getPriceBands().get(pbi); %>
				
				<% if (pb.getFreeSeats() > 0) { %>
					<td width="40">
						<a href="javascript:submitForm(<%=p.getId()%>, <%=pb.getId()%>)">
						<%=pb.getName()%>
						(<%=pb.getFreeSeats()%>)
					</a></td>
				<% } else { %>
					<td width="40"><%=pb.getName()%><font color="red"><SUP>*</SUP></font></td>
				<% } %>
				
			<% } %>
		</tr>
	<% } %>
	

	</table>


</form>

<br/>

</body>

</html>

