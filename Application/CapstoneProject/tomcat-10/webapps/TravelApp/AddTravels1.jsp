<%@ page language="java"%>
<%@ page session="true"%>
<%@ page import="java.sql.*,java.io.*,com.ewheelz.MyFunctions"%>

<HEAD>


<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>


<LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class=SC>
	<HR>
	<B><FONT COLOR="#CC00CC" face='verdana'>Add New Travel</FONT></B>
	<HR>

	<%
	Connection con = null;
	ResultSet rs = null;
	Statement stmt = null;
	String TravelsId = request.getParameter("TravelsId");
	MyFunctions MF = new MyFunctions();
	//TravelsId = MF.genNextID("travelsmaster","TravelsId","T");
	String Travels = request.getParameter("Travels");
	String Location = request.getParameter("Location");
	String Address = request.getParameter("Address");
	String AgentName = request.getParameter("AgentName");
	String PhoneNumber = request.getParameter("PhoneNumber");
	try {

		con = com.ewheelz.ConnectionPool.getConnection();
		stmt = con.createStatement();
		String qry = "select max(`TravelsId`) from `travelsmaster`";

		ResultSet res_set = stmt.executeQuery(qry);

		//String n ="sai";

		// n.subs

		res_set.next();

		String TicketId = res_set.getString(1);

		String no = TicketId.substring(1).trim();

		TravelsId = "T" + (Integer.parseInt(no) + 1);

		String Query = "Insert into travelsmaster values('" + TravelsId + "','" + Travels + "','" + Location + "','"
		+ Address + "','" + AgentName + "','" + PhoneNumber + "')";
		int result = stmt.executeUpdate(Query);
		if (result > 0) {
	%><P align=center>
		<B><Font face="Georgia" color="Green">Travels added
				Successfully</Font></B>
	</P>
	<%
	} else {
	%><P align=center>
		<B><Font face="Georgia" color="Red">Error: Please try again</Font></B>
	</P>
	<%
	}
	stmt.close();
	con.close();
	} catch (Exception e) {
	stmt.close();
	con.close();
	%><%=e%>
	<%
		}
	
%>
</BODY>


