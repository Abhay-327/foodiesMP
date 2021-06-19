<%-- 
    Document   : catalogue
    Created on : 9 Apr, 2017, 4:24:48 PM
    Author     : RAVI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.connection"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Foodies | Menu</title>
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
            <li><a href="admin.html">Logout</a></li>
          </ul>
        </nav>
      </div>
    </div>
  </div>
  <div class="row-bot">
   
</header>
<!--==============================content================================-->
<section id="content">
  <div class="main">
    <div align="center" class="wrapper img-indent-bot">
        
	
          <table align="center" class="table">
            <%! ResultSet rs=null;%>
            <tr>
                    <td bgcolor="black"  width="43" height="40" align="center"><b><font color="yellow"> serial No</font></b></td>
                    <td bgcolor="black" width="120" height="40" align="center"><b><font color="yellow">food name</font></b></td>
                    <td bgcolor="black" width="43" height="40" align="center"><b><font color="yellow">price</font></b></td>
                   <td bgcolor="black" width="83" height="40" align="center"><b><font color="yellow">Click to edit price  </font></b></td>
                </tr>
           
            
                
        
            
                 <%
                   new connection();
                   try{
                   rs=connection.st.executeQuery("select * from menu");
                   while(rs.next())
                                         {
                %>
       <tr> <form action="updatemenu.jsp"><td align="center" bgcolor="ffb3d1" width="60"><b><font color="purple">
                    <%
                   out.print(rs.getInt("item_id"));
                    %></font></td>
                    <td bgcolor="#1aff8c" width="280" ><font color="red">
                            <%out.print(rs.getString("Item_name"));%></font></td>
                    <td  align="center" bgcolor="yellow" width="50"><b><font color="">
                                <%out.print(rs.getInt("Item_price"));%></font></b></td>
                   
                    <td align="center" width="50" bgcolor="ffb3d1"><input type="submit"  name="edit" value="<% out.print(rs.getInt("item_id"));%>" /></b></td>
         <!--           <td bgcolor="#ffb3d1" > <b><font color="purple">
                            Click to Deliver</font></b>
                    </td>
         -->  </form> </tr>
            
                <% }
                   
                                     }
                   catch(Exception e)
                                                     {
                       out.print(e);
                   }
                   %>
                                
        </table>
          
      

     
      
	  
	  
	 
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
