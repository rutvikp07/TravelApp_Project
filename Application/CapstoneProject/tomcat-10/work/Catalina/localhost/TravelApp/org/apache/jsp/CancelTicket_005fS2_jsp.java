/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.0.27
 * Generated at: 2024-07-14 19:35:50 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;
import java.sql.*;
import java.lang.*;

public final class CancelTicket_005fS2_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_packages.add("java.lang");
    _jspx_imports_packages.add("jakarta.servlet");
    _jspx_imports_packages.add("jakarta.servlet.http");
    _jspx_imports_packages.add("jakarta.servlet.jsp");
    _jspx_imports_classes = null;
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("<HTML>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
 String TicketId = request.getParameter("TicketId");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("	<LINK href=\"styles.css\" type=\"text/css\" rel=\"stylesheet\">\r\n");
      out.write("	<script LANGUAGE=\"Javascript\" SRC=\"Images/AjaxCall.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<SCRIPT LANGUAGE=\"JavaScript\">\r\n");
      out.write("	function setAction(URL,Obj){\r\n");
      out.write("		var f = document.forms[0];\r\n");
      out.write("		var TicketId = f.TicketId.value;\r\n");
      out.write("		var RouteId = f.RouteId.value;\r\n");
      out.write("		var BusId = f.BusId.value;\r\n");
      out.write("		var PaymentId = f.PaymentId.value;\r\n");
      out.write("		var CustomerId = f.CustomerId.value;\r\n");
      out.write("		var Seats = f.Seats.value;\r\n");
      out.write("		var NoPass = Seats.split(\",\").length;\r\n");
      out.write("		var ParamsList = \"?TicketId=\"+TicketId+\"&CustomerId=\"+CustomerId+\"&RouteId=\"+RouteId+\"&BusId=\"+BusId+\"&PaymentId=\"+PaymentId+\"&NoPass=\"+NoPass;\r\n");
      out.write("		Obj.target='ResultFrame';\r\n");
      out.write("		Obj.href=URL+ParamsList;\r\n");
      out.write("		//fnCancelTicket(URL+ParamsList);\r\n");
      out.write("	}\r\n");
      out.write("	/*function fnCancelTicket(URL)\r\n");
      out.write("	{\r\n");
      out.write("		var divObj = document.getElementById(\"infodiv\");\r\n");
      out.write("		alert(URL);\r\n");
      out.write("		ajaxFunction(URL,divObj);\r\n");
      out.write("	}*/\r\n");
      out.write("</SCRIPT>\r\n");
      out.write("<head>\r\n");
      out.write("<body Class='SC'>\r\n");
      out.write("<HR>\r\n");
      out.write("<B><FONT COLOR=\"#CC00CC\" face='verdana'>Cancel Ticket</FONT></B>\r\n");
      out.write("<HR>\r\n");
      out.write("<BR><BR>\r\n");
      out.write("<FORM ACTION=\"\">\r\n");
      out.write("<input type='Hidden' name='TicketId' value=\"");
      out.print(TicketId);
      out.write("\">\r\n");
      out.write("<TABLE class='notepad' align='center'>\r\n");
      out.write("\r\n");
      out.write("\r\n");


/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

try
{
	/*Connection to MySQL database is made with JDBC class one driver*/
	
	con = com.ewheelz.ConnectionPool.getConnection();
	stmt =  con.createStatement( ResultSet.TYPE_SCROLL_INSENSITIVE,
            ResultSet.CONCUR_UPDATABLE);
	String Query = "Select * from ticketdetails Where TicketId='"+TicketId+"' and Status='Booked'";
	System.out.println(" Qry->"+Query);
	rs = stmt.executeQuery(Query);
	int count=0,NumRows=0;
	while(rs.next()){NumRows++;}
	rs.beforeFirst();
	if(NumRows>0){
		//Display header
		
      out.write("\r\n");
      out.write("			<TR class=\"row_title\">\r\n");
      out.write("				<TD>Route Id</TD>\r\n");
      out.write("				<TD>CustomerId</TD>\r\n");
      out.write("				<TD>From</TD>\r\n");
      out.write("				<TD>To</TD>\r\n");
      out.write("				<TD>Journey Date</TD>\r\n");
      out.write("				<TD>Start Time</TD>\r\n");
      out.write("				<TD>Reach Time</TD>\r\n");
      out.write("				<TD>Seats</TD>\r\n");
      out.write("				<TD>Boarding Point</TD>\r\n");
      out.write("				<TD>Net Amount</TD>\r\n");
      out.write("\r\n");
      out.write("			</TR>	\r\n");
      out.write("		");

		while(rs.next())
			{
					//Display body
					String RouteId=rs.getString(2);
					String CustomerId=rs.getString(3);
					String rFrom=rs.getString(4);
					String rTo=rs.getString(5);
					String JourneyDate=rs.getString(6);
					String StartTime=rs.getString(7);
					String ReachTime=rs.getString(8);
					String Seats=rs.getString(9);
					String BoardingPoint=rs.getString(10);
					String NetAmount=rs.getString(11);
					String Status=rs.getString(12);
					String PaymentId=rs.getString(13);
					String BusId=rs.getString(14);

					
      out.write("\r\n");
      out.write("						<TR class=\"");
      out.print((count%2==0)? "row_odd" : "row_even" );
      out.write("\" >\r\n");
      out.write("							<TD>");
      out.print(RouteId);
      out.write("<INPUT TYPE=\"hidden\" NAME=\"RouteId\" value=\"");
      out.print(RouteId);
      out.write("\"></TD>\r\n");
      out.write("							<TD>");
      out.print(CustomerId);
      out.write("<INPUT TYPE=\"hidden\" NAME=\"CustomerId\" value=\"");
      out.print(CustomerId);
      out.write("\"></TD>\r\n");
      out.write("							<TD>");
      out.print(rFrom);
      out.write("<INPUT TYPE=\"hidden\" NAME=\"rFrom\" value=\"");
      out.print(rFrom);
      out.write("\"></TD>\r\n");
      out.write("							<TD>");
      out.print(rTo);
      out.write("<INPUT TYPE=\"hidden\" NAME=\"rTo\" value=\"");
      out.print(rTo);
      out.write("\"></TD>\r\n");
      out.write("							<TD>");
      out.print(JourneyDate);
      out.write("<INPUT TYPE=\"hidden\" NAME=\"JourneyDate\" value=\"");
      out.print(JourneyDate);
      out.write("\"></TD>\r\n");
      out.write("							<TD>");
      out.print(StartTime);
      out.write("<INPUT TYPE=\"hidden\" NAME=\"StartTime\" value=\"");
      out.print(StartTime);
      out.write("\"></TD>\r\n");
      out.write("							<TD>");
      out.print(ReachTime);
      out.write("<INPUT TYPE=\"hidden\" NAME=\"ReachTime\" value=\"");
      out.print(ReachTime);
      out.write("\"></TD>\r\n");
      out.write("							<TD>");
      out.print(Seats);
      out.write("<INPUT TYPE=\"hidden\" NAME=\"Seats\" value=\"");
      out.print(Seats);
      out.write("\"></TD>\r\n");
      out.write("							<TD>");
      out.print(BoardingPoint);
      out.write("<INPUT TYPE=\"hidden\" NAME=\"BoardingPoint\" value=\"");
      out.print(BoardingPoint);
      out.write("\"></TD>\r\n");
      out.write("							<TD>");
      out.print(NetAmount);
      out.write("<INPUT TYPE=\"hidden\" NAME=\"NetAmount\" value=\"");
      out.print(NetAmount);
      out.write("\"></TD>\r\n");
      out.write("							<INPUT TYPE=\"hidden\" NAME=\"PaymentId\" value=\"");
      out.print(PaymentId);
      out.write("\">\r\n");
      out.write("							<INPUT TYPE=\"hidden\" NAME=\"BusId\" value=\"");
      out.print(BusId);
      out.write("\">\r\n");
      out.write("						</TR>\r\n");
      out.write("</TABLE>\r\n");
      out.write("<div id='infodiv'></div>\r\n");
      out.write("<P align=right>\r\n");
      out.write("	<A onclick=\"setAction('CancelTicket_S3.jsp',this)\" target=\"ResultFrame\"><IMG SRC=\"Images/Menu/CancelTicket0.jpg\" border=\"0\"\r\n");
      out.write("	onmouseout=\"this.src = 'Images/Menu/CancelTicket0.jpg'\" \r\n");
      out.write("	onmouseover=\"this.src = 'Images/Menu/CancelTicket1.jpg'\"></A>\r\n");
      out.write("</P>\r\n");

				count++;
			}
	}else{
		
      out.write("<P align='CENTER'><IMG SRC=\"Images/error.gif\" WIDTH=\"17\" HEIGHT=\"13\" BORDER=\"0\" ALT=\"\"><FONT COLOR=\"red\" face='Georgia'>No tickets found.Please provide valid Ticket Id</FONT><BR>\r\n");
      out.write("			<A HREF=\"CancelTicket_S1.jsp\">&lt;&lt; Back</A>\r\n");
      out.write("		</P>\r\n");
      out.write("		\r\n");
      out.write("		");

	}
	System.out.println(count+" routes found");
}
catch(Exception e)
{
	System.out.println("Exception"+e);
}

      out.write("\r\n");
      out.write("</FORM>\r\n");
      out.write("</BODY>\r\n");
      out.write("</HTML>");
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
