<!-- ValidateAdmin.jsp -->

<HTML>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<%@ page session="true" %>
<head>
    <LINK href="styles.css" type="text/css" rel="stylesheet">
</head>
<body Class="SC" scroll="yes">
<%! String password; %>
<%! int flag = 0;  %>

<%
/* Declaration of variables */
Connection con = null;
PreparedStatement preparedStatement = null;
ResultSet rs = null;
String userid = request.getParameter("Name");
password = request.getParameter("Pwd");
System.out.println("userid = " + userid + "\t" + "password = " + password);

try {
    con = com.ewheelz.ConnectionPool.getConnection();
    System.out.println("Connection is: " + con);

    /* Retrieving data from the database */
    String query = "SELECT * FROM login WHERE userid = ? AND password = ?";
    System.out.println(query);

    /* Using PreparedStatement to avoid SQL injection */
    preparedStatement = con.prepareStatement(query);
    preparedStatement.setString(1, userid);
    preparedStatement.setString(2, password);
    rs = preparedStatement.executeQuery();

    System.out.println("Rs has been executed");

    if (rs.next()) {
        // Valid username and password
        String dbUsername = rs.getString("userid");
        String dbPassword = rs.getString("password");

        if (userid.equals(dbUsername) && password.equals(dbPassword)) {
            System.out.println("User has successfully logged in...");
            session.setAttribute("auth",1);
            session.setAttribute("userr", userid);
            session.setAttribute("connection", con);
            flag = 1;
        }
    }
} catch (Exception e) {
    System.out.println("Exception: " + e);
} finally {
    // Close resources in the reverse order of their creation to avoid resource leaks
    if (rs != null) {
        try {
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    if (preparedStatement != null) {
        try {
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    if (con != null) {
        try {
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

if (flag == 1) {
%>
    <P align=center><FONT COLOR="Green" Face="Georgia"><I><B>Welcome <%= userid %></B></I></FONT>
    <BR><BR>
    <A HREF="AdminMenu.html" target="ResultFrame">
        <img border="0" name="admin" src="Images/Menu/AdminOptions01.jpg" width="105" height="21" onMouseOver="document['admin'].src='Images/Menu/AdminOptions02.jpg'" onMouseOut="document['admin'].src='Images/Menu/AdminOptions01.jpg'">
    </A>
    &nbsp;<A HREF="Logout.jsp" target="_self">
        <img border="0" name="logout" src="Images/Menu/Logout001.jpg" width="105" height="21" onMouseOver="document['logout'].src='Images/Menu/Logout002.jpg'" onMouseOut="document['logout'].src='Images/Menu/Logout001.jpg'">
    </A>
    <jsp:forward page="AdminMenu.html"/>
    </P>
<%
} else {
%>
    <P align=center><IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER="0" ALT="">
    <FONT COLOR="Red" Face="Georgia">SORRY! Invalid username/password, please try again</FONT>
    <BR>
    <A HREF="Login.jsp">&lt;&lt;Back</A>
    </P>
<%
}
%>

</BODY>
</HTML>
