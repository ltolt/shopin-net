package com.shopin.modules.web.filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.UUID;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DefaultFilter
        implements Filter
{
    private String[] parameters;
    private String cartId = "cartid";

    public void init(FilterConfig filterConfig) throws ServletException {
        this.parameters = filterConfig.getInitParameter("parameters").split(",");
        this.cartId = filterConfig.getInitParameter("cartid");
    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;
        String sid = null;
      /*  //浏览器本地缓存协商测试方法--kongm start 20131121
        SimpleDateFormat format=new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss",Locale.ENGLISH);
        String ims = request.getHeader("If-Modified-Since"); 
        if (ims != null) 
        { 
        try 
        { 
        Date dt = format.parse(ims.substring(0, ims.length()-4)); 
        if (dt.after(new Date(new Date().getTime() - 24 * 3600 * 1000))) 
        { 
        response.setStatus(304); 
        return;
        } 
        } catch(Exception e) 
        { 
        	e.printStackTrace();
        } 
        } 
        response.setHeader("Last-Modified", format.format(new Date()) + " GMT"); 
        
        //浏览器本地缓存协商测试方法--kongm end 20131121
*/        try {
            Cookie[] cookies = request.getCookies();
            String referer = "";
            if ((cookies != null) && (cookies.length > 0)) {
                for (int i = 0; i < cookies.length; i++) {
                    Cookie sCookie = cookies[i];
                    if (sCookie.getName().equals("referer")) {
                        referer = sCookie.getValue();
                    }
                    if (sCookie.getName().equals(this.cartId)) {
                        sid = sCookie.getValue();
                    }
                }
            }
            if ("".equals(referer)) {
                referer = request.getHeader("Referer");
                Cookie from = new Cookie("referer", referer);
                from.setDomain("shopin.net");
                from.setPath("/");
                response.addCookie(from);
            }
            if ((sid == null) || ("".equals(sid))) {
                sid = UUID.randomUUID().toString();
                Cookie cookie = new Cookie(this.cartId, sid);
                cookie.setMaxAge(2592000);
                cookie.setDomain("shopin.net");
                cookie.setPath("/");
                response.addCookie(cookie);
            }
            for (int i = 0; i < this.parameters.length; i++) {
                String parameter = this.parameters[i];
                try {
                    String value = request.getParameter(parameter);
                    if ((null != value) && (!"".equals(value))) {
                        if(parameter.equals("cid")){
                            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
                            value=value+"time"+sdf.format(new Date());
                        }
                        Cookie cookie = new Cookie(parameter, value);
                        cookie.setMaxAge(2592000);
                        cookie.setPath("/");
                        cookie.setDomain("shopin.net");
                        response.addCookie(cookie);
                    }
                }
                catch (Exception e) {
                }
            }
            if (request.getMethod().toUpperCase().equals("HEAD")) return;
        } catch (Exception e) {
        }
        finally {
            if (("GET".equals(request.getMethod().toUpperCase())) || ("POST".equals(request.getMethod().toUpperCase())))
                filterChain.doFilter(request, response);
            else
                printMethod(request, response);
        }
    }

    public void destroy()
    {
    }

    protected void printMethod(HttpServletRequest req, HttpServletResponse resp) throws IOException
    {
        PrintWriter writer = resp.getWriter();
        String method = req.getMethod();
        writer.println("Thank you for calling me with the " + method + " nethod.");
    }
}