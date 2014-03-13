<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>

	<!-- Make this available globally -->
	<xsl:variable name="reqInfo" select="/reservationInfo/item[@key='request-info']"/>


<xsl:template match="/*">
	<xsl:apply-templates select="item[@key='performance']"/>
</xsl:template>


<xsl:template match="item[@key='performance']">
	<html>
		<head>
		<title>Seats reserved for <xsl:value-of select="show/name"/></title>
	</head>

	(XSLT)
	<body>
	<b><xsl:value-of select="show/name" />: 
	TIME
	</b>
	<br/>
	<br/>

	<!-- Invoke template from root -->
	<xsl:apply-templates select="/reservationInfo/item[@key='reservation']" />
	

	<!-- Form without any parameters: just needs to look like a form to the user -->
	<form method="GET" action="payment.html">
		<input type="submit" value="Proceed"></input>
	</form>


	Please check the seating plan below for the location of the reserved seats.
	<br/>
	<br/>
	
	<!-- By declaring a variable, we can easily output an attribute -->
	<xsl:variable name="seatingPlanImage">static/seatingplans/<xsl:value-of 
		select="show/seatingPlanId"/>.jpg</xsl:variable>

	<img src="{$seatingPlanImage}" />
	</body>
	</html>
</xsl:template>


<xsl:template match="item[@key='reservation']">

	<xsl:value-of select="quoteRequest/seatsRequested" />
	seats in 
	<xsl:value-of select="/reservationInfo/item[@key='priceband']/description" />
	have been reserved
	for you for
	<xsl:value-of select="minutesReservationWillBeValid" />
	minutes to give you time to complete your purchase.
	The seat numbers are:

	<ul>
	<xsl:for-each select="seats/item">
		<li/><xsl:value-of select="name" />
	</xsl:for-each>
	</ul>

	<p/>
	The total cost of these tickets will be 
	COST
	This includes a booking fee of
	COST2


	<xsl:if test="not (seatsAreAdjacent='true')" >
		<b>Please note that due to lack of availability, some of the
		seats offered are not adjacent.</b>
		<form method="GET" action="payment.html">
			<input type="submit" value="Try another date" />
		</form>
	</xsl:if>
</xsl:template>


<!-- Match the node created by the dateTimeElement() extension function -->
<xsl:template match="formatted-date">
	<xsl:value-of select="day-of-week"/><xsl:text> </xsl:text> 
 	<xsl:value-of select="month"/><xsl:text> </xsl:text> 
 	<xsl:value-of select="day-of-month"/>, 
 	<xsl:value-of select="year"/>
 	at
 	<xsl:value-of select="hours"/>:<xsl:value-of select="minutes"/> 
 	<xsl:text> </xsl:text>
 	<xsl:value-of select="am-pm"/>
</xsl:template>

</xsl:stylesheet>
