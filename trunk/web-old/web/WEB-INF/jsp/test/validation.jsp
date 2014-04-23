<%--
  Created by IntelliJ IDEA.
  User: yanwt
  Date: 2010-1-11
  Time: 20:43:57
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head><title>后台验证</title></head>
  <body>
  <form action="./validation.html" method="post">
      <br>
      name:<input name="name" value="${validation.name}" /> ${nameerror}<br>
      password:<input name="password" value="${validation.password}"/> ${passworderror} <br>
      email:<input name="email" value="${validation.email}"/> ${emailerror}<br>
      test:<input name="test" value="${validation.test}"/>${testerror} <br>
      <input type="submit">
  </form>
  ${results}
  </body>
</html>