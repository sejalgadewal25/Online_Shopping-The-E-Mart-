<%@page errorPage="error.jsp"%>
<%@include file="db.jsp"%>
<%
String Name=request.getParameter("name");
String Email=request.getParameter("email");
String Password=request.getParameter("pwd");
String qr="insert into user values(?,?,?)";
PreparedStatement ps=conn.prepareStatement(qr);
ps.setString(2, Email);
ps.setString(3, Password);
ps.setString(1, Name);

int i=ps.executeUpdate();
if(i>0)
{
%>
      <jsp:include page="index.html"></jsp:include>
<% 
	out.println("<script>window.alert('Signed Up Succesfully');</script>");
}
else{
	RequestDispatcher rd=request.getRequestDispatcher("signup.html");
	rd.include(request, response);
	out.println("<script>window.alert('please check  details');</script>");
}

%>