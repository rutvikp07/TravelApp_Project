//view roots to the user.


<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<% String RouteId="";%>

<HEAD>


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">
<SCRIPT LANGUAGE="JavaScript">
	<!--
		function fnShowDetails(RouteId,U)
			{
				var URL = U+"?RouteId="+RouteId;
				fnEmpPopUp(URL,300,400);
			}
	//-->
	</SCRIPT>
</HEAD>
<BODY class=SC>
<HR>
<B><FONT COLOR="#CC00CC" face='verdana'>View Routes</FONT></B>
<HR>    
<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	try{
			
			con = com.ewheelz.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "Select * from routemaster";
			rs = stmt.executeQuery(Query);
			%>
						<table align="center" width="100%">
							<tr class=row_title>
							
							<th align="center">From</th>
							<th align="center">To</th>
							
							<th align="center">BusId</th>
							<th align="center">Departure</th>
							<th align="center">Arrival</th>
							<th align="center">Fare</th>
							<th align="center">Date</th>
							<th align="center">Availability</th>
							<th align="center" colspan=2>PickUp Points</th>

							</tr>
					<%
			int rCount=0;
			while(rs.next())
			{   RouteId =rs.getString(1);
					%>
					<tr class= <%=(rCount%2!=0)? "row_even" : "row_odd"%>>
						
						<td align=center><%=rs.getString(2)%></td>
						<td align=center><%=rs.getString(3)%></td>
						
						<td align=center><%=rs.getString(5)%></td>
						<td align=center><%=rs.getString(6)%></td>
						<td align=center><%=rs.getString(7)%></td>
						<td align=center><%=rs.getString(8)%></td>
						<td align=center><%=rs.getString(9)%></td>
						<td align=center><%=rs.getString(10)%></td>
						 <td align=center><A style="cursor:hand" onclick="fnShowDetails('<%=RouteId%>','ViewPickupPoints.jsp')">View</A></td>
						
						
					</tr>
					<%
				rCount++;
			}
			if( rCount == 0)	{%><h3 align=center>Sorry No records Found</h3><% }
			rs.close();
			stmt.close();
			con.close();
		}catch(Exception e){
			rs.close();
			stmt.close();
			con.close();
			%><%=e%><%
		}
	
%>
</BODY>



