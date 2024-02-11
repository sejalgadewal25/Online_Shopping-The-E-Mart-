<%@page errorPage="error.jsp"%>
<%@include file="db.jsp"%>

<%
	String Email=request.getParameter("email");

	String qr="delete from user where Email=?";
	PreparedStatement ps=conn.prepareStatement(qr);
	ps.setString(1,Email);
	int i=ps.executeUpdate();
	if(i>0){
		%>
		<jsp:include page="index.html"></jsp:include>
		
		<% 	
		
		out.println("<script>window.alert('User Successfullt Logout')</script>");
		
	}
	else{
		RequestDispatcher rd=request.getRequestDispatcher("Ulogout.html");
		rd.include(request, response);
		out.println("<script>window.alert('Invalid Id And Password');</script>");
	}
		

%>