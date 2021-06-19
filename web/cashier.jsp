<%@ page import="java.sql.*,java.util.*,com.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
     <script type="text/javascript">
      function check(){
        var x=document.first.name.value;
        var y=document.first.phone.value;
        var z=document.first.email.value;
        var str= y.toString();
        
        var k = str.length;
        
        if((x==="")&&(z==="")&&(k<10)&&(k>10)) 
        {  
            alert("Please enter right details");
           return false;
        }
        else
        {
            alert("You can proceed");
        return true;
        }
    }
        </script>

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
        <h2><span>submit your details </span></h2>
        </div>
      </div>
    </div>
  </header>
<!--==============================content================================-->
<section id="content">
  <div class="main">
    <div class="wrapper img-indent-bot">
<%
 ShoppingCart cart =
            (ShoppingCart)session.getAttribute("examples.bookstore.cart");
			if (cart == null) {
            cart = new ShoppingCart();
            session.setAttribute("examples.bookstore.cart", cart);
   			}
			int total = cart.getTotal();
                        session.setAttribute("total", total);
                        
                        
		 Iterator i = cart.getItems().iterator();
                 String str="";
            while (i.hasNext()) {
                ShoppingCartItem item = (ShoppingCartItem) i.next();
                FoodDetail foodDetails = (FoodDetail) item.getItem();
                int k = item.getQuantity();
                                String str1= Integer.toString(k) + " " ;
                                String str2=str1 + foodDetails.getName();
                                String str3=str2 + " , ";
                               str  +=  str3 ;
                               session.setAttribute("list",str);
            }
			%>
			 <p>Your total purchase amount is:
                    <strong> <b><%= total%> </b></strong> 
                    <p>To purchase the items in your shopping cart, 
                     please provide us with the following information:

                    <form name="first" target="_self" action="delivery.jsp" method="post" autocomplete="off" onsubmit="return check()">
                    

                    <table> 
                    <tr> 
                    <td><strong>Name:</strong></td> 
                    <td><input type="text" name="name"
                     size="30" pattern="^[A-Za-z \s*]+$" required="required" ></td> 
                    </tr>

                    <tr>
                    <td><strong>Phone Number:</strong></td> 
                    <td>
                    <input type="text" name="phone" 
                           size="30" maxlength="10" pattern="[0-9]{3}[0-9]{3}[0-9]{4}" placeholder="10 digits" required="required"></td> 
                    </tr>
                    
                    <tr>
                    <td><strong>Email:</strong></td> 
                    <td>
                    <input type="text" name="email" 
                           size="30" required="required"></td> 
                    </tr>
                    
                    

                    <tr>
                    <td></td>
                    <td><input type="submit" value="Submit Information"></td> 
                    </tr>

                    </table>
                    </form>
	  
	  
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
