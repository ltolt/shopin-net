<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><c:forEach var="p" items="${list}" varStatus="status">${date}	${p.time}	${p.ltinfo}	${p.orderCode}	${p.price}	<c:if test="${p.stat=='1'}">100</c:if><c:if test="${p.stat=='-1'||p.stat=='0'}">300</c:if><c:if test="${p.stat=='2'||p.stat=='3'||p.stat=='4'}">200</c:if>
</c:forEach>