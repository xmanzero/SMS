<%-- 
    Document   : home
    Created on : May 20, 2014, 1:52:46 PM
    Author     : smile_000
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="connectdb.MySQLConnect" %>
<%@page import="path.Dir" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="resource/css/default.css" media="screen"/>
        <title>Trang chủ</title>
    </head>
    <body>
        <div id="wrapper">

            <div id="top_nav">
                <ul>
                    <li><a href="home.jsp">Trang chủ</a></li>
                  			
                </ul>
            </div>

            <div id="header">
                <div id="logo">
                    SMS<span class="color"> 1.0</span>
                </div>
            </div>
            <div id="content">

                <div id="l_col">
                    <h3>Side Menu</h3>
                    <ul>
                        <li><a href="home.jsp">Trang chủ</a></li>
                       

                    </ul>
                    <br />
                    <span class="search">
                        <%
                            String user = (String) session.getAttribute("user");
                            if (user != null) {
                                out.print("<label>Xin chao: ");
                                out.print(session.getAttribute("user"));
                                out.print("</label>");

                        %>
                        <form action="logout.jsp" method="post"><button type="submit" name="log">Thoát</button></form>
                        <% } else {
                                response.sendRedirect("index.jsp");
                            }
                        %>
                    </span>
                </div>

                <div id="r_col">
                    <%
                        String id = (String) request.getParameter("id");
                        if (id != null) {
                            MySQLConnect connect = new MySQLConnect(Dir.localhost, Dir.user, Dir.pass, Dir.database);
                            ResultSet res = connect.excuteQuery("Select PhoneNumber,CalledNumber,FullContent from all_sms_queue_in where id='" + id + "'");
                            out.print("<table id='edittb'>");
                            out.print("<form action='ProcessEdit_in.jsp' method='post'>");
                            while (res.next()) {
                                out.print("<tr><td class='tbcat' width='20%'>PhoneNumber</td>");
                                out.print("<td class='inf' ><input name ='PhoneNumber' type='text' style='width:320px;' value='" + res.getString("PhoneNumber") + "'/></td></tr>");
                                out.print("<tr><td class='tbcat' width='20%'>CalledNumber</td>");
                                out.print("<td class='inf' ><input name ='CalledNumber' type='text' style='width:320px;' value='" + res.getString("CalledNumber") + "'/></td></tr>");
                                out.print("<tr><td class='tbcat' width='20%'>FullContent</td>");
                                out.print("<td class='inf' ><textarea name ='FullContent'  rows='5' cols='40'>"+ res.getString("FullContent")+"</textarea></td></tr>");
                                out.print("<input type='hidden' name='id' value='"+id+"'/>");
                            }
                            out.print("<tr><td class='tbcat'></td><td class='inf'><button name='btsubmit' style='width:90px;' type='submit'>Lưu Lại</button><button style='width:90px;' type='reset'>Hủy</button></td></tr>");
                            out.print("</form></table>");
                        }
                    %>
                    <br clear="all" />
                </div>

                <div id="footer">
                    &copy; 2007 MySite.com | Design by <a href="http://www.ininedesign.com">Utah Web Design</a>
                </div>
            </div>
    </body>
</html>
