    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
    <html>  
      <head>  
        <title>�û��б�</title>  
          
        <meta http-equiv="pragma" content="no-cache">  
        <meta http-equiv="cache-control" content="no-cache">  
        <meta http-equiv="expires" content="0">      
        <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">  
        <meta http-equiv="description" content="This is my page">  
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
        <!--  
        <link rel="stylesheet" type="text/css" href="styles.css">  
        -->  
       
      </head>  
        
      <body>  
      <#include "header.ftl" parse=true encoding="utf-8">  
      <hr/>  
      <a href="#">�û��б�</a><br/>  
      <table border="1">  
        <tr>  
            <td>�û���</td>  
            <td>����</td>  
            <td>����</td>  
            <td>id</td>  
            <td>����</td>  
        </tr>  
        <#list users as user>  
            <tr>  
                <td>${user.name}</td>  
                <td>${user.age}</td>  
                <td>  
                ${user.birthday?string("yyyy-MM-dd HH:mm:ss")}  
                </td>  
                <td>${user.id}</td>  
                <td><a href="http://localhost/htmlpage/DelUser.do?id=${user.id}">ɾ��</a></td>  
            </tr>  
        </#list>  
          
      </table>  
    <hr/>  
      <#include "footer.ftl" parse=true encoding="utf-8">  
      </body>  
    </html>  