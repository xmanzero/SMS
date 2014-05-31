<%-- 
    Document   : CheckIn
    Created on : May 20, 2014, 11:45:43 AM
    Author     : smile_000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="process.CheckLogin" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
            if (!request.getParameter("username").isEmpty() && !request.getParameter("password").isEmpty()) {
                String nameuser = request.getParameter("username");
                String pass = request.getParameter("password");
                
                CheckLogin obj = new CheckLogin(nameuser, pass);
                if (obj.Validate()) {
                    session.setAttribute("role", obj.getRole());
                    session.setAttribute("user",nameuser);
                    out.println("<script>window.location='home.jsp'</script>");
                   
                } else {
                    out.println("<script>alert('Tai khoan khong dung!')</script>");
                    out.println("<script>window.location='index.jsp'</script>");
                }
            }
        %>
    </body>
</html>
