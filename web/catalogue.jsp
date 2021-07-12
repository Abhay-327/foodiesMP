

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@  page import="com.*"%>
<%@  page import="java.sql.*"%>
<%@  page import="java.util.*"%>
<%!
private FoodDb foodDb;
public void jspInit(){
foodDb =(FoodDb)getServletContext().getAttribute("examples.bookstore.database");
			if (foodDb == null) {
        		foodDb = FoodDb.instance();
				
                  getServletContext().setAttribute("examples.bookstore.database", foodDb);
        }		
    }
 %>

<% Connection con1=(Connection)dbconnect.getConnect();
         Statement st=con1.createStatement();
            ResultSet rs=st.executeQuery("select * from menu");
  
   
   int arr[]=new int[75];
   int arr1[]=new int[75];
   int i=1;
   while(rs.next()){
       arr1[i]=rs.getInt(1);
        arr[i]=rs.getInt(3);
       i=i+1;
   }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Foodies | Specials</title>
<meta charset="utf-8">
<link rel="stylesheet" href="css/reset.css" type="text/css" media="screen">
<link rel="stylesheet" href="css/style.css" type="text/css" media="screen">
<link rel="stylesheet" href="css/layout.css" type="text/css" media="screen">
<link rel="stylesheet" href="css/prettyPhoto.css" type="text/css" media="screen">
<script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="js/cufon-yui.js" type="text/javascript"></script>
<script src="js/cufon-replace.js" type="text/javascript"></script>
<script src="js/Dynalight_400.font.js" type="text/javascript"></script>
<script src="js/FF-cash.js" type="text/javascript"></script>
<script src="js/jquery.prettyPhoto.js" type="text/javascript"></script>
<script src="js/hover-image.js" type="text/javascript"></script>
<script src="js/jquery.easing.1.3.js" type="text/javascript"></script>
<script src="js/jquery.bxSlider.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function () {
    $('#slider-2').bxSlider({
        pager: true,
        controls: false,
        moveSlideQty: 1,
        displaySlideQty: 4
    });
    $("a[data-gal^='prettyPhoto']").prettyPhoto({
        theme: 'facebook'
    });
});
</script>
<!--[if lt IE 9]><script type="text/javascript" src="js/html5.js"></script><![endif]-->
</head>
<body id="page3">
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
            <li><a class="active" href="catalogue.jsp">Specials </a></li>
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
          <h2><span>OUR SPECIALS</span></h2>
        </div>
      </div>
    </div>
  </header>
<!--==============================content================================-->
<%
 ShoppingCart cart = (ShoppingCart)session.getAttribute("examples.bookstore.cart");
 if (cart == null) {
            cart = new ShoppingCart();
            session.setAttribute("examples.bookstore.cart", cart);
        }
String foodId = request.getParameter("ADD");
        if (foodId != null) {
            FoodDetail food = foodDb.getFoodDetail(foodId);
            cart.add(foodId, food);
			String a=food.getName();
			%>
			<p><h3><font color=\"#ff0000\">You just added <i><%=a%></i> to your shopping cart.</font></h3>
			<%
			}
			 
	
%>
                        <p align="center"><a href='showcart.jsp'><img src="images/cart.png" alt="cart" width=50" height="50"/></a> 
