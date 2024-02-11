<%@page import="java.sql.*" %>
<%@page import="java.lang.*" %>
<%@include file="db.jsp" %>
<%@ page errorPage="error.jsp" %>
<%
String cat=request.getParameter("cat");

String name=request.getParameter("name");
String p=request.getParameter("price");
int price=Integer.parseInt(p);
String cmp=request.getParameter("cmp");

//Class.forName("com.mysql.jdbc.Driver");
//Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_shopping_jsp","root","1437");
String qr="insert into Accessory values(?,?,?,?)";
PreparedStatement ps=conn.prepareStatement(qr);
ps.setString(1, cat);
ps.setString(2, name);
ps.setInt(3, price);
ps.setString(4, cmp);

int i=ps.executeUpdate();
if(i>=0)
{
out.println("<script>window.alert('product added successfully')</script>");
}
else
{
out.println("product not added");
}
conn.close();
%>
