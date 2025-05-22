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
    String query = "SELECT * FROM userlogin WHERE username = ? AND password = ?";
    System.out.println(query);

    /* Using PreparedStatement to avoid SQL injection */
    preparedStatement = con.prepareStatement(query);
    preparedStatement.setString(1, userid);
    preparedStatement.setString(2, password);
    rs = preparedStatement.executeQuery();

    System.out.println("Rs has been executed");

    if (rs.next()) {
        // Valid username and password
        String dbUsername = rs.getString("username");
        String dbPassword = rs.getString("password");
        System.out.println("dbusername is " + dbUsername + "dbPassword is " + dbPassword);
        System.out.println("username and password is " + userid + "and " + password);

        if (dbUsername != null && dbPassword != null && userid.equals(dbUsername) && password.equals(dbPassword)) {
            System.out.println("User has successfully logged in...");
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
    <%
        // Redirect only if the flag is set to 1
        response.sendRedirect("User.html");
    %>
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
