/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.0.27
 * Generated at: 2024-06-28 22:19:13 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.*;
import java.lang.*;

public final class BookNow_005fS2_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.util.Date");
    _jspx_imports_classes.add("java.text.SimpleDateFormat");
    _jspx_imports_classes.add("java.text.ParseException");
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
      out.write("\r\n");
      out.write("\r\n");

	String rFrom = (String)session.getAttribute("rFrom");
	String rTo = (String)session.getAttribute("rTo");
	String JDate = (String)session.getAttribute("JDate");
	SimpleDateFormat formater = new SimpleDateFormat("MM/dd/yyyy");
	Date result1 = formater.parse(JDate);
	SimpleDateFormat AppDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	System.out.println(AppDateFormat.format(result1));
	String fromattedate = AppDateFormat.format(result1);
	String sBusType = (String)session.getAttribute("BusType");
	String NoPass = (String)session.getAttribute("NoPass");
	String RouteId = (String)session.getAttribute("RouteId");
	String TravelsId = (String)session.getAttribute("TravelsId");
	String BusId = (String)session.getAttribute("BusId");
	String Fare =	(String)session.getAttribute("Fare");
	String Departure =	(String)session.getAttribute("Departure");
	String Arrival =	(String)session.getAttribute("Arrival");
	String SelSeats = request.getParameter("SS");
	session.setAttribute("SelSeats",SelSeats);		
	String BPoint = request.getParameter("BPoint");	
	session.setAttribute("BPoint",BPoint);
	//Save ticket details and create ticket id

/*
`TicketId`, `RouteId`, `CustomerId~`, `From`, `To`, 
	`JourneyDate`, 
	`StartTime`, 
	`ReachTime`, 
	`Seats`, 
	`BoardingPoint`, 
	`NetAmount`, 
	`Status`, 
	`PaymentId~`, 
	`BusId`
*/


      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("<LINK href=\"styles.css\" type=\"text/css\" rel=\"stylesheet\">\r\n");
      out.write("<script LANGUAGE=\"Javascript\" SRC=\"Images/AjaxCall.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<SCRIPT LANGUAGE=\"JavaScript\">\r\n");
      out.write("var SCount = 0;\r\n");
      out.write("\r\n");
      out.write("	function setAction(URL,Obj){\r\n");
      out.write("		var f = document.forms[0];\r\n");
      out.write("		var ParamsList = \"?\";\r\n");
      out.write("		Obj.target='ResultFrame';\r\n");
      out.write("		Obj.href=URL+ParamsList;\r\n");
      out.write("	}\r\n");
      out.write("		function ChkMandatoryField(F,T){\r\n");
      out.write("			var val= F.value;\r\n");
      out.write("			if(val==\"\"){alert(T+\" is mandatory\");return false;}\r\n");
      out.write("		}\r\n");
      out.write("		function ChkNumField(F,T){\r\n");
      out.write("			var val = F.value;\r\n");
      out.write("			var pattern = /^([0-9]{10})$/;\r\n");
      out.write("			if(!(pattern.test(val)==true)){alert(\"Please enter valid \"+T);return false;}\r\n");
      out.write("		}\r\n");
      out.write("		function ChkAlphaNumericField(F,T){\r\n");
      out.write("			var val = F.value;\r\n");
      out.write("			var pattern = /^([a-zA-Z0-9]{1,250})$/;\r\n");
      out.write("			if(!(pattern.test(val)==true)){alert(\"Please enter alphabets or numbers for \"+T);return false;}\r\n");
      out.write("		}\r\n");
      out.write("		function ChkAlphaField(F,T){\r\n");
      out.write("			var val = F.value;\r\n");
      out.write("			var pattern = /^([a-zA-Z ]{1,250})$/;\r\n");
      out.write("			if(!(pattern.test(val)==true)){alert(\"Please enter text for \"+T);return false;}\r\n");
      out.write("		}\r\n");
      out.write("		function ChkEmailField(F,T){\r\n");
      out.write("			var val = F.value;\r\n");
      out.write("			var pattern = /^[a-zA-Z0-9\\-\\.\\_ ]+\\@[a-zA-Z0-9 \\-\\.]+\\.([a-zA-Z]{2,4})$/;\r\n");
      out.write("			if(!(pattern.test(val)==true)){alert(\"Please enter valid email for \"+T);return false;}\r\n");
      out.write("		}\r\n");
      out.write("		function ChkDateField(F,T)\r\n");
      out.write("		{\r\n");
      out.write("			var val = F.value;\r\n");
      out.write("		    var pattern = /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/;\r\n");
      out.write("		    if(!(pattern.test(val)==true)){alert(\"Please enter valid date format (yyyy-mm-dd) for \"+T);return false;}\r\n");
      out.write("		}\r\n");
      out.write("\r\n");
      out.write("		function validate()\r\n");
      out.write("		{   alert(\"The provided information will be saved\");\r\n");
      out.write("			var frm = document.forms[0];\r\n");
      out.write("			//document.write(\"Validate function is called\");\r\n");
      out.write("			if(ChkMandatoryField(frm.CustomerName,'Customer Name')==false) return false;\r\n");
      out.write("			if(ChkAlphaField(frm.CustomerName,'Customer Name')==false) return false;\r\n");
      out.write("			if(ChkMandatoryField(frm.PhoneNumber,'Phone Number')==false) return false;\r\n");
      out.write("			if(ChkNumField(frm.PhoneNumber,'Phone Number')==false) return false;\r\n");
      out.write("			if(ChkMandatoryField(frm.Address,'Address')==false) return false;\r\n");
      out.write("			if(ChkMandatoryField(frm.Location,'Location')==false) return false;\r\n");
      out.write("			if(ChkAlphaField(frm.Location,'Location')==false) return false;\r\n");
      out.write("			if(ChkMandatoryField(frm.email,'email')==false) return false;\r\n");
      out.write("			if(ChkEmailField(frm.email,'email')==false) return false;\r\n");
      out.write("			if(ChkMandatoryField(frm.Gender,'Gender')==false) return false;\r\n");
      out.write("			if(ChkAlphaField(frm.Gender,'Gender')==false) return false;\r\n");
      out.write("			Params=\"?CustomerName=\"+frm.CustomerName.value+\"&PhoneNumber=\"+frm.PhoneNumber.value+\"&Address=\"+frm.Address.value+\"&Location=\"+frm.Location.value+\"&email=\"+frm.email.value+\"&Gender=\"+frm.Gender.value;\r\n");
      out.write("\r\n");
      out.write("			fnSaveCustomer(Params);\r\n");
      out.write("		}\r\n");
      out.write("		function fnSaveCustomer(Params)\r\n");
      out.write("		{\r\n");
      out.write("			var divObj = document.getElementById(\"infodiv\");\r\n");
      out.write("			URL = \"SaveCustomerInfo.jsp\"+Params;\r\n");
      out.write("		    alert(\"Save customer information \" + URL);\r\n");
      out.write("			//alert(URL);\r\n");
      out.write("			ajaxFunction(URL,divObj);\r\n");
      out.write("		}\r\n");
      out.write("</SCRIPT>\r\n");
      out.write("\r\n");
      out.write(" -->\r\n");
      out.write("<head>\r\n");
      out.write("<body Class='SC'>\r\n");
      out.write("<HR>\r\n");
      out.write("<B><FONT COLOR=\"#CC00CC\" face='verdana'>Customer Info</FONT></B>\r\n");
      out.write("<HR>\r\n");
      out.write("<BR><BR>\r\n");
      out.write("<FORM>\r\n");

