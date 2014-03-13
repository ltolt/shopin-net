<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:format="com.interface21.web.servlet.view.xslt.FormatHelper"
	 xmlns:java="java"
>

<xsl:template match="/*">
	<html>
		<head>
		<title>Seats reserved for <xsl:value-of select="item[@key='performance']/show/name"/></title>
		</head>


	<body>
	<b><xsl:value-of select="item[@key='performance']/show/name" />: 
	<xsl:apply-templates select="format:dateTimeElement(item[@key='performance']/when/time, item[@key='request-info']/language, item[@key='request-info']/country)"/>
	</b>
	<br/>
	<br/>

	<xsl:value-of select="item[@key='reservation']/quoteRequest/seatsRequested" />
	seats in 
	<xsl:value-of select="item[@key='priceband']/description" />
	have been reserved
	for you for
	<xsl:value-of select="item[@key='reservation']/minutesReservationWillBeValid" />
	minutes to give you time to complete your purchase.
	The seat numbers are:


	<ul>
	<xsl:for-each select="item[@key='reservation']/seats/item">
		<li/><xsl:value-of select="name" />
	</xsl:for-each>
	</ul>


	<p/>
	The total cost of these tickets will be 
	<xsl:value-of select="format:currency(item[@key='reservation']/totalPrice, item[@key='request-info']/language, item[@key='request-info']/country)" />.
	This includes a booking fee of
	<xsl:value-of select="format:currency(item[@key='reservation']/quoteRequest/bookingFee, item[@key='request-info']/language, item[@key='request-info']/country)" />.


	<xsl:if test="not (item[@key='reservation']/seatsAreAdjacent='true')" >
		<b>Please note that due to lack of availability, some of the
		seats offered are not adjacent.</b>
		<form method="GET" action="payment.html">
			<input type="submit" value="Try another date" />
		</form>
	</xsl:if>


	<!-- Form without any parameters: just needs to look like a form to the user -->
	<form method="GET" action="payment.html">
		<input type="submit" value="Proceed"></input>
	</form>


	Please check the seating plan below for the location of the reserved seats.
	<br/>
	<br/>
	
	<!-- By declaring a variable, we can easily output an attribute -->
	<xsl:variable name="seatingPlanImage">static/seatingplans/<xsl:value-of 
		select="item[@key='performance']/show/seatingPlanId"/>.jpg</xsl:variable>

	<img src="{$seatingPlanImage}" />


	</body>

	</html>

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
