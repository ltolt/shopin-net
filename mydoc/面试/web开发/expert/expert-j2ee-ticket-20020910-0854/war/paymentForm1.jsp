
<%@ taglib uri="/i21" prefix="i21" %>



<html>

<head>

<%--
<script language="JavaScript" >
	function submitForm() {
		document.forms[0].cardNumber.value = document.forms[0].ccn1.value + document.forms[0].ccn2.value
			+document.forms[0].ccn3.value + document.forms[0].ccn4.value ;
		document.forms[0].expiry.value = document.forms[0].expiry1.value + document.forms[0].expiry2.value;
		//document.forms[0].submit();
		alert(document.forms[0].cardNumber.value + " - " + document.forms[0].expiry.value);
	}
</script>
--%>

</head>

<body>

<%--
Email is <%=user.getEmail() %> <br>
Postcode is <%=user.getBillingAddress().getPostcode() %> <br>
--%>

<form action="confirmation.html" method="GET">


The total cost of these 6 tickets will be $1082.50, including a booking fee of
$2.50.

<h3>Payment details</h3>

Email message is [<i21:message code="emailRequired" />]



	Choose a credit card:
	<table>
		<tr>
			<td width="150"><input type="radio" name="cct" value="visa" >Visa</td>
			<td width="150"><input type="radio" name="cct" value="mc">MasterCard</td>
			<td width="150"><input type="radio" name="cct" value="amex">Amex</td>
		</tr>
	</table>



<table>

			<tr>
			<td>Name shown on card</td>
			<td><input type="text" length="16" size="40" name="cardName"/></td>
			</tr>

			<!-- Use JavaScript to assemble -->
			<tr>
					<td>Card number</td>
					<%-- Populated by JavaScript 
					Getting back is a bastard
					<input type="hidden" name="cardNumber" value="" />
					--%>
			
			</tr>
			
			<tr>
				<td>
				<i21:bindError name="purchase" property="cardNumber">
											<font color="red"><%=message%></font>
				</i21:bindError>
				<input type="text" name="cardNumber" value="<i21:getProperty name="purchase" property="cardNumber" />" size="20"/>
					
				</td>
					<!--
					<td><input type="text" size="4" length="4" max="4" name="ccn1"/>&nbsp;-
					<input type="text" size="4" name="ccn2"/>&nbsp;-
					<input type="text" size="4" name="ccn3"/>&nbsp;-
					<input type="text" size="4" name="ccn4"/></td>
					-->
			</tr>

			<tr>
			<td>Expiry date</td>
				<td>
				
					<i21:bindError name="purchase" property="expiry">
							<font color="red"><%=message%></font>
					</i21:bindError>
			
				<input type="text" name="expiry" value="<i21:getProperty name="purchase" property="expiry" />" />
				
					<!-- <input type="text" size="2" name="expiry1"/>&nbsp;/
					<input type="text" size="2" name="expiry2"/>
					-->
					</td>
			</tr>


	</table>

<table>
<tr>
<td width="50%">
	Card's registered address (where you receive the statements)
</td>
<td width="50%">
	Delivery address for your tickets (if different from
	the card's registered address)
</td>

</tr>
<tr>

<td width="50%">
	<table>

		<tr>
		<td>Street</td>
		<td><input type="text" length="16" name="street"/></td>
		</tr>

		<tr>
				<td>Line 2</td>
				<td><input type="text" length="16" name="line1"/></td>
		</tr>

		<tr>
				<td>City</td>
				<td><input type="text" length="16" name="city"/></td>
		</tr>
		<tr>
		<i21:bindError name="user" property="billingAddress.postcode">
				<font color="red"><%=message%></font>
				<br/>
		</i21:bindError>
		
			<td>Postal code</td>
			<td><input type="text" length="16" name="billingAddress.postcode"
				value="<i21:getProperty name="user" property="billingAddress.postcode"/>"></td>
		</tr>
		<!--
		Only support a few countries?
		<tr>
			<td>Country?</td>
			<td><input type="text" length="16" name="cardNumber"/></td>
		</tr>
		-->

	</table>
</td>

<td>
	<table>

			<tr>
			<td>Street</td>
			<td><input type="text" length="16" name="street"/></td>
			</tr>

			<tr>
					<td>Line 2</td>
					<td><input type="text" length="16" name="line2"/></td>
			</tr>

			<tr>
					<td>City</td>
					<td><input type="text" length="16" name="city"/></td>
			</tr>
			<tr>
				<td>Postal code</td>
				<td><input type="text" length="16" name="postcode"/></td>
			</tr>
			

	</table>
</td>

</tr>
</table>

<input type="checkbox" name="collect"/>
Do not send by post, I will collect from the Box Office myself.


<p/>
<i21:bindError name = "user" property="email">
		<font color="red"><b><%=message%></b></font>
		<br/>
	</i21:bindError>
Your email address (to send purchase confirmation to):
<input type="text" length="2" size="30" name="email" value="<i21:getProperty name="user" property="email" />" />

<p/>

<A href="javascript:submitForm()" >Submit - fix this JavaScript</A>
<input type = "submit" value="Debit my credit card" action="javascript:submitForm()" />



<%--
	
	
	<bind:error property="billingAddress.postcode">
			<font color="red"><b><%=message%></b></font>
			<br/>
		</bind:error>
	Postcode: <input type="text" name="billingAddress.postcode" value="<bind:value property="billingAddress.postcode" />" />
--%>
<br/>
<p>




</form>

</body>

</html>


<jsp:include page="jsp/debug/debug.jsp" />