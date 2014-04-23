<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
    <body>
       用户名:${username};<br/>
       密码:${password};<br/>
       登录结果:${flag==true?'成功':'失败'};
    </body>
</html>