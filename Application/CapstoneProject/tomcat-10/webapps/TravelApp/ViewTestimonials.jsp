<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random, com.ewheelz.*"%>

<head>
    <script language="Javascript" src="Images/validate.js"></script>
    <link href="styles.css" type="text/css" rel="stylesheet">
</head>

<body class="SC">
    <h2 align="center">Testimonials</h2>

    <%
        Connection con = null;
        ResultSet rs = null;
        Statement stmt = null;
        try {
            con = ConnectionPool.getConnection();
            stmt = con.createStatement();
            String Query = "Select * from feedback order by `FId`";
            rs = stmt.executeQuery(Query);
    %>

    <table align="center" width="100%">
        <tr class="row_title">
            <th align="left">FId</th><th align="left">UserID</th><th align="left">Feedback</th><th align="left">DateSubmitted</th>
        </tr>
        <%
            int rCount = 0;
            while (rs.next()) {
        %>
        <tr class="<%= (rCount % 2 != 0) ? "row_even" : "row_odd" %>">
            <td><%= rs.getString(1) %></td><td><%= rs.getString(2) %></td><td><%= rs.getString(3) %></td><td><%= rs.getString(4) %></td>
        </tr>
        <%
            rCount++;
            }
            if (rCount == 0) {
        %>
        <tr>
            <td colspan="4" align="center"><h3>Sorry, No records Found</h3></td>
        </tr>
        <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        %>
    </table>
</body>
