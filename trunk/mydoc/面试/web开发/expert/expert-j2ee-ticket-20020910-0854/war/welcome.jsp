
<%@ page session="false" %>


<jsp:useBean id="genres"
			type="java.util.List"
			 scope="request"
/>


<!-- BADLY NEEDS STL -->

Welcome to the X Center

<br>


	<table>
	
	<% for (int i = 0; i < genres.size(); i++) { %>
	
		<% com.wrox.expertj2ee.ticket.referencedata.Genre genre = (com.wrox.expertj2ee.ticket.referencedata.Genre) genres.get(i); %>

		<tr>
		<td><%= genre.getName()%> </td>

			<td width="200" align="justified">
			
		<form method="GET" action="show.html">
		<select name="id">
			<option value="0" selected="yes">--- Make a selection ----</option>
			<% for (int j = 0; j < genre.getShows().size(); j++) { %>
				<% com.wrox.expertj2ee.ticket.referencedata.Show show = (com.wrox.expertj2ee.ticket.referencedata.Show) genre.getShows().get(j); %>
				<option value="<%= show.getId()%>"><%= show.getName()%></option>
			<% } %>
		</select>

		<td>
		<input type="submit" value="Go" />
		</form>
		</td>
		</tr>
	
	<% } %>


	</table>

