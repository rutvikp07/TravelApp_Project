<%@ page language="java"%>
<%@ page session="true"%>
<%@ page import="java.sql.*,java.io.*,com.ewheelz.MyFunctions"%>


<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1252">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">

<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>

<LINK href="styles.css" type="text/css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker();
	});
</script>
<script LANGUAGE="Javascript" SRC="Images/calender.js"></script>
<script LANGUAGE="Javascript">
	function ChkMandatoryField(F, T) {
		var val = F.value;
		if (val == "") {
			alert(T + " is mandatory");
			return false;
		}
	}
	function ChkNumField(F, T) {
		var val = F.value;
		if (isNaN(val) == true || val == "") {
			alert("Please enter numbers for " + T);
			return false;
		}
	}
	function ChkAlphaNumericField(F, T) {
		var val = F.value;
		var pattern = /^([a-zA-Z0-9]{1,250})$/;
		if (!(pattern.test(val) == true)) {
			alert("Please enter alphabets or numbers for " + T);
			return false;
		}
	}
	function ChkAlphaField(F, T) {
		var val = F.value;
		var pattern = /^([a-zA-Z ]{1,250})$/;
		if (!(pattern.test(val) == true)) {
			alert("Please enter text for " + T);
			return false;
		}
	}
	function ChkDateField(F, T) {
		var val = F.value;
		var pattern = /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/;
		if (!(pattern.test(val) == true)) {
			alert("Please enter valid date format (yyyy-mm-dd) for " + T);
			return false;
		}
	}
	function ChkDestField(F, T) {
		var f = document.forms[0];
		var rFrom = f.rFrom.options[f.rFrom.options.selectedIndex].text;
		//alert(rFrom);

		var rTo = f.rTo.options[f.rTo.options.selectedIndex].text;
		//alert(rTo);
		if (rFrom == rTo) {
			alert("From and To can not be same. Please select different places");
			f.rTo.focus();
			return false;

		}
	}
	function ChkJDateField(F, T) {
		var f = document.forms[0];
		var JDate = f.JDate.value;
		//alert(JDate);
		if (JDate == "") {
			alert("Journey date is mandatory");
			f.JDate.focus();
			return false;
		}
		if (validatePastDate(f.JDate) == false) {
			alert("Past date is not allowed. Please select another date");
			f.JDate.focus();
			return false;
		}
	}

	function validate() {
		var frm = document.forms[0];
		if (ChkMandatoryField(frm.rFrom, 'From') == false)
			return false;
		if (ChkMandatoryField(frm.rTo, 'To') == false)
			return false;
		if (ChkDestField(frm.rTo, 'To') == false)
			return false;
		if (ChkMandatoryField(frm.TravelsId, 'Travels Id') == false)
			return false;
		if (ChkMandatoryField(frm.BusId, 'Bus Id') == false)
			return false;
		if (ChkMandatoryField(frm.Departure, 'Departure') == false)
			return false;
		if (validateTime(frm.Departure) == false)
			return false;
		if (ChkMandatoryField(frm.Arrival, 'Arrival') == false)
			return false;
		if (validateTime(frm.Arrival) == false)
			return false;
		if (ChkMandatoryField(frm.Fare, 'Fare') == false)
			return false;
		if (ChkNumField(frm.Fare, 'Fare') == false)
			return false;
		if (ChkMandatoryField(frm.JDate, 'Date') == false)
			return false;
		if (ChkJDateField(frm.JDate, 'Date') == false)
			return false;
		if (ChkDateField(frm.JDate, 'Date') == false)
			return false;
	}
	function fnBusDetails() {
		alert("bus details is called");
		var frm = document.forms[0];
		var TravelsId = frm.TravelsId.value;
		if (TravelsId == '') {
			alert("Please Enter TravelsId to Proceed");
		} else {
			var URL = "ShowBuses.jsp?TravelsId=" + TravelsId;
			fnEmpPopUp(URL, 300, 400);
		}
	}
</script>
</HEAD>
<Body class=SC>

	<HR>
	<B><FONT COLOR="#CC00CC" face='verdana'>Add Route</FONT></B>
	<HR>
	<%
	Integer IAuth = (Integer) session.getAttribute("auth");
	int auth = 1;
	if (IAuth != null) {
		auth = IAuth.intValue();
	}
	System.out.println("===Authentication==" + auth);
	auth = 0;
	if (auth != 0) {
	%><P align=center>
		<IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER="0" ALT=""><B><FONT
			COLOR="red">You are not authorized to access this page</FONT></B>
	</P>
	<%
	} else {
	%>
	<FORM ACTION="AddRoute1.jsp" onsubmit="return validate()">
		<center>
			<TABLE BORDER="0" CELLSPACING="2" CELLPADDING="2">
				<TR class=row_title ALIGN="center">
					<TH COLSPAN="2">Add New Route</TH>
				<tr class="row_odd">
					<td>From</td>
					<td><input type="text" NAME="rFrom"></input></td>
				</tr>
				<tr class="row_even">
					<td>To</td>
					<td><input type="text" NAME="rTo"></input> </SELECT></td>
				</tr>
				<tr class="row_odd">
					<TD>Travels Id<FONT COLOR="red">*</FONT></TD>
					<TD><Input type=text name='TravelsId'> <INPUT
						TYPE="Button" Name="GBid" value="..."
						Onclick="fnEmpPopUp('ShowTravels.jsp',300,400);">
				</TR>
				<tr class="row_even">


					<TD>Bus Id<FONT COLOR="red">*</FONT></TD>
					<TD><Input type=text name='BusId' value=''> <INPUT
						TYPE="Button" Name="GBid" value="..." Onclick="fnBusDetails()">
				</TR>
				<tr class="row_odd">
					<TD>Departure<FONT COLOR="red">*</FONT></TD>
					<TD><Input type=text name='Departure' value=''>HH:MM</TD>
				</TR>
				<tr class="row_even">
					<TD>Arrival<FONT COLOR="red">*</FONT></TD>
					<TD><Input type=text name='Arrival' value=''>HH:MM</TD>
				</TR>
				<tr class="row_odd">
					<TD>Fare<FONT COLOR="red">*</FONT></TD>
					<TD><Input type=text name='Fare' value=''></TD>
				</TR>
				<tr class="row_even">
					<TD>Journey Date<FONT COLOR="red">*</FONT></TD>
					<td><input type="text" name='JDate' id="datepicker"></td>
					<!-- <TD><Input type=text name='JDate' value='' readonly><img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this)" height="16" src="Images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" ></TD> -->
				</TR>
				<TR>
					<TH>
					<TD><INPUT TYPE="submit" value='Submit'></TD>
					<TH>
					<TD><INPUT TYPE="reset" value='Clear'></TD>
				</TR>
			</TABLE>
			<H6 align=center>
				Fields with <FONT SIZE="" COLOR="red">*</FONT> are mandatory
			</H6>

		</center>
	</FORM>
</BODY>
<%}%>