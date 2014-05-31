package org.apache.jsp.resource.file;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import path.Dir;
import org.json.JSONObject;
import connectdb.MySQLConnect;

public final class getdata_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("\n");

    MySQLConnect connect = new MySQLConnect(Dir.localhost, Dir.user, Dir.pass, Dir.database);
    ResultSet result;
    int pagni = 0;
    String type = request.getParameter("type");
    type="count";
    if (type == "count") {

        String ite = request.getParameter("item");
        ite="5";
        result = connect.excuteQuery("Select count(id) as co from all_sms_queue_in");
        String count = "";
        while (result.next()) {
            count = result.getString("co");
        }
        int total = Integer.parseInt(count);
        int item = Integer.parseInt(ite);
        if ((total % item) == 0) {
            pagni = total / item;
        } else {
            pagni = total / item + 1;
        }
        JSONObject obj = new JSONObject();
        //obj.put("to", "foo");
        obj.put("total", new Integer(pagni));
        //out.print(count);
        out.print(obj);
    }

      out.write('\n');
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
