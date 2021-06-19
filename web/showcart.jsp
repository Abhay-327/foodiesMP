<%@ page import="java.sql.*,com.*, java.util.*" %>
<%!
private FoodDb foodDB;
public void jspInit(){
foodDB =(FoodDb)getServletContext().getAttribute("examples.bookstore.database");
			if (foodDB == null) {
                            
        		foodDB = foodDB.instance();
                  getServletContext().setAttribute("examples.bookstore.database", foodDB);
        }		
    }
 %>

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
<script type="text/javascript">
      function check(){
        var x=document.first.nam.value;
        var y=document.first.pass.value;
        if((x==="ravi")&&(y==="1234")) 
        {  
            alert("you are sucessfully login");
           return true;
        }
        else
        {
            alert("Please enter correct username and password");
        return false;
        }
    }
        </script>

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
        <h2><span>Your Cart</span></h2>
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
 
        
 <%
  ShoppingCart cart = (ShoppingCart)session.getAttribute("examples.bookstore.cart");
  if (cart == null) {
            cart = new ShoppingCart();
            session.setAttribute("examples.bookstore.cart", cart);
   }
    String foodId =request.getParameter("Remove");
        if (foodId != null) {
            cart.remove(foodId);
                  
              FoodDetail food = foodDB.getFoodDetail(foodId);
				%>
				 <font color=\"#ff00000\" size=\"+2\">
                                          You just removed: <strong> <%=food.getName()%>
                                          </strong> <br> &nbsp; <br>
                                          </font>
										  <%
										  }
										  else if (request.getParameter("Clear") != null) {
            cart.clear();
            %>
			 <font color=\"#ff0000\" size=\"+2\"><strong> 
                        You just cleared your shopping cart! 
                        </strong> <br>&nbsp; <br> </font>
						<%
						}
 int num = cart.getNumberOfItems();
        if (num > 0) {
		%>
		<font size="2">You have <%=num%> items in your Shopping Cart</font><br>
		<table >
		<tr>
		<th align="left">Quantity</th>
		<th align="left">Name</th>
		<th align="left">Price</th>
		</tr>
		<%
		 Iterator i = cart.getItems().iterator();
                 String str="";
            while (i.hasNext()) {
                ShoppingCartItem item = (ShoppingCartItem) i.next();
                FoodDetail foodDetails = (FoodDetail) item.getItem();
                %>
				<tr>
                   <td align="center" bgcolor=\"#ffffff\"> 
                           <%= item.getQuantity() %>
                            </td> 

                            <td bgcolor=\"#ffffaa\"> 
                            <strong>
                                          
                             <%=foodDetails.getName() %> </a</strong> 
                            </td> 
                           
                            <%  int k = item.getQuantity();
                                String str1= Integer.toString(k) + " " ;
                                String str2=str1 + foodDetails.getName();
                                String str3=str2 + " , ";
                               str  +=  str3 ; %>
                            <td bgcolor=\"#ffffaa\" align="right"> 
                           <%= foodDetails.getPrice() %>_</td> 

                           <td bgcolor=\"#ffffaa\"> 
                            <strong> 
                            <a href='showcart.jsp?Remove=<%=foodDetails.getS_no()%>'> Remove Item</a></strong> 
                            </td></tr>
							<%
							}
                                    
							%>
                                                        <% session.setAttribute("list",str); %>
                               
							 <tr><td colspan=\"6\" bgcolor=\"#ffffff\">
                        <br></td></tr>

                         <tr> 
                        <td colspan=\"2\" align="center" 
                        bgcolor="yellow"> 
                        Total:</td> 
                        <td bgcolor=\"#ffffaa\" align=\"center\"></td>
                        <td bgcolor="yellow" align=\"center\"> 
                    <%=   cart.getTotal()%>/-</td> 
                        </td><td><br></td></tr></table>

           
           
            <p> &nbsp; <p><strong><a href=
                        'menu.jsp'>
                        Continue Shopping</a> &nbsp; &nbsp;  
                        
                        <a href='
                        cashier.jsp'> 
                        Check Out</a> &nbsp; &nbsp; 
                        
                        <a href='showcart.jsp?Clear=clear'>
                        Clear Cart</a></strong>
						<%
        }
		else {
%>
           
           <font size=\"+2\">
                        There is nothing in your shopping cart.</font> 
                        <br> &nbsp; <br> 
                        <center><a href='menu.jsp'>
                        Back to the menu</a> </center>
						<%
        }
%>
        
       
        
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