<section id="content">
  <div class="main">
    <div class="container">
      <h3 align="center" class="prev-indent-bot">Specials</h3>
      <div id="slider-2">
        <div>
          <div class="p4">
            <figure><img src="img2.jpeg" alt=""></a></figure>
            <h5>Cheese Burger </h5>
            <p class="p1">A Hamburger topped with cheese  and include toppings,such as lettuce,<br>
              tomato,mustard and mayonnaise</p>
            <p class="p2"><strong class="color-2">Price: <%= arr[1]%></strong></p>
            <a href='catalogue.jsp?ADD=<%=arr1[1]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a> </div>
          <figure><img src="img3.jpeg" alt=""></a></figure>
          <h5>Sandwich </h5>
          <p class="p1">Consisting of vegetables,sliced cheese,placed between slices of bread and having cheese,lettuce and tomato.<br>
            </p>
          <p class="p2"><strong class="color-2">Price: <%= arr[2]%></strong></p>
         <a href='catalogue.jsp?ADD=<%=arr1[2]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a> </div>
        <div>
          <div class="p4">
            <figure><img src="img4.jpeg" alt=""></figure>
            <h5>Chow mein</h5>
            <p class="p1">Contains deep-fried crunchy golden noodles,green peppers,pea pods,water chestnuts, shrimp.</p>
            <p class="p2"><strong class="color-2">Price: <%= arr[3]%></strong></p>
            <a href='catalogue.jsp?ADD=<%=arr1[3]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a> </div>
          <figure><img src="img5.jpeg" alt=""></figure>
          <h5>Hotdog</h5>
          <p class="p1"> Grilled or steamed and served in a partially sliced bun as a sandwich<br>with cheese</p>
          <p class="p2"><strong class="color-2">Price: <%= arr[4]%></strong></p>
          <a href='catalogue.jsp?ADD=<%=arr1[4]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a> </div>
        <div>
          <div class="p4">
            <figure><img src="img6.jpeg" alt=""></figure>
            <h5>Samosa</h5>
            <p class="p1"> Fried or baked dish with a savoury filling,such as spiced potatoes, onions, peas<br>
              </p>
            <p class="p2"><strong class="color-2">Price: <%= arr[5]%></strong></p>
            <a href='catalogue.jsp?ADD=<%=arr1[5]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a> </div>
          <figure><img src="img7.jpeg" alt=""></figure>
          <h5>Chilli Potato</h5>
          <p class="p1">A chinese recipe Filed in Appetizers<br>and snacks, served with red chilli<br>sauce.
            </p>
          <p class="p2"><strong class="color-2">Price: <%= arr[6]%></strong></p>
          <a href='catalogue.jsp?ADD=<%=arr1[6]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a> </div>
        <div>
          <div class="p4">
            <figure><img src="img8.jpeg" alt=""></figure>
            <h5>Masala Dosa</h5>
            <p class="p1">Stuffed dosa with a lightly cooked filling of potatoes, fried onions and spices<br>with sambhar</p>
            <p class="p2"><strong class="color-2">Price: <%= arr[7]%></strong></p>
            <a href='catalogue.jsp?ADD=<%=arr1[7]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a> </div>
          <figure><img src="img9.jpeg" alt=""></figure>
          <h5>White Sauce Pasta</h5>
          <p class="p1">Enjoy the penne pasta tossed in white sauce in this delightful Penne in white sauce recipe.</p>
          <p class="p2"><strong class="color-2">Price: <%= arr[8]%></strong></p>
          <a href='catalogue.jsp?ADD=<%=arr1[8]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a> </div>
        <div>
          <div class="p4">
            <figure><img src="img10.jpeg" alt=""></figure>
            <h5> Malai Chap </h5>
            <p class="p1">Small pieces of soya baked using skewers in a clay oven after marinating in spices<br>
              </p>
            <p class="p2"><strong class="color-2">Price: <%= arr[9]%></strong></p>
            <a href='catalogue.jsp?ADD=<%=arr1[9]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a> </div>
          <figure><img src="img1.jpeg" alt=""></figure>
          <h5> Pizza </h5>
          <p class="p1">Yeasted flatbread generally topped with tomato sauce and cheese and baked in an oven<br>
            </p>
          <p class="p2"><strong class="color-2">Price: <%= arr[10]%></strong></p>
          <a href='catalogue.jsp?ADD=<%=arr1[10]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a> </div>
        <div>
          <div class="p4">
            <figure><img src="img11.jpeg" alt=""></figure>
            <h5>Uttapam</h5>
            <p class="p1">The dal and rice are subsequently ground and fermented.The surface is crisp and the inner layers are like idli.</p>
            <p class="p2"><strong class="color-2">Price: <%= arr[11]%></strong></p>
            <a href='catalogue.jsp?ADD=<%=arr1[11]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a> </div>
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
<script type="text/javascript">Cufon.now();</script>
</body>
</html>

