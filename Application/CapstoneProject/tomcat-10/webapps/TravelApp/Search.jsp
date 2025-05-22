
<HTML>
<%@ page import="java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>

<%@ page session="true" %>
<head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
<SCRIPT LANGUAGE="JavaScript">

	function setAction(URL,Obj){
		var f = document.forms[0];
		var Route = f.Route;
		var Fare = document.getElementsByName("Fare");
		var Departure = document.getElementsByName("Departure");
		var Arrival = document.getElementsByName("Arrival");
		var Travels = document.getElementsByName("Travels");
		var sFlag = false;
		if(Route.length==null){
			if(Route.checked==true){
				V = Route.value;
				Fare = f.Fare.value;
				Departure = f.Departure.value;
				Arrival = f.Arrival.value;
				Travels = f.Travels.value;
				sFlag = true;
			}else{
				sFlag = false;
			}
		}else{
			for(i=0;i<Route.length;i++){
				if(Route[i].checked==true){
					V = Route[i].value;
					Fare = Fare[i].value;
					Departure = f.Departure[i].value;
					Arrival = f.Arrival[i].value;
					Travels = f.Travels[i].value;
					sFlag = true;
					break;
				}else{
					sFlag = false;
				}
			}
		}
		if(sFlag==true){
			var ParamsList = "?RouteSelected="+V+"&Fare="+Fare+"&Departure="+Departure+"&Arrival="+Arrival+"&Travels="+Travels;
			Obj.target='tgt';
			Obj.href=URL+ParamsList;
		}else{
			alert("Please select a route to book ticket");
			return false;
		}
	}
//-->
</SCRIPT>
<head>
<body Class='SC'>
<HR>
<B><FONT COLOR="#CC00CC" face='verdana'>Select Bus</FONT></B>
<HR>
<BR><BR>
<FORM ACTION="BookNow_S1.jsp" method = "Post">
<TABLE class='notepad' align='center'>


<%

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;
System.out.println("The search function is called ");
String rFrom = request.getParameter("From");		session.setAttribute("rFrom",rFrom);
System.out.println("from date is " + rFrom);
String rTo = request.getParameter("To");			session.setAttribute("rTo",rTo);
System.out.println("to date is " + rTo);
String JDate = request.getParameter("JDate");	
System.out.println("Called JDate");

session.setAttribute("JDate",JDate);

System.out.println(" date is " + JDate);



String dateStr = JDate;
System.out.println("Date is " + dateStr);  
SimpleDateFormat formater = new SimpleDateFormat("MM/dd/yyyy");
Date result = formater.parse(dateStr);
SimpleDateFormat AppDateFormat = new SimpleDateFormat("yyyy-MM-dd");
System.out.println(AppDateFormat.format(result));
String fromattedate = AppDateFormat.format(result);
System.out.println("The formatted date is " + fromattedate);
System.out.println(" The converted date is " +result);

/* DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
Date date1 = df.parse(JDate);
DateFormat outputFormatter1 = new SimpleDateFormat("yyyy-MM-dd");
String output1 = outputFormatter1.format(date1);
  SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
  Date result = formater.parse(dateStr);
  SimpleDateFormat AppDateFormat = new SimpleDateFormat("dd-MM-yyyy");
  out.println(AppDateFormat.format(result)); */




String sBusType = request.getParameter("BusType");	session.setAttribute("BusType",sBusType);
String BusTypeCondition="";
if(sBusType.equals("Any")){
	BusTypeCondition="'AC','Non AC','Sleeper'";
}else{
	BusTypeCondition="'"+sBusType+"'";
}

System.out.println("The bus type is "+ BusTypeCondition);
String NoPass = request.getParameter("NoPass");		session.setAttribute("NoPass",NoPass);
System.out.println("The NoPass " + NoPass);
//System.out.println("From = "+From+"\t"+"To = "+To+"JDate = "+JDate+"\t"+"BusType = "+BusType+"NoPass = "+NoPass);

