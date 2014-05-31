<%-- 
    Document   : ProcessEdit
    Created on : May 21, 2014, 4:32:07 PM
    Author     : smile_000
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="connectdb.MySQLConnect" %>
<%@page  import="path.Dir" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if (request.getParameter("btsubmit") != null) {
                int id = Integer.parseInt(request.getParameter("id"));
                String PhoneNumber = request.getParameter("PhoneNumber");
                String CalledNumber = request.getParameter("CalledNumber");
                String FullContent = request.getParameter("FullContent");
                try {
                    Integer.parseInt(PhoneNumber);
                    Integer.parseInt(CalledNumber);
                    MySQLConnect connect = new MySQLConnect(Dir.localhost, Dir.user, Dir.pass, Dir.database);
                    connect.updateQuery("Update all_sms_queue_in Set PhoneNumber='" + PhoneNumber + "',CalledNumber='" + CalledNumber + "',FullContent='" + FullContent + "'Where id='" + id + "'");
                    response.sendRedirect("home.jsp");
                    //out.print("<script>window.location.reload();window.history.go(-2); </script>");
                } catch (Exception e) {
                    out.print("<script>window.history.back()</script>");
                }

            } else {
                response.sendRedirect("index.jsp");
            }
        %>

    </body>
</html>
