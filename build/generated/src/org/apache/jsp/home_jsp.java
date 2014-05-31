package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import connectdb.MySQLConnect;
import path.Dir;

public final class home_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
response.setContentType("text/html; charset=UTF-8");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"resource/css/default.css\" media=\"screen\"/>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"resource/css/paging.css\" media=\"screen\"/>\n");
      out.write("        <title>Trang chủ</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div id=\"wrapper\">\n");
      out.write("\n");
      out.write("            <div id=\"top_nav\">\n");
      out.write("                <ul>\n");
      out.write("                    <li><a href=\"home.jsp\">Trang chủ</a></li>\n");
      out.write("\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div id=\"header\">\n");
      out.write("                <div id=\"logo\">\n");
      out.write("                    SMS<span class=\"color\"> 1.0</span>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div id=\"content\">\n");
      out.write("\n");
      out.write("                <div id=\"l_col\">\n");
      out.write("                    <h3>Side Menu</h3>\n");
      out.write("                    <ul>\n");
      out.write("                        <li><a href=\"home.jsp\">Trang chủ</a></li>\n");
      out.write("\n");
      out.write("\n");
      out.write("                    </ul>\n");
      out.write("                    <br />\n");
      out.write("                    <span class=\"search\">\n");
      out.write("                        ");

                            String user = (String) session.getAttribute("user");
                            String role = (String) session.getAttribute("role");
                            if (user != null) {
                                out.print("<label>Xin chao: ");
                                out.print(session.getAttribute("user"));
                                out.print("</label>");

                        
      out.write("\n");
      out.write("                        <form action=\"logout.jsp\" method=\"post\"><button type=\"submit\" name=\"log\">Thoát</button></form>\n");
      out.write("                        ");
 } else {
                                response.sendRedirect("index.jsp");
                            }
                        
      out.write("\n");
      out.write("                    </span>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div id=\"r_col\">\n");
      out.write("                    <div id=\"smsin\">\n");
      out.write("                        <div id=\"tablein\">\n");
      out.write("                            <table width=\"98%\">\n");
      out.write("                                <tr>\n");
      out.write("                                    <td class=\"tbcat\" width=\"10%\">STT</td>                           \n");
      out.write("                                    <td class=\"tbcat\" width=\"15%\">PhoneNumber</td>\n");
      out.write("                                    <td class=\"tbcat\" width=\"15%\"> CalledNumber</td>\n");
      out.write("                                    <td class=\"tbcat\" width=\"45%\">FullContent</td>\n");
      out.write("                                    ");
 if (role != null && role.equals("admin")) { 
      out.write("\n");
      out.write("                                    <td class=\"tbcat\"  width=\"7%\">Edit</td>\n");
      out.write("                                    <td class=\"tbcat\" width=\"8%\">Reset Phone</td>\n");
      out.write("                                    ");
 }
      out.write("\n");
      out.write("\n");
      out.write("                                </tr>\n");
      out.write("                                ");

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

                                
      out.write("\n");
      out.write("                            </table>\n");
      out.write("                            <ul id=\"pages\">\n");
      out.write("                                <li class=\"pageInfo\">Page 1 of 6</li>\n");
      out.write("                                <li class=\"goPrevious\">&lsaquo;&lsaquo; Previous</li>\n");
      out.write("                                <li>\n");
      out.write("                                    <input type=\"text\" class=\"currentPage\" id=\"currentPage\" value=\"\"/>\n");
      out.write("                                </li>\n");
      out.write("                                <li class=\"goNext\">Next &rsaquo;&rsaquo;</li>\n");
      out.write("\n");
      out.write("                            </ul>\n");
      out.write("                            <br clear=\"all\" />\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div id=\"smsout\">\n");
      out.write("\n");
      out.write("                        <div id=\"tablein\">\n");
      out.write("                            <table width=\"98%\">\n");
      out.write("                                <tr>\n");
      out.write("                                    <td class=\"tbcat\" width=\"10%\">STT</td>                           \n");
      out.write("                                    <td class=\"tbcat\" width=\"15%\">PhoneNumber</td>\n");
      out.write("                                    <td class=\"tbcat\" width=\"15%\"> CalledNumber</td>\n");
      out.write("                                    <td class=\"tbcat\" width=\"45%\">FullContent</td>\n");
      out.write("                                    ");
 if (role != null && role.equals("admin")) { 
      out.write("\n");
      out.write("                                    <td class=\"tbcat\"  width=\"7%\">Edit</td>\n");
      out.write("                                    <td class=\"tbcat\" width=\"8%\">Reset Phone</td>\n");
      out.write("                                    ");
 }
      out.write("\n");
      out.write("\n");
      out.write("                                </tr>\n");
      out.write("                                ");
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

                                
      out.write("\n");
      out.write("                            </table>\n");
      out.write("                            <br clear=\"all\" />\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div id=\"smsout\">\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div id=\"footer\">\n");
      out.write("                    &copy; 2007 MySite.com | Design by <a href=\"http://www.ininedesign.com\">Utah Web Design</a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
