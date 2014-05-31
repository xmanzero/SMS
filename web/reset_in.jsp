<%-- 
    Document   : process
    Created on : May 20, 2014, 5:10:33 PM
    Author     : smile_000
--%>

<%@page import="java.sql.Statement"%>
<%@page import="path.Dir"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="connectdb.MySQLConnect" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            MySQLConnect connect = new MySQLConnect(Dir.localhost, Dir.user, Dir.pass, Dir.database);
            Statement stm = connect.getStatement();

            if (request.getParameter("btreset") != null) {
                /*String[] value = null;
                value = request.getParameterValues("reset");

                if (value != null) {
                    for (int i = 0; i < value.length; i++) {
                        int k = Integer.parseInt(value[i]);

                        stm.addBatch("update all_sms_queue_in set CalledNumber=0 where id='" + k + "'");
                        //connect.updateQuery("update all_sms_queue_in set CalledNumber=0 where id='" + k + "'");

                    }
                    stm.executeBatch();

                } */
                stm.executeUpdate("update all_sms_queue_in set CalledNumber=0");

            } else if (request.getParameter("btdelete") != null) {

                String[] value = null;
                value = request.getParameterValues("reset");

                if (value != null) {
                    for (int i = 0; i < value.length; i++) {
                        int k = Integer.parseInt(value[i]);
                        stm.addBatch("Delete From all_sms_queue_in where id='"+k+"'");
                    }
                    stm.executeBatch();
                }
            }
            stm.close();
            response.sendRedirect("home.jsp");
        %>
    </body>
</html>
