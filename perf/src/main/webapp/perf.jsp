<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  long t1 = System.currentTimeMillis();
  //cpu执行时间
  String cpucount = request.getParameter("cpuc");
  int count = Integer.parseInt(cpucount);
  int n = 0;
  double d = 0;
  long l = 0;
  for (int i = 0; i < count; i++) {
          for(long b = 0; b < 100; b++) {
                  n++; d++; l++; n = n * 2;   n -= 1; l --; d = l + n; d = l + n; d ++;
          }
          d ++; l ++; n ++;
  }
  out.println(n); out.println(d); out.println(l);
long t2 = System.currentTimeMillis(); out.println("cpu time:"); out.println((t2 - t1)); out.println("ms<br>");
%>

