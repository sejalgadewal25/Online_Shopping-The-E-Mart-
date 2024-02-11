<%@page errorPage="error.jsp"%>
<%@include file="db.jsp" %>
<%
	String Email=(String)session.getAttribute("id");
	String Name=request.getParameter("name");
	String P=request.getParameter("price");
	int Price=Integer.parseInt(P);
	String Category=request.getParameter("cat");
	
	String Company=request.getParameter("cmp");

	String qr="insert into cart values(?,?,?,?,?)";
	PreparedStatement ps=conn.prepareStatement(qr);
	ps.setString(1,Name);
	ps.setInt(2,Price);
	ps.setString(3,Category);
	ps.setString(4,Company);
	ps.setString(5,Email);
	int i=ps.executeUpdate();
	RequestDispatcher  rd=request.getRequestDispatcher("Uhome.jsp");
	rd.include(request,response);
	if(i>=0)
	{
	out.println("<script>window.alert('Successfully Added to Cart')</script>");
	}
	else
	{
	out.println("Not Added to cart");
	}
	conn.close();

%>