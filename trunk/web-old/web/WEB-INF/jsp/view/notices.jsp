<%--
  Created by IntelliJ IDEA.
  User: yanwt
  Date: 2010-2-24
  Time: 16:29:15
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
  <head>
      <title>网站公告-上品折扣官方网站,100%正品,1-6折天天低价,1小时抢购!实体店供货,10天退换,全国送货上门!-www.shopin.net</title>
  </head>
  <body>
  <div id="page">
      <div class="niceimg"><img src="${images}/w_53.gif"></div>
      <div><c:forEach var="notice" items="${notices}" varStatus="status"></div>
         <div class="nicefont">·
         <c:choose>
               <c:when test="${not empty notice.link}">
                  <a href="${notice.link}" target="_blank">
               </c:when>
               <c:otherwise>
                  <a href="${ctx}/notice/${notice.sid}.html" target="_blank">
               </c:otherwise>
           </c:choose>${fn:substring(notice.noticesTime, 0,10)}&nbsp;&nbsp;${notice.title}</a>
      </c:forEach></div>
      <div class="yahoo2"> ${page} </div>
  </div>
  </body>
</html>