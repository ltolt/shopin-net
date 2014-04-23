<%--
  Created by IntelliJ IDEA.
  User: yanwt
  Date: 2010-2-24
  Time: 16:15:52
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>

<html>
  <head>
      <title>${notice.title}-上品折扣网shopin.net- 商场名牌2-5折限量秒杀,正品保障,网上购物!服装品牌,名品折扣,名牌打折,团购价!上品折扣官方购物网站</title>
      <link rel="stylesheet" href="${css}/notice.css"/>
  </head>
  <body>
  <div id="notice_page">
      <div class="notice_title">${notice.title}</div>
      <div class="notice_content">
          ${notice.content}
      </div>
  </div>
  </body>
</html>