<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>
	<script language="JavaScript" src="Images/validate.js"></script>
	<link href="styles.css" type="text/css" rel="stylesheet">
	<script language="JavaScript">
		function fnShowDetails(RouteId, U) {
			var URL = U + "?RouteId=" + RouteId;
			fnEmpPopUp(URL, 300, 400);
		}
	</script>
</HEAD>

<BODY class=SC scroll="yes">
	<HR>
	<B><FONT COLOR="#CC00CC" face='verdana'>View Routes</FONT></B>
	<HR>

	<%
	Integer IAuth = (Integer) session.getAttribute("auth");
	System.out.println("iauth is "+ IAuth);
	int auth = (IAuth != null) ? IAuth.intValue() : -1;
    System.out.println("Authorization is "+ auth);
		try {
			Connection con = com.ewheelz.ConnectionPool.getConnection();
			Statement stmt = con.createStatement();
			String query = "SELECT * FROM routemaster";
			ResultSet rs = stmt.executeQuery(query);
	%>

			<table align="center" width="60%">
				<tr class=row_title>
					<th align="center">RouteId</th>
					<th align="center">From</th>
					<th align="center">To</th>
					<th align="center">TravelsId</th>
					<th align="center">BusId</th>
					<th align="center">Departure</th>
					<th align="center">Arrival</th>
					<th align="center">Fare</th>
					<th align="center">Date</th>
					<th align="center">Availability</th>
					<th align="center" colspan=2>PickUp Points</th>
				</tr>
	<%
			int rCount = 0;
			while (rs.next()) {
				String routeId = rs.getString(1);
	%>
				<tr class="<%=(rCount % 2 != 0) ? "row_even" : "row_odd"%>">
					<td align=center><%= routeId %></td>
					<td align=center><%= rs.getString(2) %></td>
					<td align=center><%= rs.getString(3) %></td>
					<td align=center><%= rs.getString(4) %></td>
					<td align=center><%= rs.getString(5) %></td>
					<td align=center><%= rs.getString(6) %></td>
					<td align=center><%= rs.getString(7) %></td>
					<td align=center><%= rs.getString(8) %></td>
					<td align=center><%= rs.getString(9) %></td>
					<td align=center><%= rs.getString(10) %></td>
					<td align=center><A style="cursor:hand" onclick="fnShowDetails('<%= routeId %>','ViewPickupPoints.jsp')">View</A></td>
					<td align=center><A style="cursor:hand" onclick="fnShowDetails('<%= routeId %>','AddPickuppoint0.jsp')">Add</A></td>
				</tr>
	<%
				rCount++;
			}

			if (rCount == 0) {
	%>
				<tr>
					<td colspan="12" align="center"><h3>Sorry, No records Found</h3></td>
				</tr>
	<%
			}

			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	%>
	</table>
</BODY>
