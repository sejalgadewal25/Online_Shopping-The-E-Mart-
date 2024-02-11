<%@page errorPage="error.jsp"%>
<%@include file="db.jsp"%>
<%!int total=0;%>
<%
String email=(String)session.getAttribute("id");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Free Design Template - Free CSS Template</title>
<meta name="keywords" content="free design template, CSS template, HTML website" />
<meta name="description" content="Free Design Template, Free CSS Website, XHTML CSS layout" />
<link href="user.css" rel="stylesheet" type="text/css" />
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
   	    <p>WELCOME</p>
   	    </div>
        <div class="style1" id="tagline">
		<h4 style="color:#FF0000"> <%=email %></h4>
		</div>
    </div>
</div> <!-- end of haeder -->

<div id="templatemo_menu_panel">
    <div id="templatemo_menu_section">
        <ul>
           <li> <a href="Logout" class="style3" style="margin-left:50px;color:#FFFF00">LOGOUT</a></li>

			<li><a href="Uhome.jsp" class="last style3" style="margin-left:500px;color:#FFFF00">HOME</a></li>     
			                
        </ul> 
    </div>
</div> 

<div id="templatemo_content">

	<div id="templatemo_content_column_one">
    	<div class="column_one_section">
    	  <ul>
    	<%
	String qr="select * from cart where email=?";
	PreparedStatement ps=conn.prepareStatement(qr);
	ps.setString(1,email);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		do{
			String Name=rs.getString("Name");
			int Price=rs.getInt("Price");
			String Cat=rs.getString("Category");
			String Cmp=rs.getString("Company");
			%>
			<center>
			<div style="height:200px;width:100%;background-color:yellow;color:red;text-align:center;border:1px solid black">
				<br>
				NAME:<%=Name %><br><br>
				PRICE:<%=Price %><br><br>
				CATEGORY:<%=Cat %><br><br>
				COMPANY:<%=Cmp %><br><br>
				<a href="remove_cart.jsp?Name=<%=Name %>&Price=<%=Price%>&Category=<%=Cat%>&Company=<%=Cmp%>" style="color:blue;">REMOVE FROM CART</a>
				
			</div>
			</center>
			<%
			total=total+Price;
		}while(rs.next());
		
	}
	else{
		out.println("no data found");
	}
	conn.close();
%>
    	</ul>                  
      </div>
        
        <div class="column_one_section"></div>
        
        
    </div> <!-- end of column one -->
    <!-- end of column two -->
<div class="column_three_section"></div>
               
        <div class="column_three_section"></div>  
          
</div> <!-- end of column three -->
</div>
<!-- end of content -->
<h4 align="center">TOTAL AMOUNT:<%=total %></h4>
<center><a href="https://www.paypal.com/in/signin">CHECKOUT</a></center>

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



