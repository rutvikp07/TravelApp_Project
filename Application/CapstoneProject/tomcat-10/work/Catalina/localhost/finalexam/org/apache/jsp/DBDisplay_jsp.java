/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.0.27
 * Generated at: 2024-08-22 01:23:10 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;
import java.sql.*;
import java.io.*;
import java.util.ArrayList;
import java.util.*;

public final class DBDisplay_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final jakarta.servlet.jsp.JspFactory _jspxFactory =
          jakarta.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("java.util");
    _jspx_imports_packages.add("jakarta.servlet");
    _jspx_imports_packages.add("java.io");
    _jspx_imports_packages.add("jakarta.servlet.http");
    _jspx_imports_packages.add("jakarta.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.util.ArrayList");
  }

  private volatile jakarta.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public jakarta.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final jakarta.servlet.http.HttpServletRequest request, final jakarta.servlet.http.HttpServletResponse response)
      throws java.io.IOException, jakarta.servlet.ServletException {

    if (!jakarta.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final jakarta.servlet.jsp.PageContext pageContext;
    jakarta.servlet.http.HttpSession session = null;
    final jakarta.servlet.ServletContext application;
    final jakarta.servlet.ServletConfig config;
    jakarta.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    jakarta.servlet.jsp.JspWriter _jspx_out = null;
    jakarta.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("< \r\n");
      out.write(" \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<body>\r\n");
 String uname = System.getProperty("user.name"); 
      out.write("\r\n");
      out.write("\r\n");
      out.write("<TABLE style=\"background-color: #E3E4FA;\" WIDTH=\"50%\" border=\"1\">\r\n");
      out.write("<tr><th><font size=7>F18 FinalExam - ScreenShot this page</font></th></tr>\r\n");
      out.write("<tr><th><font size=7>");
      out.print(uname);
      out.write("</font></th></tr>\r\n");
      out.write("<table>\r\n");
      out.write("<TABLE style=\"background-color: #E3E4FA;\" WIDTH=\"50%\" border=\"1\">\r\n");
      out.write(" <tr>\r\n");
      out.write("    <th><font size=6>Firstname</font></th>\r\n");
      out.write("    <th><font size=6>Lastname</font></th> \r\n");
      out.write("    <th><font size=6>Student ID</font></th>\r\n");
      out.write("    <th><font size=6>Student ID Confirmed</font></th>\r\n");
      out.write("  </tr>\r\n");
      out.write("\r\n");



// display the records
	PreparedStatement pstatement = null;
	Connection conn = null;
  try{
    Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/finalexam?user=root&password=");
	//Statement stmt = conn.createStatement();
	

	String queryString = "select * from  finalexam.mars_register LIMIT 25";
	pstatement = conn.prepareStatement(queryString);
	ResultSet rs = pstatement.executeQuery();

		while (rs.next()) 
		{
		
      out.write("\r\n");
      out.write("				<tr> \r\n");
      out.write("						<td style=\"color:DodgerBlue;\"><font size=5>\"");
      out.print(rs.getString("firstname"));
      out.write("\"</font></td>\r\n");
      out.write("						<td style=\"color:DodgerBlue;\"><font size=5>\"");
      out.print(rs.getString("lastname"));
      out.write("\"</font></td>\r\n");
      out.write("						<td style=\"color:DodgerBlue;\"><font size=5>\"");
      out.print(rs.getString("studentid1"));
      out.write("\"</font></td>\r\n");
      out.write("						<td style=\"color:DodgerBlue;\"><font size=5>\"");
      out.print(rs.getString("studentid2"));
      out.write("\"</font></td>\r\n");
      out.write("				</tr>\r\n");
      out.write("\r\n");
      out.write("		");
 } 
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("	<br>\r\n");
      out.write("	\r\n");
      out.write("	</table>\r\n");
      out.write(" ");
  
	}
  catch(Exception e){ 
      out.write("\r\n");
      out.write("	 <h1>Insert failed!</h1> \r\n");
      out.write("	");

		String err = e.getMessage();
	
      out.write("\r\n");
      out.write("	<h1>");
      out.print(err);
      out.write("</h1> \r\n");

  }
  finally {
	// close all the connections.
	pstatement.close();
	conn.close();
	}



      out.write("\r\n");
      out.write(" <br/>\r\n");
      out.write("		\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof jakarta.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
