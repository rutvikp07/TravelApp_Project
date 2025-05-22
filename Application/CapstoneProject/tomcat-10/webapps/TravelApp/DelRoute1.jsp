
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>

	<LINK href="styles.css" type="text/css" rel="stylesheet">


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>


</HEAD>
<BODY class=SC>
<HR>
<B><FONT COLOR="#CC00CC" face='verdana'>Delete Route</FONT></B>
<HR>
<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	System.out.println("The DelRoute1 method has been called ");
	String Value = request.getParameter("RouteId");
	System.out.println("The route id is " + Value);
	try{
		    System.out.println("Calling the connection method")	;
		    con = com.ewheelz.ConnectionPool.getConnection();
		    //con=(Connection)session.getAttribute("connection");
		    System.out.println("The connection was successful!");
			stmt =  con.createStatement();
			System.out.println("The calling of createstatement was successful ");
			String Query = "Delete from routemaster where RouteId='"+Value+"'";
			System.out.println("Query to be exuecuted is " + Query);
			int result = stmt.executeUpdate(Query);
			System.out.println("Result is " + result);
			if( result > 0)	{
				%><P align=center><B>Route deleted successfully</B></P>
				<%
			}
			else{
				%><P align=center><B>Error in deletion..please try again</B></P>
				<center>
				<A href="DelRoute0.jsp"> Delete Route </A>
				</center>
				<% 
			}
		}catch(Exception e){%><%=e%><%}
%>
</BODY>


