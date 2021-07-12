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
    <style>
td {
  border: 2px solid; 
}

</style>
<title>Foodies | CashCounter</title>
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
            <li><a class="active" href="cashcounter.jsp">Cash Counter</a></li>
            <li><a href="admin.jsp">Menu</a></li>
            <li><a href="admin.html">Logout</a></li>
          </ul>
        </nav>
      </div>
    </div>
  </div>
  <div class="row-bot">
   
  </div>
</header>
<!--==============================content================================-->
<section id="content">
  <div class="main">
    <div class="wrapper img-indent-bot">
     
	    
         
      <div>
       
       <!-- <form action="OrderStatus">
            -->
      <div align="center">
        
          <table align="center">
            <%! ResultSet rs=null;%>
            
            <tr>
                    <td align="center" bgcolor="black"  width="43" height="40"><b><font color="yellow">NAME</font></b></td>
                    <td align="center" bgcolor="black"  width="43" height="40"><b><font color="yellow">PHONE</font></b></td>
                    <td align="center" bgcolor="black" width="50" height="40"><b><font color="yellow">TRANSACTION ID</font></b></td>
                    <td align="center" bgcolor="black"  width="43" height="40"><b><font color="yellow">ADDRESS</font></b></td>
                    <td align="center" bgcolor="black"  width="43" height="40"><b><font color="yellow">TABLE</font></b></td>
                    <td align="center" bgcolor="black" width="250" height="40"><b><font color="yellow">LIST</font></b></td>
                    <td align="center" bgcolor="black" width="78" height="40"><b><font color="yellow">AMOUNT TO PAY</font></b></td>
                    <td align="center" bgcolor="black" width="120" height="40"><b><font color="yellow">DATE</font></b></td>
                    <td align="center" bgcolor="black" width="83" height="40"><b><font color="yellow">Click to COMPLETE PAYMENT  </font></b></td>
                    <td align="center" bgcolor="black" width="83" height="40"><b><font color="yellow">Click to COMPLETE DELIVERY  </font></b></td>
                </tr>
                
           
            
                
        
            
                 <%
                   new connection();
                   try{
                   rs=connection.st.executeQuery("select c.name,c.phone,p.transaction,c.address,c.table_no,o.list,p.total,p.date,p.status,o.order_status from customer c, payments p, orders o where p.cust_id=c.cust_id and p.cust_id=o.cust_id order by p.cust_id DESC;");
                   while(rs.next())
                                         {
                %>
                <tr> <form action="check.jsp">
           <td bgcolor="ffb3d1" width="300" align="center"><b><font color="purple"><%out.print(rs.getString("name"));%></font></td>
           <td bgcolor="yellow" width="100" align="center"><b><font color="red"><%out.print(rs.getString("phone"));%></font></td>
           <td bgcolor="#1aff8c" width="70" align="center"><font color="red"><%out.print(rs.getString("transaction"));%></font></td>
           <td bgcolor="ffb3d1" width="250" align="center"><b><font color="purple"><%out.print(rs.getString("address"));%></font></td>
           <td bgcolor="yellow" width="100" align="center"><b><font color="red"><%out.print(rs.getString("table_no"));%></font></td>
           <td bgcolor="#1aff8c" width="350"><font color="red"><%out.print(rs.getString("list"));%></font></td>
           <td  bgcolor="ffb3d1" width="50" align="center"><b><font color="purple"><%out.print(rs.getInt("total"));%></font></b></td>
           <td bgcolor="yellow" width="400" align="center"><font color="red"><%out.print(rs.getString("date"));%></font></td>
           
           <%if(rs.getString("status").equals("unpaid"))
           {%>
           <td bgcolor="#1aff8c" align="center"><input type="submit" value="PAY"></td>
           <td><input type="hidden" value="<%out.print(rs.getString("transaction"));%>" name="trans1"></td>
            <% }
            else{%>
               <td bgcolor="#1aff8c" align="center"><p>Paid</p></td>
                       <%}%>
                      
                       
          <!--  <td bgcolor="ffb3d1"><input type="submit"  name="edit" value="<%
                //   out.print(rs.getString("transaction"));
                    
                   
                   %>" /></b></td> -->
         <!--           <td bgcolor="#ffb3d1" > <b><font color="purple">
                            Click to Deliver</font></b>
                    </td>
         -->  </form> 
         <form action="check_1.jsp">
             <%if(rs.getString("order_status").equals("pending"))
            {%>
            <td bgcolor="ffb3d1" align="center"><input type="submit" value="Deliver"></td>
           <td><input type="hidden" value="<%out.print(rs.getString("transaction"));%>" name="trans"></td>
         <% }
            else{%>
               <td bgcolor="ffb3d1" align="center"><p>Delivered</p></td>
                       <%}%>
         </form>
                </tr>
            
                <% }
                   
                                     }
                   catch(Exception e)
                                                     {
                       out.print(e);
                   }
                   %>
                                
        </table>
          <br><br>
          

      </div>
      
	  
	  
	  </div>
  </div>
</section>
<!--==============================footer=================================-->
<footer>
  <div class="main">
      <div class="aligncenter"> <span>Copyright &copy; 2021 <a href="#">Foodies</a> All Rights Reserved</span> Design by <a target="_blank" href="https://iitmjp.ac.in/">IINTMians</a> </div>
  </div>
</footer>
 
</body>
</html>
