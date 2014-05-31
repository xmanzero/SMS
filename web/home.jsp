<%-- 
    Document   : home
    Created on : May 20, 2014, 1:52:46 PM
    Author     : smile_000
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="connectdb.MySQLConnect" import="path.Dir"%>
<%response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="resource/css/default.css" media="screen"/>
        <link rel="stylesheet" type="text/css" href="resource/css/paging.css" media="screen"/>
        <script src="resource/js/jquery-1.11.1.min.js"></script>
        <script src="resource/js/paging.js"></script>
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
                            String role = (String) session.getAttribute("role");
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
                    <div id="smsin">
                        <div id="tablein">
                            <table width="98%">
                                <tr>
                                    <td class="tbcat" width="10%">STT</td>                           
                                    <td class="tbcat" width="15%">PhoneNumber</td>
                                    <td class="tbcat" width="15%"> CalledNumber</td>
                                    <td class="tbcat" width="45%">FullContent</td>
                                    <% if (role != null && role.equals("admin")) { %>
                                    <td class="tbcat"  width="7%">Edit</td>
                                    <td class="tbcat" width="8%">Reset Phone</td>
                                    <% }%>

                                </tr>
                                <%
                                    try {
                                        MySQLConnect connect = new MySQLConnect(Dir.localhost, Dir.user, Dir.pass, Dir.database);
                                        ResultSet res = connect.excuteQuery("Select id,PhoneNumber,CalledNumber,FullContent From all_sms_queue_in ");
                                        int i = 1;
                                        out.print("<form action='reset_in.jsp' method='post'>");
                                        while (res.next()) {
                                            out.print("<tr><td class='inf'>" + i + "</td>");
                                            out.print("<td class='inf'>" + res.getString("PhoneNumber") + "</td>");
                                            out.print("<td class='inf'>" + res.getString("CalledNumber") + "</td>");
                                            out.print("<td class='inf'>" + res.getString("FullContent") + "</td>");
                                            if (role.equals("admin")) {
                                                out.print("<td class='inf'><a href='edit_in.jsp?id=" + res.getString("id") + "'>Edit</a></td>");
                                                out.print("<td class='inf'><input type=checkbox name='reset' value='" + res.getString("id") + "'/></td></tr>");

                                            }
                                            i++;
                                        }
                                        out.print("<div class='menuin'>");
                                        out.print("SMS In ");
                                        if (role.equals("admin")) {
                                            out.print("<input  name='btreset' type='submit' value='Reset Message'/><input name='btdelete' type='submit' value='Delete Message'/>");
                                        }
                                        out.print("</div>");
                                        out.print("</form>");
                                        res.close();
                                    } catch (Exception e) {
                                    }
                                %>
                            </table>

                            <br clear="all" />
                        </div>
                        <ul id="pages">

                           

                            <li class="pageInfo"> </a></li>
                            <li class="goPrevious">&lsaquo;&lsaquo; Previous</li>
                            <li>
                                <input type="text" class="currentPage" id="currentPage" value=""/>
                            </li>
                            <li class="goNext">Next &rsaquo;&rsaquo;</li>

                        </ul>
                    </div>
                    <div id="smsout">

                        <div id="tablein">
                            <table width="98%">
                                <tr>
                                    <td class="tbcat" width="10%">STT</td>                           
                                    <td class="tbcat" width="15%">PhoneNumber</td>
                                    <td class="tbcat" width="15%"> CalledNumber</td>
                                    <td class="tbcat" width="45%">FullContent</td>
                                    <% if (role != null && role.equals("admin")) { %>
                                    <td class="tbcat"  width="7%">Edit</td>
                                    <td class="tbcat" width="8%">Reset Phone</td>
                                    <% }%>

                                </tr>
                                <%
                                    try {
                                        MySQLConnect connect = new MySQLConnect(Dir.localhost, Dir.user, Dir.pass, Dir.database);
                                        ResultSet res = connect.excuteQuery("Select id,PhoneNumber,CalledNumber,FullContent From all_sms_queue_out ");
                                        int i = 1;
                                        out.print("<form action='reset_out.jsp' method='post'>");
                                        while (res.next()) {
                                            out.print("<tr><td class='inf'>" + i + "</td>");
                                            out.print("<td class='inf'>" + res.getString("PhoneNumber") + "</td>");
                                            out.print("<td class='inf'>" + res.getString("CalledNumber") + "</td>");
                                            out.print("<td class='inf'>" + res.getString("FullContent") + "</td>");
                                            if (role.equals("admin")) {
                                                out.print("<td class='inf'><a href='edit_out.jsp?id=" + res.getString("id") + "'>Edit</a></td>");
                                                out.print("<td class='inf'><input type=checkbox name='reset' value='" + res.getString("id") + "'/></td></tr>");
                                            }
                                            i++;
                                        }
                                        out.print("<div class='menuin'>");
                                        out.print("SMS Out");
                                        if (role.equals("admin")) {
                                            out.print("<input  name='btreset' type='submit' value='Reset Message'/><input name='btdelete' type='submit' value='Delete Message'/>");
                                        }
                                        out.print("</div>");
                                        out.print("</form>");
                                        res.close();
                                    } catch (Exception e) {
                                    }

                                %>
                            </table>
                            <br clear="all" />
                        </div>

                        <div id="smsout">

                        </div>
                    </div>
                </div>
                <div id="footer">
                    &copy; 2007 MySite.com | Design by <a href="http://www.ininedesign.com">Utah Web Design</a>
                </div>
            </div>
    </body>
</html>
