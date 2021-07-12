

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <script type="text/javascript">
      
     function printPageArea(areaID){
    var printContent = document.getElementById(areaID);
    var WinPrint = window.open('', '', 'width=900,height=650');
    WinPrint.document.write(printContent.innerHTML);
    WinPrint.document.close();
    WinPrint.focus();
    WinPrint.print();
    WinPrint.close();
}
        </script>
    <%  String name = (String) session.getAttribute("Name");
            int total =  (int) session.getAttribute("total");
            String transaction = (String) session.getAttribute("transaction");
            String phone=(String)session.getAttribute("Phone");
            String email=(String)session.getAttribute("Email");
            String address=(String)session.getAttribute("Address");
            String tableno=(String)session.getAttribute("Table");
            String list=(String)session.getAttribute("list");
            String date=(String)session.getAttribute("date");
            String status=(String)session.getAttribute("status");
           %>
    <head>
       <title>Thank You</title>
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
        
        
    </head>
    <body id="page1">
        <!--==============================header=================================-->
<header>
  <div class="row-top">
    <div class="main">
      <div class="wrapper">
        <h1><a href="index.html">FooD<span>ies</span></a></h1>
      </div>
    </div>
  </div>
  <div class="row-bot">
    <div class="row-bot-bg">
      <div class="main">
          <h2><span>Thank for your visit <%= name %>....<br>Hope you visit again</span></h2>
        </div>
      </div>
    </div>
  </header>
<!--==============================content================================-->
<section id="content">
  <div class="main">
    <div class="wrapper img-indent-bot">
      
           
        
        
  <div id="pr">        
        <%if(tableno.equals(""))
            tableno="--";
            if(address.equals(""))
            address="--";
        %>
        <h3> Please note down your transaction id i.e <%= transaction %> </h3>
        <br>
        <%if(tableno.equals("--"))
        out.println("<h3>your order will be delivered within 45 minutes.</h3>");
        else   
            out.println("<h3>your order will be delivered within 15 minutes.</h3>");
        %>
      
        <style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 50%;
  margin-left: auto;
  margin-right: auto;
}

td {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 15px;
}
th {
  border: 1px solid #dddddd;
  text-align: center;
  padding: 8px;
  
 
}
   button {
     margin: 0;
  position: absolute;
  top: 90%;
  left: 50%;
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
    
}

tr:nth-child(even) {
  background-color: #dddddd;
}
 
 
</style>

        <table>
        
        <tr align='center'><th align=center colspan="2" style="font-size:20px">Receipt</th></tr>
        <tr><td>Name</td><td><%out.print(" "+name);%></td></tr>
        <tr><td>Phone no.</td><td><%out.print(" "+phone);%></td></tr>
        <tr><td>E-mail</td><td><%out.print(" "+email);%></td></tr>
        <tr><td>address</td><td><%out.print(" "+address);%></td></tr>
        <tr><td>Table no.</td><td><%out.print(" "+tableno);%></td></tr>
        <tr><td>Transaction ID</td><td><%out.print(" "+transaction);%></td></tr>
        <tr><td>Total amt</td><td><%out.print(" "+total);%></td></tr>
        <tr><td>Date</td><td><%out.print(" "+date);%></td></tr>
        <tr><td>Status</td><td><%out.print(" "+status);%></td></tr>
        <tr><td>Order List</td><td><%out.print(" "+list);%></td></tr>
    </table>
</div>
    <br>
    <button onclick="printPageArea('pr')">Print Receipt</button>
   
     
     
         <%//session.invalidate(); %>
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
