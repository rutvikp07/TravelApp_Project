<HTML>

<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>

<%@ page session="true" %>
<head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
<SCRIPT LANGUAGE="JavaScript">

	function setAction(URL,Obj){
		var f = document.forms[0];
		var ParamsList = "?";
		Obj.target='ResultFrame';
		Obj.href=URL+ParamsList;
	}

</SCRIPT>
<head>
<body Class='SC'>
<!--	<H4 align=center>Menu</H4> -->
	<TABLE align="center">
	<TR>
		<TD><A HREF="AddRoute2.jsp" target="AdminBodyFrame"><img border="0" name="AddRoute" src="Images/Menu/AddRoute0.jpg" width="100" height="20" onMouseOver="document['AddRoute'].src='Images/Menu/AddRoute1.jpg'" onMouseOut="document['AddRoute'].src='Images/Menu/AddRoute0.jpg'" ></A></TD>
		
		<TD><A HREF="ViewRoutes.jsp" target="AdminBodyFrame"><img border="0" name="ViewRoutes" src="Images/Menu/ViewRoutes1.jpg" width="100" height="20" onMouseOver="document['ViewRoutes'].src='Images/Menu/ViewRoutes0.jpg'" onMouseOut="document['ViewRoutes'].src='Images/Menu/ViewRoutes1.jpg'" ></A></TD>
		
		<TD><A HREF="DelRoute0.jsp" target="AdminBodyFrame"><img border="0" name="DelRoute" src="Images/Menu/DelRoute0.jpg" width="100" height="20" onMouseOver="document['DelRoute'].src='Images/Menu/DelRoute1.jpg'" onMouseOut="document['DelRoute'].src='Images/Menu/DelRoute0.jpg'" ></A></TD>
		
		<TD><A HREF="AddTravel0.jsp" target="AdminBodyFrame"><img border="0" name="AddTravel" src="Images/Menu/AddTravel0.jpg" width="100" height="20" onMouseOver="document['AddTravel'].src='Images/Menu/AddTravel1.jpg'" onMouseOut="document['AddTravel'].src='Images/Menu/AddTravel0.jpg'" ></A></TD>
		
		<TD><A HREF="ViewTravels.jsp" target="AdminBodyFrame"><img border="0" name="ViewTravels" src="Images/Menu/ViewTravels0.jpg" width="100" height="20" onMouseOver="document['ViewTravels'].src='Images/Menu/ViewTravels1.jpg'" onMouseOut="document['ViewTravels'].src='Images/Menu/ViewTravels0.jpg'" ></A></TD>
		
		<TD><A HREF="DelTravel0.jsp" target="AdminBodyFrame"><img border="0" name="DelTravel" src="Images/Menu/DelTravel0.jpg" width="100" height="20" onMouseOver="document['DelTravel'].src='Images/Menu/DelTravel1.jpg'" onMouseOut="document['DelTravel'].src='Images/Menu/DelTravel0.jpg'" ></A></TD></TR></TABLE><br>
		<table align="center"><tr>
		<TD><A HREF="Logout.jsp" target="_parent">
			<img border="0" name="logout" src="Images/Menu/Logout001.jpg" width="105" height="21" onMouseOver="document['logout'].src='Images/Menu/Logout002.jpg'" onMouseOut="document['logout'].src='Images/Menu/Logout001.jpg'" ></a></TD>
	</TR>
	</TABLE>
</BODY>
</HTML>
