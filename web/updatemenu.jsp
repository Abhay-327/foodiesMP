<%-- 
    Document   : updatemenu
    Created on : 10 Apr, 2017, 7:43:12 PM
    Author     : RAVI
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.connection"%>
 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Catering.com</title>
<meta charset="utf-8">
<link rel="stylesheet" href="css/reset.css" type="text/css" media="screen">
<link rel="stylesheet" href="css/style.css" type="text/css" media="screen">
<link rel="stylesheet" href="css/layout.css" type="text/css" media="screen">
<script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="js/cufon-yui.js" type="text/javascript"></script>
<script src="js/cufon-replace.js" type="text/javascript"></script>
<script src="js/Dynalight_400.font.js" type="text/javascript"></script>
<script src="js/FF-cash.js" type="text/javascript"></script>
<script src="js/tms-0.3.js" type="text/javascript"></script>
<script src="js/tms_presets.js" type="text/javascript"></script>
<script src="js/jquery.easing.1.3.js" type="text/javascript"></script>
<script src="js/jquery.equalheights.js" type="text/javascript"></script>
<!--[if lt IE 9]><script type="text/javascript" src="js/html5.js"></script><![endif]-->
</head>
<body id="page1">
<!--==============================header=================================-->
<header>
  <div class="row-top">
    <div class="main">
      <div class="wrapper">
        <h1><a href="index.html">FooD<span>ies</span></a></h1>
        <nav>
          <ul class="menu">
            <li><a href="cashcounter.jsp">Cash Counter</a></li>
            <li><a class="active" href="admin.jsp">Menu</a></li>
          </ul>
        </nav>
      </div>
    </div>
  </div>
  <div class="row-bot">
    <div class="row-bot-bg">
      <div class="main">
        <h2>Impressive Selection <span>for any Occasion</span></h2>
        <!--<div class="slider-wrapper">
          <div class="slider">
            <ul class="items">
              <li> <img src="images/slider-img1.jpg" alt="" /> </li>
              <li> <img src="images/slider-img2.jpg" alt="" /> </li>
              <li> <img src="images/slider-img3.jpg" alt="" /> </li>
            </ul>
          </div>
        </div>-->
		
		
      </div>
    </div>
  </div>
</header>
<!--==============================content================================-->
<section id="content">
  <div class="main">
    <div class="wrapper img-indent-bot">
      <h6 > UPDATE MENU AS:  </h6>
      
      <% int a=Integer.parseInt(request.getParameter("edit"));
            //connection.inum=request.getParameter("b1"); 
            ResultSet rs=null; %>   
            <form action="UpdateMenue" method="get">
             
        <%    rs=connection.st.executeQuery("select * from menu where Item_id="+a);
          while(rs.next() )
          {
              
          
           %>
                <b><h1><font color="purple">ITEM Name</font></h1></b>
               
                
                        <input type="text" name="name" value="<%out.print(rs.getString("Item_name"));%>"/>
                        <br><b><h1><font color="purple">ITEM previous price:</font></h1></b> <%out.print(rs.getString("Item_price"));%>
                <br> 
                <b><h1><font color="purple">ITEM new price</font></h1></b>
                <input type="number" name="price" >
                <input type="hidden" name="Item_id" value="<%= request.getParameter("edit") %>" >
                 <b><input type="submit"  value="Submit" name="submit" /></b> 
                 
                <%
                               }%>
            
        </form> 
      
      
      
      
      
	  
	  </div>
  </div>
</section>
<!--==============================footer=================================-->
<footer>
  <div class="main">
    <div class="aligncenter"> <span>Copyright &copy; <a href="#">Domain Name</a> All Rights Reserved</span> Design by <a target="_blank" href="http://uietkuk.org/">UIETians</a> </div>
  </div>
</footer>
<script type="text/javascript">Cufon.now();</script>
<script type="text/javascript">
$(window).load(function () {
    $('.slider')._TMS({
        duration: 1000,
        easing: 'easeOutQuint',
        preset: 'slideDown',
        slideshow: 7000,
        banners: false,
        pauseOnHover: true,
        pagination: true,
        pagNums: false
    });
});
</script>
</body>
</html>
