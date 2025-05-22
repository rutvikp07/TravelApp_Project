<HTML>

<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>

<%@ page session="true" %>
<%
	String rFrom = (String)session.getAttribute("rFrom");
	String rTo = (String)session.getAttribute("rTo");
	String JDate = (String)session.getAttribute("JDate");
	String sBusType = (String)session.getAttribute("BusType");
	String NoPass = (String)session.getAttribute("NoPass");
	String RouteId = (String)session.getAttribute("RouteId");
	String TravelsId = (String)session.getAttribute("TravelsId");
	String BusId = (String)session.getAttribute("BusId");
	String Fare =	(String)session.getAttribute("Fare");
	String Departure =	(String)session.getAttribute("Departure");
	String Arrival =	(String)session.getAttribute("Arrival");
	String SelSeats =  (String)session.getAttribute("SelSeats");		
	String BPoint = (String)session.getAttribute("BPoint");
	String CustomerId = (String)session.getAttribute("CustomerId");
	String TicketId =(String)session.getAttribute("TicketId");
%>
<head>
<LINK href="styles.css" type="text/css" rel="stylesheet">
<script LANGUAGE="Javascript" SRC="Images/AjaxCall.js"></script>
<SCRIPT LANGUAGE="JavaScript">

var SCount = 0;

	function setAction(URL,Obj){
		var f = document.forms[0];
		var ParamsList = "?";
		Obj.target='ResultFrame';
		Obj.href=URL+ParamsList;
	}
	function ChkMandatoryField(F,T){
			var val= F.value;
			if(val==""){alert(T+" is mandatory");return false;}
		}
		function ChkNumField(F,T){
			var val = F.value;
			if(isNaN(val)==true||val==""){alert("Please enter numbers for "+T);return false;}
		}
		function ChkCardNo(F,T){
			var val = F.value;
			var pattern = /^([0-9]{16})$/;
			if(!(pattern.test(val)==true)){alert("Please enter valid "+T);return false;}
		}
		function ChkAlphaNumericField(F,T){
			var val = F.value;
			var pattern = /^([a-zA-Z0-9]{1,250})$/;
			if(!(pattern.test(val)==true)){alert("Please enter alphabets or numbers for "+T);return false;}
		}
		function ChkAlphaField(F,T){
			var val = F.value;
			var pattern = /^([a-zA-Z ]{1,250})$/;
			if(!(pattern.test(val)==true)){alert("Please enter text for "+T);return false;}
		}
		function ChkEmailField(F,T){
			var val = F.value;
			var pattern = /^([a-zA-Z0-9\_\.]{4,25})$/;
			if(!(pattern.test(val)==true)){alert("Please enter valid email for "+T);return false;}
		}
		function ChkDateField(F,T)
		{
			var val = F.value;
		    var pattern = /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/;
		    if(!(pattern.test(val)==true)){alert("Please enter valid date format (yyyy-mm-dd) for "+T);return false;}
		}
		function validate()
		{
			var frm = document.forms[0];
			if(ChkMandatoryField(frm.PaymentMode,'Payment Mode')==false) return false;
			if(ChkAlphaField(frm.PaymentMode,'Payment Mode')==false) return false;
			if(ChkMandatoryField(frm.BankName,'Bank Name')==false) return false;
			if(ChkMandatoryField(frm.CardNo,'Card Number')==false) return false;
			if(ChkCardNo(frm.CardNo,'Card Number')==false) return false;
			if(ChkMandatoryField(frm.NetAmount,'Net Amount')==false) return false;
			if(ChkNumField(frm.NetAmount,'Net Amount')==false) return false;
			Params="?CustomerId="+frm.CustomerId.value+"&TicketId="+frm.TicketId.value+"&PaymentMode="+frm.PaymentMode.value+"&BankName="+frm.BankName.value+"&CardNo="+frm.CardNo.value+"&NetAmount="+frm.NetAmount.value;
			fnSavePaymentDetails(Params);
		}

		function fnSavePaymentDetails(Params)
		{
			var divObj = document.getElementById("infodiv");
			URL = "SavePaymentDetails.jsp"+Params;
			//alert(URL);
			ajaxFunction(URL,divObj);
		}

</SCRIPT>


<head>
<body Class='SC'>
<HR>
<B><FONT COLOR="#CC00CC" face='verdana'>Payment</FONT></B>
<HR>
<BR><BR>
<FORM>
<%
/*Declaration of variables*/
Connection con=null;
Statement stmt=null,stmt1=null,stmt2=null;
ResultSet rs=null,rs1=null,rs2=null;
int count=0,NumRows=0;
try
{
	/*Connection to MySQL database is made with JDBC class one driver*/
	con = com.ewheelz.ConnectionPool.getConnection();
	stmt =  con.createStatement();
	String Qry = "";
	System.out.println("Search Qry->"+Qry);
	//rs = stmt.executeQuery(Qry);
	/*while(rs.next()){	
		NumRows++;
	}*/
}
catch(Exception e)
{
	System.out.println("Exception"+e);
}
%>
	<TABLE width="60%" align=center>
		<TR class="row_title">
				<TH align="center" colspan=2>Provide payment details</TH>
		</TR>
		<TR class="row_odd">
				<TH align="left">CustomerId</TH>
				<TD><Input type=text name='CustomerId' value='<%=CustomerId%>' readonly ></TD>
		</TR>
		<TR class="row_even">
				<TH align="left">TicketId</TH>
				<TD><Input type=text name='TicketId' value='<%=TicketId%>' readonly ></TD>
		</TR>
		<TR class="row_odd">
				<TH align="left">PaymentMode<FONT COLOR="red">*</FONT></TH>
				<TD><select name=PaymentMode>
					<option value=Credit Card>Credit Card</option>
					<option value=Debit Card>Debit Card</option>
					</select>
				</TD>
		</TR>
		<TR class="row_even">
				<TH align="left">BankName<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='BankName' value=''></TD>
		</TR>
		<TR class="row_odd">
				<TH align="left">CardNo<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='CardNo' value=''></TD>
		</TR>
		<TR class="row_even">
				<TH align="left">NetAmount<FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='NetAmount' value='<%=Fare%>' readonly></TD>
		</TR>
		<TR class="row_odd"><TH align=right colspan=2><INPUT TYPE="Button" value='Save' class="WinButton" onclick="validate();" ></TH></TR>
	</TABLE>

	<P align=center><FONT  COLOR="black" face='Georgia'>Fields with <FONT SIZE="" COLOR="red">*</FONT> are mandatory </FONT></P>
	<div id='infodiv'></div>
<P align=right>
	<A onclick="if(document.getElementById('infodiv').innerHTML.indexOf('success')>-1){setAction('BookNow_S4.jsp',this)}else{alert('Payment details is mandatory');}" target="ResultFrame"><IMG SRC="Images/Menu/Confirm1.jpg" border="0"
	onmouseout="this.src = 'Images/Menu/Confirm1.jpg'" 
	onmouseover="this.src = 'Images/Menu/Confirm2.jpg'"></A>
</P>
</FORM>
</BODY>
</HTML>
