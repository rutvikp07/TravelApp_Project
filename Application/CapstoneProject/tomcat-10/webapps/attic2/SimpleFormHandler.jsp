<%@ page import="java.util.ArrayList" %>
<html>
<body>

<%

// Grab the variables from the form.
  String firstName = request.getParameter("firstName");
  String lastName = request.getParameter("lastName");
  String gender = request.getParameter("gender");
  String Tree = request.getParameter("Tree");
%>
<%-- Print out the variables. --%>
<h1>Hello, <%=firstName%> <%=lastName%>!</h1>
I see that you are <%=gender%>. You know, you remind me of a
<%=Tree%> I once saw. <br/>
	<% 
	ArrayList<String> data = new ArrayList<String>();
	for(int i = 0; i < 25000; i++) { 
		data.add( new String("fadfefFwfsdfWJLFKJFBKSDJFBKSJDFBKsdjfbkSJDFBKSDJFBKSJDFBksdjfbkSDJFBSKDJFBKSKjdfksajdfbkjdfbksdjfbksdjfbskdjfbksdjfbkasdjfbksajdfbaksjdfbaksjdfbaksjdfbkasjdfbkasjdfbaksjdbfaksjdfbkasdfbaksdfb"));%>
		<%=i%>
		
	<% } %>


</body>
</html>