/*Declaration of variables*/
Connection con=null;
Statement stmt=null,stmt1=null,stmt2=null;
ResultSet rs=null,rs1=null,rs2=null;
int count=0,NumRows=0;
String TicketId="";
com.ewheelz.MyFunctions MF = new com.ewheelz.MyFunctions();
//TicketId = MF.genNextID("ticketdetails","TicketId","T-");

boolean tflag=false;
try
{
	/*Connection to MySQL database is made with JDBC class one driver*/
	con = com.ewheelz.ConnectionPool.getConnection();
	stmt =  con.createStatement();
	StringBuilder querybuilder = new StringBuilder();
	String qry = querybuilder
	    .append("SELECT MAX(CAST(SUBSTRING(TicketId, 3, LENGTH(TicketId) - 2) AS SIGNED)) FROM TicketDetails")
	    .toString();
	System.out.println("The query for ticket details is " + qry);
	ResultSet res_set = stmt.executeQuery(qry);

        
        //String n ="sai";
        
       // n.subs
        //out.println("rs is: "+res_set);
        if(res_set.next())
		{
			TicketId = "T-" + res_set.getString(1);
			System.out.println("Ticket id is " + TicketId);
			if(TicketId == null)
				TicketId = "T-1";
		}
		else
			TicketId = "T-1";
//        out.println("TicketId is: "+TicketId);
        String no = TicketId.substring(2).trim();
        
        TicketId = "T-"+(Integer.parseInt(no)+1);
        
        session.setAttribute("TicketId",TicketId);
	String Query = "Insert into ticketdetails values('"+TicketId+"','"+RouteId+"','','"+rFrom+"','"+rTo+"','"+fromattedate+"','"+Departure+"','"+Arrival+"','"+SelSeats+"','"+BPoint+"',"+Fare+",'Progress','','"+BusId+"')";
    
//	out.println("Search Qry->"+Query);
	
	int result = stmt.executeUpdate(Query);
	if( result > 0)	{
		session.setAttribute("TicketId",TicketId);
		System.out.println("Ticket saved");
		tflag=true;
	}
	else{
		session.setAttribute("TicketId","");
		System.out.println("Ticket not saved");
		tflag=false;
	}
}
catch(Exception e)
{
	out.println("Exception"+e);
	tflag=false;
}
if(tflag==true){

      out.write("\r\n");
      out.write("	<TABLE width=\"60%\" align=center>\r\n");
      out.write("		<TR class=\"row_title\">\r\n");
      out.write("				<TH align=\"center\" colspan=2>Provide customer details</TH>\r\n");
      out.write("		</TR>	\r\n");
      out.write("		<TR class=\"row_odd\">\r\n");
      out.write("				<TH align=\"left\">Customer Name<FONT COLOR=\"red\">*</FONT></TH>\r\n");
      out.write("				<TD><Input type=text   name='CustomerName' value=''></TD>\r\n");
      out.write("		</TR>\r\n");
      out.write("		<TR class=\"row_even\">\r\n");
      out.write("				<TH align=\"left\">Phone Number<FONT COLOR=\"red\">*</FONT></TH>\r\n");
      out.write("				<TD><Input type=text   name='PhoneNumber' value=''></TD>\r\n");
      out.write("		</TR>\r\n");
      out.write("		<TR class=\"row_odd\">\r\n");
      out.write("				<TH align=\"left\">Address<FONT COLOR=\"red\">*</FONT></TH>\r\n");
      out.write("				<TD><textarea name=Address rows=2 cols=20></textarea></TD>\r\n");
      out.write("		</TR>\r\n");
      out.write("		<TR class=\"row_even\">\r\n");
      out.write("				<TH align=\"left\">Location<FONT COLOR=\"red\">*</FONT></TH>\r\n");
      out.write("				<TD><Input type=text   name='Location' value=''></TD>\r\n");
      out.write("		</TR>\r\n");
      out.write("		<TR class=\"row_odd\">\r\n");
      out.write("				<TH align=\"left\">Email<FONT COLOR=\"red\">*</FONT></TH>\r\n");
      out.write("				<TD><Input type=text   name='email' value=''></TD>\r\n");
      out.write("		</TR>\r\n");
      out.write("		<TR class=\"row_even\">\r\n");
      out.write("				<TH align=\"left\">Gender<FONT COLOR=\"red\">*</FONT></TH>\r\n");
      out.write("				<TD><SELECT NAME=\"Gender\">\r\n");
      out.write("					<OPTION VALUE=\"Male\" SELECTED>Male\r\n");
      out.write("					<OPTION VALUE=\"Female\">Female\r\n");
      out.write("				</SELECT></TD>\r\n");
      out.write("		</TR>\r\n");
      out.write("		<TR class=\"row_odd\">\r\n");
      out.write("				<TH align=\"right\" colspan=2><td><input type=button value=\"Save\" class=\"WinButton\" onclick=\"validate();\"></TD>\r\n");
      out.write("		</TR>\r\n");
      out.write("\r\n");
      out.write("	</TABLE>\r\n");
      out.write("	<P align=center><FONT  COLOR=\"black\" face='Georgia'>Fields with <FONT SIZE=\"\" COLOR=\"red\">*</FONT> are mandatory </FONT></P>\r\n");
      out.write("	<div id='infodiv'></div>\r\n");
      out.write("<P align=right>\r\n");
      out.write("\r\n");
      out.write("	<A onclick=\"if(document.getElementById('infodiv').innerHTML.indexOf('success')>-1){setAction('BookNow_S3.jsp',this)}else{alert('Customer info is mandatory');}\" target=\"ResultFrame\"><IMG SRC=\"Images/Menu/Continue1.jpg\" border=\"0\"\r\n");
      out.write("	onmouseout=\"this.src = 'Images/Menu/Continue1.jpg'\" \r\n");
      out.write("	onmouseover=\"this.src = 'Images/Menu/Continue2.jpg'\"></A> \r\n");
      out.write("</P>\r\n");
      out.write("</FORM>\r\n");

}else{
	
      out.write("\r\n");
      out.write("		<P align=center><FONT  COLOR=\"red\" face='Georgia'>An error occured. Please try again. Sorry for the inconvenience caused </FONT></P>\r\n");
      out.write("	");

}

      out.write("\r\n");
      out.write("</BODY>\r\n");
      out.write("</HTML>\r\n");
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
