<%-- 
    Document   : logout
    Created on : May 20, 2014, 3:42:37 PM
    Author     : smile_000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
           session.removeAttribute("user");
           session.removeAttribute("role");
           response.sendRedirect("index.jsp");
       %>
    </body>
</html>
