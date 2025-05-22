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

%>
<head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
<SCRIPT LANGUAGE="JavaScript">
<!--
var SCount = 0;

	function setAction(URL,Obj){
		var f = document.forms[0];
		var NoSeats = "<%=NoPass%>";
		var BPoint = f.BPoint.value;
		var SS = f.Seats.value;
		SS = SS.substring(0,SS.length-1);
		if(BPoint==""){
			alert("Boarding point is mandatory");
			return false;
		}
		if(SS == ""||SCount<parseInt(NoSeats)){
			alert("Please select "+NoSeats+" seat(s) to continue");
			return false;
		}
		var ParamsList = "?BPoint="+BPoint+"&SS="+SS;
		Obj.target='tgt';
		Obj.href=URL+ParamsList;
	}
function toggleSelection(Obj)
	{
		var s = Obj.src;
		var Seats = document.forms[0].Seats;
		var NoSeats = "<%=NoPass%>";
		
		if (s.indexOf("availableSeat.jpg")>-1)
		{
			if(SCount>=parseInt(NoSeats)){
				alert("Already You have selected the required seats");
				return;
			}
			Obj.src = "Images/selectedSeat.gif";
			//alert("--"+Obj.alt);
			if(Seats.value==""){
				Seats.value = Obj.alt+",";
			}else{
				Seats.value += Obj.alt+",";
			}
			SCount++;
		}else if (s.indexOf("selectedSeat.gif")>-1)
		{
			Obj.src = "Images/availableSeat.jpg";
			Seats.value=Seats.value.replace(Obj.alt+",","");
			SCount--;
		}else{
			alert("seat already booked");
		}
	}
//-->
</SCRIPT>
<head>
<body Class='SC'>
<HR>
<B><FONT COLOR="#CC00CC" face='verdana'>Seat Selection</FONT></B>
<HR>
<BR><BR>
<form action = "" method = "GET">
<!-- <form action = "BookNow_S2.jsp" method = "GET"> -->
<%
/*Declaration of variables*/
Connection con=null;
Statement stmt=null,stmt1=null,stmt2=null;
ResultSet rs=null,rs1=null,rs2=null;
String RouteSelected = request.getParameter("Route");
String Fare = request.getParameter("Fare");
String Departure = request.getParameter("Departure");
session.setAttribute("Departure",Departure);

String Arrival = request.getParameter("Arrival");
session.setAttribute("Arrival",Arrival);

String Travels = request.getParameter("Travels");
session.setAttribute("Travels",Travels);

System.out.println(Fare);
int iNoPass=0,iFare=0;
if(Fare!=null){
	 iFare = Integer.parseInt(Fare);
}
System.out.println(iFare);
if(NoPass!=null){
	 iNoPass = Integer.parseInt(NoPass);
}
System.out.println(iNoPass);
int tFare = iFare*iNoPass;
System.out.println("Total Fare:"+tFare);
session.setAttribute("Fare",tFare+"");
/*session.setAttribute("Fare",tFare);*/

String RouteId = "";
String TravelsId = "";
String BusId = "";
String[] BPoints = new String[100];
int count=0,NumRows=0;
String BookedSeats="";
try
{
	/*Connection to MySQL database is made with JDBC class one driver*/
	System.out.println("Inside database connection section");
	con = com.ewheelz.ConnectionPool.getConnection();
	System.out.println("RouteSelected is "+ RouteSelected);
	String[] Details = com.ewheelz.MyFunctions.MyTokenizer(RouteSelected,"_");
	RouteId = Details[0];	session.setAttribute("RouteId",RouteId);
	System.out.println("RouteID is " + RouteId);
	TravelsId = Details[1];	session.setAttribute("TravelsId",TravelsId);
	System.out.println("RouteID is " + RouteId);
	BusId = Details[2];		session.setAttribute("BusId",BusId);
	System.out.println(RouteId+TravelsId+BusId);
	stmt =  con.createStatement();
	String Qry = "Select distinct PickupPoint from RouteMap where RouteId = '"+RouteId+"'";
	System.out.println("Search Qry->"+Qry);
	rs = stmt.executeQuery(Qry);
	while(rs.next()){	
		BPoints[NumRows] = rs.getString(1);
		System.out.println("BPoints[NumRows]-:"+BPoints[NumRows]);
		NumRows++;
	}
	String Qry1 = "Select Seats from ticketdetails where RouteId='"+RouteId+"' and BusId='"+BusId+"' and CustomerId <> '' and PaymentId <> ''";
	System.out.println(Qry1);
	rs1 = stmt.executeQuery(Qry1);
	while(rs1.next()){
		BookedSeats+=rs1.getString(1);
	}
	System.out.println("Seats already booked"+BookedSeats);
}
catch(Exception e)
{
	System.out.println("Exception"+e);
}
%>
<H5>Boarding Point</H5>
Select your Boarding point <FONT COLOR="red">*</FONT>
<SELECT NAME="BPoint" class="ListBox" value="<%=BPoints[0]%>">
	<%for(int i=0;i<NumRows;i++){%>
		<OPTION><%=BPoints[i]%></OPTION>
	<%}%>
