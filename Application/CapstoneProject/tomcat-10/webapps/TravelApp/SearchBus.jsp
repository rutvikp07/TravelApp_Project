
<html>

<head>
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

 <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
 </script>
<title>Book Tickets Now</title>
  <script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
  <script LANGUAGE="Javascript" SRC="Images/calender.js"></script>
   <LINK href="styles.css" type="text/css" rel="stylesheet">
 <SCRIPT LANGUAGE="JavaScript">
 
	function setAction(URL,Obj){
		alert("Set action method is called ");
		var f = document.forms[0];
		var From = f.From.options[f.From.options.selectedIndex].text;
		//alert(From);

		var To = f.To.options[f.To.options.selectedIndex].text;
		//alert(To);
		if(From==To){
			alert("From and To can not be same. Please select different places");
			f.To.focus();
			return false;

		}
		var JDate = f.JDate.value;
		//alert(JDate);
		if(JDate=="") {alert("Journey date is mandatory");f.JDate.focus();return false;}
		if(validatePastDate(f.JDate)==false){
			alert("Past date is not allowed. Please select another date");
			f.JDate.focus();return false;
		}
		var BusType = f.BusType.options[f.BusType.options.selectedIndex].text;
		//alert(BusType);
		var NoPass = f.NoPass.value;
		if(NoPass==""||isNaN(NoPass)==true||NoPass<=0) {alert("Please enter a valid number for Number of passengers");f.JDate.focus();return false;}
		//alert(NoPass);
		var ParamsList = "?From="+From+"&To="+To+"&JDate="+JDate+"&BusType="+BusType+"&NoPass="+NoPass;
		Obj.target='tgt';
		Obj.href=URL+ParamsList;
	}
 
 </SCRIPT>
</head>

<body class="SC">

<!-- <FORM ACTION=""> -->
<form action = "Search.jsp" method = "GET">

<p align="center"><b><font face="Verdana" color="#800080" size="2">Book Tickets 
Now</font></b></p>
<div align="left">
			<table align="center">
				<tr class="row_odd">
					<td>From</td>
					<td><SELECT NAME="From" class="ListBox">
							<%
							Connection con = null;
							ResultSet res_set = null;
							Statement stmt = null;
							try {
								con = com.ewheelz.ConnectionPool.getConnection();
								stmt = con.createStatement();
								String qry = "select distinct rFrom from `routemaster`";
								res_set = stmt.executeQuery(qry);
								while (res_set.next()) {
							    %>
							      <option><%=res_set.getString(1)%></option>
							    <%	
							      }
							} catch (Exception e) {
								
							}
							stmt.close();
							con.close();
                          %>
					</select></td>
				</tr>
				<tr class="row_even">
					<td>To</td>
					<td><SELECT NAME="To" class="ListBox">
								<%
							Connection con1 = null;
							ResultSet res_set1 = null;
							Statement stmt1 = null;
							try {
								con1 = com.ewheelz.ConnectionPool.getConnection();
								stmt1 = con1.createStatement();
								String qry1 = "select distinct rTo from `routemaster`";
								res_set1 = stmt1.executeQuery(qry1);
								while (res_set1.next()) {
							    %>
							      <option><%=res_set1.getString(1)%></option>
							    <%	
							      }
							} catch (Exception e) {
								
							}
							stmt1.close();
							con1.close();
                          %>
					</SELECT></td>
				</tr>
				<tr class="row_odd">
					<td>Journey Date</td>
					<!--     <td><input type="text" name='JDate' data-role="date" data-inline="true"></td> -->
					<td><input type="text" name='JDate' id="datepicker"></td>
					<!-- <td><Input type=text name='JDate' value='' readonly size="12"  class="TextField">
			<img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this)" height="16" src="Images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" ></td> -->
				</tr>
				<tr class="row_even">
					<td>Bus Type</td>
					<td><SELECT NAME="BusType" class="ListBox">
							<OPTION>Sleeper</OPTION>
							<OPTION>AC</OPTION>
							<OPTION>Non AC</OPTION>
							<OPTION selected="selected">any</OPTION>
					</SELECT></td>
				</tr>
				<tr class="row_odd">
					<td>No. of Passengers</td>
					<td><INPUT TYPE="text" NAME="NoPass" size="12"
						class="TextField"></td>
				</tr>
				<tr class="row_even">
					<td>&nbsp;</td>
					<td><input type="submit" value="Check Availability" /></td>
					<!-- <td><A onclick="setAction('Search.jsp',this)" target="ResultFrame"><IMG SRC="Images/Menu/chkAvailability1.gif" border="0"
			onmouseout="this.src = 'Images/Menu/chkAvailability1.gif'" 
			onmouseover="this.src = 'Images/Menu/chkAvailability2.gif'"></A></td> -->
				</tr>
			</table>

		</div>
</FORM>
</body>

</html>