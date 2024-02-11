<%@page errorPage="error.jsp" %>
<%@include file="db.jsp" %>
<%
	String Name=request.getParameter("name");
	String p=request.getParameter("price");
	int Price=Integer.parseInt(p);
	String Category=request.getParameter("cat");
	String Company=request.getParameter("cmp");
	
	String qr="update Accessory set Category=?,Price=?,Company=? where Name=?";
	PreparedStatement ps=conn.prepareStatement(qr);
	ps.setString(1,Category);
	ps.setInt(2,Price);
	ps.setString(3,Company);
	ps.setString(4,Name);
	int i=ps.executeUpdate();
	if(i>0)
	{
	%>
	<jsp:include page="Show.jsp"></jsp:include>
	<% 
		out.println("<script>window.alert('Product Updated Successfully')</script>");	
		
	}
	else{
		out.println("Product Not Updated Successfully");
	}
%>