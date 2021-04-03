<%-- 
    Document   : cashcounter
    Created on : 20 Apr, 2017, 10:39:33 AM
    Author     : RAVI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.connection"%>
<%@page import="com.*" %>
<%@page import="java.sql.*"%>

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
            <li><a class="active" href="index.html">Home</a></li>
            <li><a href="index.html">Menu</a></li>
            <li><a href="catalogue.jsp">Catalogue </a></li>
            
            
            <li><a href="contact.html">Contact</a></li>
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
      <h5 align="center"> WELCOME  CASHIER  </h5>
	    
         
      <div id="columnA">
        <h5 align="center">CUSTOMER LIST FOR YOU TO ACCEPT PAYMENT</h5>
       <!-- <form action="OrderStatus">
            -->
      <div class="content bg1" align="center">
          <table align="center" class="table">
            <%! ResultSet rs=null;%>
            <tr>
                    <td bgcolor="black"  width="43 height="40"><b><font color="yellow">NAME</font></b></td>
                    <td bgcolor="black" width="120" height="40"><b><font color="yellow">TRANSACTION ID</font></b></td>
                    <td bgcolor="black" width="120" height="40"><b><font color="yellow">DATE</font></b></td>
                    <td bgcolor="black" width="78" height="40"><b><font color="yellow">AMOUNT TO PAY</font></b></td>
                   <td bgcolor="black" width="83" height="40"><b><font color="yellow">Click to COMPLETE PAYMENT  </font></b></td>
                </tr>
           
            
                
        
            
                 <%
                   new connection();
                   try{
                   rs=connection.st.executeQuery("select * from cashier ORDER BY s_no DESC;");
                   while(rs.next())
                                         {
                %>
       <tr> <form action="check.jsp"><td bgcolor="ffb3d1" width="100"><b><font color="purple">
                    <%
                   out.print(rs.getString("name"));
                    %></font></td>
                    <td bgcolor="#1aff8c" width="280" ><font color="red">
                            <%out.print(rs.getString("transaction"));%></font></td>
                    <td bgcolor="#1aff8c" width="280" ><font color="red">
                            <%out.print(rs.getString("date"));%></font></td>
                   
                    <td  bgcolor="yellow" width="180"><b><font color="">
                                <%out.print(rs.getInt("total"));%></font></b></td>
                         
             
                    <%if(rs.getString("status").equals("Unpaid")){%>
                    
     
          <td bgcolor="ffb3d1"><input type="submit" value="PAY"></td>
                  
           <td><input type="hidden" value="<%out.print(rs.getString("transaction"));%>" name="trans">
          </td>
         <% }
            else{%>
               <td bgcolor="ffb3d1"><p>Paid</p></td>
                       <%}%>
          <!--  <td bgcolor="ffb3d1"><input type="submit"  name="edit" value="<%
                //   out.print(rs.getString("transaction"));
                    
                   
                   %>" /></b></td> -->
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
      
	  
	  
	  </div>
  </div>
</section>
<!--==============================footer=================================-->
<footer>
  <div class="main">
    <div class="aligncenter"> <span>Copyright &copy; <a href="#">Domain Name</a> All Rights Reserved</span> Design by <a target="_blank" href="http://uietkuk.org/">UIETians</a> </div>
  </div>
</footer>
 
</body>
</html>