try
{
	/*Connection to MySQL database is made with JDBC class one driver*/
	
	con = com.ewheelz.ConnectionPool.getConnection();
	stmt = con.createStatement(
             ResultSet.TYPE_SCROLL_INSENSITIVE,
             ResultSet.CONCUR_UPDATABLE);
	/*stmt =  con.createStatement();*/
	/*String Qry = "select a.RouteId,b.Travels,b.AgentName,b.PhoneNumber,c.BusType,c.BusNumber,a.Fare,a.Departure,a.Arrival,a.TravelsId,a.BusId from routemaster a left join travelsmaster b on (a.TravelsId=b.TravelsId )left join busmaster c on (a.BusId=c.BusId)";*/
	String Qry="SELECT a.RouteId, b.Travels, b.AgentName, b.PhoneNumber, c.BusType, c.BusNumber, a.Fare, " +
            "a.Departure, a.Arrival, a.TravelsId, a.BusId FROM routemaster a " +
            "LEFT JOIN travelsmaster b ON (a.TravelsId = b.TravelsId) " +
            "LEFT JOIN busmaster c ON (a.BusId = c.BusId AND c.BusType IN (" + BusTypeCondition + ")) " +
            "WHERE a.rFrom = '" + rFrom + "' AND a.rTo = '" + rTo + "' AND a.JDate = '" + fromattedate + "' AND " +
            "a.Availability >= " + NoPass;

	
	//String Qry = "select a.RouteId,b.Travels,b.AgentName,b.PhoneNumber,c.BusType,c.BusNumber,a.Fare,a.Departure,a.Arrival,a.TravelsId,a.BusId from routemaster a left join travelsmaster b on (a.TravelsId=b.TravelsId ) left join busmaster c on (a.BusId=c.BusId and c.BusType in ("+BusTypeCondition+")) where  a.rFrom='"+rFrom+"' and a.rTo='"+rTo+"' and a.JDate='"+fromattedate+"' and a.Availability >= "+NoPass;
	/*String Qry = "select a.RouteId,b.Travels,b.AgentName,b.PhoneNumber,c.BusType,c.BusNumber,a.Fare,a.Departure,a.Arrival,a.TravelsId,a.BusId from routemaster a left join travelsmaster b on (a.TravelsId=b.TravelsId ) left join busmaster c on (a.BusId=c.BusId and c.BusType in ("+BusTypeCondition+")) where  a.rFrom=' "+Hyderabad+"' and a.rTo='"+Bangalore+"' and a.JDate='2008-11-27' and a.Availability >= "+NoPass;*/

    System.out.println("Search Qry->"+Qry);
	rs = stmt.executeQuery(Qry);
	int count=0,NumRows=0;
	while(rs.next()){NumRows++;}
	rs.beforeFirst();
	if(NumRows>0){
		//Display header
		%>
			<TR class="row_title">
				<TD>Select</TD>
				<TD>Route Id</TD>
				<TD>Travels</TD>
				<TD>Agent Name</TD>
				<TD>Phone number</TD>
				<TD>Bus Type</TD>
				<TD>Bus Number</TD>
				<TD>Fare</TD>
				<TD>Departure</TD>
				<TD>Arrival</TD>
			</TR>	
		<%
		while(rs.next())
			{
					//Display body
					String RouteId=rs.getString(1);
					String Travels=rs.getString(2);
					String AgentName=rs.getString(3);
					String PhoneNumber=rs.getString(4);
					String BusType=rs.getString(5);
					String BusNumber=rs.getString(6);
					String Fare=rs.getString(7);
					String Departure=rs.getString(8);
					String Arrival=rs.getString(9);
					String TravelsId=rs.getString(10);
					String BusId=rs.getString(11);
					%>
						<TR class="<%=(count%2==0)? "row_odd" : "row_even" %>" >
							<TD><INPUT TYPE="radio" NAME="Route" Value="<%=RouteId%>_<%=TravelsId%>_<%=BusId%>"></TD>
							<TD><%=RouteId%></TD>
							<TD><%=Travels%><INPUT TYPE="hidden" NAME="Travels" value="<%=Travels%>"></TD>
							<TD><%=AgentName%><INPUT TYPE="hidden" NAME="AgentName" value="<%=AgentName%>"></TD>
							<TD><%=PhoneNumber%><INPUT TYPE="hidden" NAME="PhoneNumber" value="<%=PhoneNumber%>"></TD>
							<TD><%=BusType%><INPUT TYPE="hidden" NAME="BusType" value="<%=BusType%>"></TD>
							<TD><%=BusNumber%><INPUT TYPE="hidden" NAME="BusNumber" value="<%=BusNumber%>"></TD>
							<TD><%=Fare%><INPUT TYPE="hidden" NAME="Fare" value="<%=Fare%>"></TD>
							<TD><%=Departure%><INPUT TYPE="hidden" NAME="Departure" value="<%=Departure%>"></TD>
							<TD><%=Arrival%><INPUT TYPE="hidden" NAME="Arrival" value="<%=Arrival%>"></TD>
						</TR>
					<%
				count++;
			}
			%>
			
					</TABLE>
					<P align=right>
					<input type="submit", value = "Book Now"/>
					<!-- 	<A onclick="setAction('BookNow_S1.jsp',this)" target="ResultFrame"><IMG SRC="Images/Menu/BookNow1.jpg" border="0"
						onmouseout="this.src = 'Images/Menu/BookNow1.jpg'" 
						onmouseover="this.src = 'Images/Menu/BookNow2.jpg'"></A> -->
					</P>
			<%
	}else{
		%>
			<P align="center"><IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER="0" ALT=""><FONT COLOR="red" face='Georgia'>No Busses available.Please refine your search and try again</FONT><BR>
			</P>
		<%
	}
	System.out.println(count+" routes found");
}
catch(Exception e)
{
	System.out.println("Exception"+e);
}
%>

</FORM>
</BODY>
</HTML>
