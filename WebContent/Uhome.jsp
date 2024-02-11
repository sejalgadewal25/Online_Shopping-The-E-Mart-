<%@page errorPage="error.jsp"%>
<%@include file="db.jsp"%>
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
           <li> <a href="Viewcart.jsp" class="style3" style="margin-left:50px;color:#FFFF00">VIEWCART</a></li>

			<li><a href="index.html" class="last style3" style="margin-left:500px;color:#FFFF00">BACK TO USER LOGIN</a></li>     
			                
        </ul> 
    </div>
</div> 

<div id="templatemo_content">

	<div id="templatemo_content_column_one">
    	<div class="column_one_section">
    	  <ul>
    	<%
	String qr="select * from Accessory";
	Statement st=conn.createStatement();
	ResultSet rs=st.executeQuery(qr);
	if(rs.next())
	{
		do{
			String Name=rs.getString("Name");
			int Price=rs.getInt("Price");
			String Cat=rs.getString("Category");
			String Cmp=rs.getString("Company");
			%>
			<center>
			<div style="height:300px;width:100%;background-color:yellow;color:red;text-align:center;border:1px solid black">
				<br>
				<h3>NAME:- <%= Name %></h3><br>
				<h3>PRICE:- <%=Price %></h3><br>
				<h3>CATEGORY:- <%=Cat %></h3><br>
				<h3>COMPANY:- <%=Cmp %></h3><br>
				<a href="https://www.paypal.com/in/signin" style="color:blue;">BUY NOW</a>
				<br><br>
				<a href="Cart.jsp?name=<%=Name %>&price=<%=Price%>&cat=<%=Cat%>&cmp=<%=Cmp%>" style="color:blue;">ADD TO CART</a>
							
			</div>
			</center>
		<% 
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
        
        </div>
      <!-- end of column one -->
    <!-- end of column two -->
<div class="column_three_section"></div>
               
        <div class="column_three_section"></div>  
          
</div>
 <!-- end of column three -->
</div>
<!-- end of content -->
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







