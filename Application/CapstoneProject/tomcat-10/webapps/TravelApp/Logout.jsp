<!--
	File : Logout.jsp
	

-->
<html>
<%@ page language="java" %>
<%@ page session="true" %>
<%@page import="java.sql.*,java.io.*,java.util.Random"%>
<%
	session.removeAttribute("userr");
	session.removeAttribute("connection");
	session.removeAttribute("auth");
	session.invalidate();
	
%>
<body class="SC">
<jsp:forward page="index.html"/>
</body>
</html>