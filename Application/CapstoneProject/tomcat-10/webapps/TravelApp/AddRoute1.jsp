<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.ewheelz.MyFunctions"%>
<%@ page import="java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" %>

<HEAD>


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class=SC>
<HR>
<B><FONT COLOR="#CC00CC" face='verdana'>Add Route</FONT></B>
<HR>
<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	String RouteId = request.getParameter("RouteId");	  
	System.out.println("Route id is " + RouteId);
	MyFunctions MF = new MyFunctions();
	RouteId = MF.genNextID("routemaster","RouteId","R");
	String[] part = RouteId.split("(?<=\\D)(?=\\d)");  
	System.out.println(part[0]);  
	System.out.println(part[1]);
	String rFrom = request.getParameter("rFrom");	
	String rTo = request.getParameter("rTo");
	String TravelsId = request.getParameter("TravelsId");
	String BusId = request.getParameter("BusId");
	String Departure = request.getParameter("Departure");
	String Arrival = request.getParameter("Arrival");	
	String Fare = request.getParameter("Fare");
	String JDate = request.getParameter("JDate");	
	String dateStr = JDate;
	System.out.println("Date is " + dateStr);  
	SimpleDateFormat formater = new SimpleDateFormat("MM/dd/yyyy");
	Date result1 = formater.parse(dateStr);
	SimpleDateFormat AppDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	System.out.println(AppDateFormat.format(result1));
	String fromattedate = AppDateFormat.format(result1);
	
	int Availability = 40;	
	try{
			
			con = com.ewheelz.ConnectionPool.getConnection();
			stmt =  con.createStatement();
	
			
			String Query = "Insert into routemaster values('"+RouteId+"','"+rFrom+"','"+rTo+"','"+TravelsId+"','"+BusId+"','"+Departure+"','"+Arrival+"','"+Fare+"','"+fromattedate+"',"+Availability+")";
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
				%><P align=center><B><Font face="Georgia" color="Green">Route added Successfully</Font></B></P><%
			}
			else{
				%><P align=center><B><Font face="Georgia" color="Red">Error: Please try again</Font></B></P><% 
			}
			stmt.close();
			con.close();
		}catch(Exception e){
			stmt.close();
			con.close();
			%><%=e%><%
		}
	
%>
</BODY>


