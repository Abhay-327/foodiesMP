<%@ page import="java.sql.*,java.util.*,com.*,javax.servlet.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
     <script type="text/javascript">
      function yesnoCheck() {
    if (document.getElementById('hCheck').checked) {
        document.getElementById('home').style.visibility = 'visible';
        document.getElementById('dinein').style.visibility = 'hidden';
        document.getElementById('note').style.visibility = 'hidden';
        document.getElementById("table").value = "";
        
    }
    if (document.getElementById('tCheck').checked) {
        document.getElementById('dinein').style.visibility = 'visible';
        document.getElementById('note').style.visibility = 'visible';
        document.getElementById('home').style.visibility = 'hidden';
        document.getElementById("add").value = "";
    }
    if (document.getElementById('tCheck').checked) {
        document.getElementById('dinein').style.visibility = 'visible';
        document.getElementById('note').style.visibility = 'visible';
        document.getElementById('home').style.visibility = 'hidden';
        document.getElementById("add").value = "";
    }
   
}

        </script>
<% 
                    String name=request.getParameter("name");  
                 String phone=request.getParameter("phone");
                 String email=request.getParameter("email");
                    session.setAttribute("Name",name);
                    session.setAttribute("Phone",phone);
                    session.setAttribute("Email",email);
                    
       
       %>
<title>delivery</title>
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
            <li><a href="index.html">Home</a></li>
            <li><a href="menu.jsp">Menu</a></li>
            <li><a href="catalogue.jsp">Specials </a></li>
            <li><a href="faq.html">FAQ </a></li>
            <li><a href="contact.html">Contact</a></li>
          </ul>
        </nav>
      </div>
    </div>
  </div>
  <div class="row-bot">
    <div class="row-bot-bg">
      <div class="main">
        <h2><span>Please select your delivery option</span></h2>
        </div>
      </div>
    </div>
  </header>
<!--==============================content================================-->
<section id="content">
  <div class="main">
    <div class="wrapper img-indent-bot">
        
        
        

                    <form name="second" target="_self" action="payment_1.jsp" method="post" autocomplete="off">
                    

                    <table> 
                    <tr> 
                    <td><strong>Home Delivery</strong> <input type="radio" onclick="yesnoCheck()" name="del" id="hCheck">
                    </td>
                    </tr>

                    <tr> 
                    <td><strong>dine in</strong> <input type="radio" onclick="yesnoCheck()" name="del" id="tCheck">
                    </td>
                    </tr>
                    
                   <tr>
                    <td><div id="home" style="visibility:hidden">
                            Address<input type='text' id='add' name='address' value="" ><br>
                     
                        </div></td>
                   </tr>
                   <tr>
                       <td>
                    <div id="dinein" style="visibility:hidden">
                        Table no. <input type="number" min="1" max="20" id='table' name='table' maxlength="2" pattern="^[0-9]+$" value="" placeholder="1-20">
                     </div></td>
                   </tr>
                    <tr>
                  
                    <td><input type="submit"
                    value="Submit Information" onclick="checkt()"></td> 
                    </tr>

                    </table>
                    </form>
        <br><br>
        <h5 style="visibility:hidden" id='note'>*note enter the table no. shown on the placard placed on your table</h5>
    </div> 
  </div>
</section>
<!--==============================footer=================================-->
<footer>
  <div class="main">
      <div class="aligncenter"> <span>Copyright &copy; 2021 <a href="#">Foodies</a> All Rights Reserved</span> Design by <a target="_blank" href="https://iitmjp.ac.in/">IINTMians</a> </div>
  </div>
</footer>
<!--<script type="text/javascript">Cufon.now();</script>
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
</script> -->
</body>
</html>
