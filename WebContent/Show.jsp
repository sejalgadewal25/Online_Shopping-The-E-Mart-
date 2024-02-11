<%@include file="db.jsp"%>
<%@page errorPage="error.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Free Design Template - Free CSS Template</title>
<meta name="keywords" content="free design template, CSS template, HTML website" />
<meta name="description" content="Free Design Template, Free CSS Website, XHTML CSS layout" />
<link href="addproduct.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.style1 {color: #cc0000}
.style3 {color: #FFFF00}
-->
</style>
</head>
<body>
<!--  Download Free CSS Templates from www.templatemo.com  -->	
<div id="templatemo_header_panel">
	<div id="templatemo_header_section">
   	  <div id="templatemo_title_section">
   	    <p>&nbsp;</p>
   	    <p>Product Details </p>
   	  </div>
        <div class="style1" id="tagline"></div>
    </div>
</div> 
<p>
  <!-- end of haeder -->
  <!-- end of column three -->
  </div>
  <!-- end of content -->
  <h1 align="center" style="color :black;">PRODUCT DETAILS</h1>
<table align="center" border="5px" cellspacing="0px" >
  <tr>
    <th style="color:red;font-size:15px;">CATEGORY</th>
    <th style="color:red;font-size:15px;">NAME</th>
    <th style="color:red;font-size:15px;">PRICE</th>
    <th style="color:red;font-size:15px;">COMPANY</th>
  </tr>
  
<%
	String qr="select * from Accessory";
	Statement st=conn.createStatement();
	ResultSet rs=st.executeQuery(qr);
	if(rs.next()){
		do{
			String Category= rs.getString("Category");

			String Name= rs.getString("Name");
			int Price=rs.getInt("Price");
			String Company= rs.getString("Company");
%>
		
		<tr>
			<td style="font-size:15px;"><%=Category %></td>
			<td style="font-size:15px;"><%=Name %></td>
			<td style="font-size:15px;"><%=Price %></td>
			<td style="font-size:15px;"><%=Company %></td>
			<td><a href="Delete.jsp?name=<%=Name%>">Delete</a></td>
			<td><a href="UpdatePro.jsp?name=<%=Name %>&price=<%=Price%>&cat=<%=Category%>&cmp=<%=Company%>">Update</a></td>
		</tr>
		
		
<%
		}while(rs.next());
	}
	else{
		out.println("No Data Found");
	}
	conn.close();
%>

</table>
</p>
<div id="templatemo_bottom_panel">

	<div class="bottom_panel_section">
   	<a href="#"></a></div>
    
  <div class="bottom_panel_section"></div>

</div>
<!-- end of bottom panel -->
<!--  Free CSS Template by TemplateMo.com  -->
<div align=center></div>
</body>
</html>