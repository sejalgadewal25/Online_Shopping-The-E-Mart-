<%@page errorPage="error.jsp" %>
<%@include file="db.jsp" %>
<body>
<%
	String Name=request.getParameter("name");
	String qr="delete from Accessory where Name=?";
	PreparedStatement ps=conn.prepareStatement(qr);
	ps.setString(1,Name);
	
	int i=ps.executeUpdate();
	if(i>0){
	%>
	<jsp:include page="AdminHome.jsp"></jsp:include>
	<%
		out.println("<script>window.alert('Product Deleted Successfully')</script>");
	}
	else{
		out.println("<script>window.alert('Product Not Deleted')</script>");
	}
	conn.close();
%>
</body>