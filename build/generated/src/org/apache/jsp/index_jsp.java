package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/WEB-INF/jspf/header.jspf");
    _jspx_dependants.add("/WEB-INF/jspf/footer.jspf");
  }

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

      out.write("\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n");
      out.write("    \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/affablebean.css\">\n");
      out.write("        <title>Project</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div id=\"main\">\n");
      out.write("            <div id=\"header\">\n");
      out.write("                <div id=\"widgetBar\">\n");
      out.write("\n");
      out.write("                    <input id=\"searchWidget\" type=\"text\" placeholder=\"Search\">\n");
      out.write("\n");
      out.write("                    <div class=\"headerWidget\">\n");
      out.write("                        [ language toggle ]\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"headerWidget\">\n");
      out.write("                        [ checkout button ]\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"headerWidget\">\n");
      out.write("                        [ shopping cart widget ]\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"headerWidget\">\n");
      out.write("                        [ account widget ]\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <a href=\"#\">\n");
      out.write("                    <img src=\"#\" id=\"logo\" alt=\"logo\">\n");
      out.write("                </a>\n");
      out.write("\n");
      out.write("                <img src=\"#\" id=\"logoText\" alt=\"title\">\n");
      out.write("            </div>");
      out.write("<sql:query var=\"categories\" dataSource=\"jdbc/affablebean\">\n");
      out.write("    SELECT * FROM category\n");
      out.write("</sql:query>\n");
      out.write("\n");
      out.write("            <div id=\"indexLeftColumn\">\n");
      out.write("                <div id=\"welcomeText\">\n");
      out.write("                    <p>[ welcome text ]</p>\n");
      out.write("\n");
      out.write("                    <!-- test to access context parameters -->\n");
      out.write("                    categoryImagePath: ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${initParam.categoryImagePath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\n");
      out.write("                    productImagePath: ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${initParam.productImagePath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div id=\"indexRightColumn\">\n");
      out.write("                <c:forEach var=\"category\" items=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${categories.rows}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">\n");
      out.write("                    <div class=\"categoryBox\">\n");
      out.write("                        <a href=\"category?");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${category.id}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">\n");
      out.write("\n");
      out.write("                            <span class=\"categoryLabelText\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${category.name}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</span>\n");
      out.write("\n");
      out.write("                            <img src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${initParam.categoryImagePath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${category.name}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write(".jpg\"\n");
      out.write("                                 alt=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${category.name}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">\n");
      out.write("                        </a>\n");
      out.write("                    </div>\n");
      out.write("                </c:forEach>\n");
      out.write("            </div>");
      out.write("<div id=\"footer\">\n");
      out.write("                <div class=\"footerWidget\">\n");
      out.write("                        [ help widget ]\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"footerWidget\">\n");
      out.write("                         [ contact widget ]\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"footerWidget\">\n");
      out.write("                         [ about widget ]\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("    </body>\n");
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
