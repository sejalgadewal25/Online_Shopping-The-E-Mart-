<%@page errorPage="error.jsp"%>
<%@include file="db.jsp"%>


<%
	String Email=(String)session.getAttribute("id");
	String Name=request.getParameter("Name");
	String P=request.getParameter("Price");
	int Price=Integer.parseInt(P);
	String Category=request.getParameter("Category");
	String Company=request.getParameter("Company");

	String qr="delete from cart where Name=? AND Price=? AND Category=? AND Company=? AND Email=?";
	PreparedStatement ps=conn.prepareStatement(qr);
	ps.setString(1,Name);
	ps.setInt(2,Price);
	ps.setString(3,Category);
	ps.setString(4,Company);
	ps.setString(5,Email);
	
	int i=ps.executeUpdate();
	if(i>0){
		%>
		<jsp:include page="Uhome.jsp"></jsp:include>
		
		<% 	
		
		out.println("<script>window.alert('Cart Removed Successfully')</script>");
	}

%>