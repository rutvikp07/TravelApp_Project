<<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.ArrayList" %>
<%@page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<html>
<body>

<%

// Grab the variables from the form.
  String firstname = request.getParameter("firstname");
  String lastname = request.getParameter("lastname");
  String studentid1 = request.getParameter("studentid1");
  String studentid2 = request.getParameter("studentid2");
  

  
// save them to the database
	PreparedStatement pstatement = null;
	Connection conn = null;
  try{
    Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/finalexam?user=root&password=");
	//Statement stmt = conn.createStatement();
	
    int updateQuery = 0;

	String queryString = "insert into finalexam.mars_register(firstname,lastname,studentid1,studentid2) values(?,?,?,?)";
	pstatement = conn.prepareStatement(queryString);
	pstatement.setString(1, firstname);
	pstatement.setString(2, lastname);
	pstatement.setString(3, studentid1);
	pstatement.setString(4, studentid2);
	updateQuery = pstatement.executeUpdate();
	if (updateQuery != 0) {%>
	<br>
	<TABLE style="background-color: #E3E4FA;" WIDTH="30%" border="1">
	<tr><th>Data is inserted successfully into database.</th></tr>
	</table>
 <%  
	}
  
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