</SELECT><BR><BR>
Choose your seats <FONT COLOR="red">*</FONT>&nbsp;<INPUT TYPE="text" NAME="Seats" class="TextField">
<BR>
<FONT COLOR="#333399" size="-1" face='Times new roman'><I>select from the available seats from the layout below</I></FONT>
<H5>Bus Layout</H5>
<INPUT TYPE="image" SRC="Images/availableSeat.jpg"></IMG>Available&nbsp;
<IMG SRC="Images/bookedSeat.gif" WIDTH="21" HEIGHT="17" BORDER="0" ALT=""></IMG>Booked&nbsp;
<IMG SRC="Images/selectedSeat.gif" WIDTH="18" HEIGHT="17" BORDER="0" ALT=""></IMG>Selected&nbsp;
<BR><BR>
<TABLE>
<TR>
	<SCRIPT LANGUAGE="JavaScript">
	<!--
		var BookedSeats = "<%=BookedSeats%>";
		//alert(BookedSeats);
		for(i=1;i<=10;i++){
			if(BookedSeats.indexOf("A"+i)>-1){
			document.writeln("<TD><IMG SRC=\"Images/bookedSeat.gif\" style=\"cursor:hand\" alt='A"+i+"' onclick=\"alert('seat already booked');\"></TD>");
			}else{
			document.writeln("<TD><IMG SRC=\"Images/availableSeat.jpg\" style=\"cursor:hand\" alt='A"+i+"' onclick='toggleSelection(this)'></TD>");
			}
		}
	//-->
	</SCRIPT>
</TR>
<TR>
	<SCRIPT LANGUAGE="JavaScript">
	<!--
		var BookedSeats = "<%=BookedSeats%>";
		//alert(BookedSeats);
		for(i=1;i<=10;i++){
			if(BookedSeats.indexOf("B"+i)>-1){
			document.writeln("<TD><IMG SRC=\"Images/bookedSeat.gif\" style=\"cursor:hand\" alt='B"+i+"' onclick=\"alert('seat already booked');\"></TD>");
			}else{
			document.writeln("<TD><IMG SRC=\"Images/availableSeat.jpg\" style=\"cursor:hand\" alt='B"+i+"' onclick='toggleSelection(this)'></TD>");
			}
		}
	//-->
	</SCRIPT></TR>
<TR>
	<TD colspan=10>&nbsp;</TD>
</TR>
<TR>
	-->
	</SCRIPT></TR>
</TABLE>
<P align=right>
<A onclick="setAction('BookNow_S2.jsp',this)" target="ResultFrame"><IMG SRC="Images/Menu/Continue1.jpg" border="0"
	onmouseout="this.src = 'Images/Menu/Continue1.jpg'" 
	onmouseover="this.src = 'Images/Menu/Continue2.jpg'"></A>
	<!-- <input type="submit" value="Continue" target="ResultFrame"><IMG SRC="Images/Menu/Continue1.jpg" border="0"
	onmouseout="this.src = 'Images/Menu/Continue1.jpg'" 
	onmouseover="this.src = 'Images/Menu/Continue2.jpg'"> -->
</P>
</FORM>
</BODY>
</HTML>
