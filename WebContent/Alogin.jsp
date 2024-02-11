<html>
	<head>
	</head>
	<body>
	
<%
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	if(id.equals("admin")&&pwd.equals("12345")){
	session.setAttribute("id",id);
		//response.sendRedirect("AdminHome.jsp");	
		%>
		<jsp:forward page="AdminHome.jsp"></jsp:forward>
	<%
	}
	else{
	%>
	<jsp:include page="index.html"></jsp:include>
	<% 
		out.println("<script>window.alert('Please Enter Correct Id and Password')</script>");
	/* 	RequestDispatcher rd=request.getRequestDispatcher("index.html");
		rd.include(request, response);
	 */	
	}

%>
	</body>

</html>
