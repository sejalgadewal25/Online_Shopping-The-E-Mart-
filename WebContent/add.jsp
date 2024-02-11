<%@include file="db.jsp" %>
<%@page import="java.sql.*" %>
<%-- <%@page import="PP.Product"%>

<%
	String Category=request.getParameter("cat");
	String Name=request.getParameter("name");
	String P=request.getParameter("price");
	int Price=Integer.parseInt(P);
	String Company=request.getParameter("cmp");
	
	Product p=new Product();
	p.setCat(Category);
	p.setName(Name);
	p.setPrice(Price);
	p.setCmp(Company);

	out.println(p.getCat());
	out.println(p.getName());
	out.println(p.getPrice());
	out.println(p.getCmp());
%> --%>
  <jsp:useBean id="p" class="PP.Product" ></jsp:useBean>
<jsp:setProperty property="*" name="p" />
 
 <%-- <jsp:getProperty property="name" name="p" /> -->
 
<%-- <jsp:getProperty property="price" name="p" />
<jsp:getProperty property="cat" name="p" />
<jsp:getProperty property="cmp" name="p" /> --%>

<%
String qr="insert into Accessory values(?,?,?,?)";
PreparedStatement ps=conn.prepareStatement(qr);
ps.setString(1, p.getCat());
ps.setString(2, p.getName());
ps.setInt(3, p.getPrice());
ps.setString(4, p.getCmp());

int i=ps.executeUpdate();
if(i>=0)
{
	%>
	<jsp:include page="AdminHome.jsp"></jsp:include>
	<% 
out.println("<script>window.alert('product added successfully')</script>");
}
else
{
out.println("product not added");
}
conn.close();
%>
 