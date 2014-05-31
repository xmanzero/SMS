package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class newjsp_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<html>\n");
      out.write("<head>\n");
      out.write("  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("function createXMLHttpRequest(){\n");
      out.write("  // See http://en.wikipedia.org/wiki/XMLHttpRequest\n");
      out.write("  // Provide the XMLHttpRequest class for IE 5.x-6.x:\n");
      out.write("  if( typeof XMLHttpRequest == \"undefined\" ) XMLHttpRequest = function() {\n");
      out.write("    try { return new ActiveXObject(\"Msxml2.XMLHTTP.6.0\") } catch(e) {}\n");
      out.write("    try { return new ActiveXObject(\"Msxml2.XMLHTTP.3.0\") } catch(e) {}\n");
      out.write("    try { return new ActiveXObject(\"Msxml2.XMLHTTP\") } catch(e) {}\n");
      out.write("    try { return new ActiveXObject(\"Microsoft.XMLHTTP\") } catch(e) {}\n");
      out.write("    throw new Error( \"This browser does not support XMLHttpRequest.\" )\n");
      out.write("  };\n");
      out.write("  return new XMLHttpRequest();\n");
      out.write("}\n");
      out.write("\n");
      out.write("var AJAX = createXMLHttpRequest();\n");
      out.write("\n");
      out.write("function handler() {\n");
      out.write("  if(AJAX.readyState == 4 && AJAX.status == 200) {\n");
      out.write("      var json = eval('(' + AJAX.responseText +')');\n");
      out.write("      alert('Success. Result: name => ' + json.name + ',' + 'balance => ' + json.balance);\n");
      out.write("  }else if (AJAX.readyState == 4 && AJAX.status != 200) {\n");
      out.write("    alert('Something went wrong...');\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("\n");
      out.write("function show(){\n");
      out.write("  AJAX.onreadystatechange = handler;\n");
      out.write("  AJAX.open(\"GET\", \"service.jsp\");\n");
      out.write("  AJAX.send(\"\");\n");
      out.write("};\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("  <a href=\"#\" onclick=\"javascript:show();\"> Click here to get JSON data from the server side</a>\n");
      out.write("</html>");
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
