<<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.ArrayList" %>
<%@page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<html>
<body>
<% String uname = System.getProperty("user.name"); %>

<TABLE style="background-color: #E3E4FA;" WIDTH="50%" border="1">
<tr><th><font size=7>F18 FinalExam - ScreenShot this page</font></th></tr>
<tr><th><font size=7><%=uname%></font></th></tr>
<table>
<TABLE style="background-color: #E3E4FA;" WIDTH="50%" border="1">
 <tr>
    <th><font size=6>Firstname</font></th>
    <th><font size=6>Lastname</font></th> 
    <th><font size=6>Student ID</font></th>
    <th><font size=6>Student ID Confirmed</font></th>
  </tr>

<%


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
		%>
				<tr> 
						<td style="color:DodgerBlue;"><font size=5>"<%=rs.getString("firstname")%>"</font></td>
						<td style="color:DodgerBlue;"><font size=5>"<%=rs.getString("lastname")%>"</font></td>
						<td style="color:DodgerBlue;"><font size=5>"<%=rs.getString("studentid1")%>"</font></td>
						<td style="color:DodgerBlue;"><font size=5>"<%=rs.getString("studentid2")%>"</font></td>
				</tr>

		<% } %>


	<br>
	
	</table>
 <%  
	}
  catch(Exception e){ %>
	 <h1>Insert failed!</h1> 
	<%
		String err = e.getMessage();
	%>
	<h1><%=err%></h1> 
<%
  }
  finally {
	// close all the connections.
	pstatement.close();
	conn.close();
	}


%>
 <br/>
		



</body>
</html>
