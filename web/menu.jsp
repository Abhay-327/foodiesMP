<%-- 
    Document   : menu
    Created on : 9 Apr, 2017, 4:25:30 PM
    Author     : Ayush
--%>

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
  
   int arr[]=new int[100];
   int arr1[]=new int[100];
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
<script src="js/jquery.equalheights.js" type="text/javascript"></script>
<script src="js/jquery.bxSlider.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function () {
    $('#slider').bxSlider({
        pager: true,
        controls: false,
        moveSlideQty: 1,
        displaySlideQty: 3
    });
});
</script>
<!--[if lt IE 9]><script type="text/javascript" src="js/html5.js"></script><![endif]-->
</head>
<body id="page2">
<!--==============================header=================================-->
<header>
  <div class="row-top">
    <div class="main">
      <div class="wrapper">
        <h1><a href="index.html">FooD<span>ies</span></a></h1>
        <nav>
          <ul class="menu">
            <li><a href="index.html">Home</a></li>
            <li><a class="active" href="menu.jsp">Menu</a></li>
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
          <h2><span>MENU</span></h2>
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
                    <p align="center"><a href='showcart.jsp'><img src="images/cart.png" alt="cart" width="50" height="50"/></a>      
<section id="content">
    <div class="main">
    <div class="wrapper">
        
      <article class="col-1">
          <ul class="">
              <li><h3 align="center">Appetizers</h3>
                   
        <ul class="price-list p2">
            <li><span><a href='menu.jsp?ADD=<%=arr1[13]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[13]%> ₹ </span><b>Samosa Chat (cold)</b><br><p>Mouth watering combination of crispy vegetable turnover and chickpeas tossed in yogurt and topped with sweet and sour condiments</p></li>
            
            <li><span><a href='menu.jsp?ADD=<%=arr1[14]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
               <span><%= arr[14]%> ₹ </span><b>Papri Chat(cold)</b><br><p>Combination of crispy wafers, potatoes and chickpeas tossed in yogurt and topped with sweet and sour condiments</p></li>

           <li><span><a href='menu.jsp?ADD=<%=arr1[15]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
               <span><%= arr[15]%> ₹ </span><b>Vegetable Samosa</b><br><p>Crispy deep fried vegetable turnover stuffed with green peas and potatoes </p></li>

           <li><span><a href='menu.jsp?ADD=<%=arr1[16]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
               <span><%= arr[16]%> ₹ </span><b>Vegetable Pakora </b><br><p>A delicious spiced combination of assorted vegetables; Fritters of chopped spinach, onions, potatoes and cauliflower in chickpea batter</p></li>

           <li><span><a href='menu.jsp?ADD=<%=arr1[17]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
               <span><%= arr[17]%> ₹ </span><b>Vegetable Tikki </b><br><p>Shallow fried patties made of potatoes and mixed vegetables (peas, corn, green beans and carrots)</p></li>

           <li><span><a href='menu.jsp?ADD=<%=arr1[18]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
               <span><%= arr[18]%> ₹ </span><b>Paneer Pakora </b><br><p>Fritters of homemade cottage cheese cubes in chickpea batter</p></li>

           <li><span><a href='menu.jsp?ADD=<%=arr1[19]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
               <span><%= arr[19]%> ₹ </span><b>Vegetable Momo (6 pcs)</b><br><p>Himalayan style fried dumplings served with spicy tomato sauce</p></li>
           
            </ul></li>



            <li><h3 align="center">Breads</h3>
                    <ul class="price-list p2">
            <li><span><a href='menu.jsp?ADD=<%=arr1[20]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[20]%> ₹ </span><b>Tandoori Roti </b><br><p>Whole wheat bread baked in clay tandoor</p></li>

            <li><span><a href='menu.jsp?ADD=<%=arr1[21]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[21]%> ₹ </span><b>Paratha</b><br><p>Layered whole wheat pan fried bread with butter</p></li>

            <li><span><a href='menu.jsp?ADD=<%=arr1[22]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[22]%> ₹ </span><b>Alu Parantha</b><br><p>Layered whole wheat deep fried bread stuffed with green peas and potatoes</p></li>

            <li><span><a href='menu.jsp?ADD=<%=arr1[23]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[23]%> ₹ </span><b>Alu Parantha – Traditional </b><br><p>Layered whole wheat bread stuffed with green peas and potatoes and baked on a griddle</p></li>

            <li><span><a href='menu.jsp?ADD=<%=arr1[24]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[24]%> ₹ </span><b>Chapatti</b><br><p>Soft whole wheat bread baked on a griddle</p></li>

            <li><span><a href='menu.jsp?ADD=<%=arr1[25]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[25]%> ₹ </span><b>Poori (2)</b><br><p>Pair of deep fried puffy whole wheat bread</p></li>

            <li><span><a href='menu.jsp?ADD=<%=arr1[26]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[26]%> ₹ </span><b>Nan</b><br><p>Soft flour bread baked in clay tandoor</p></li>

                    </ul></li>





                    <li><h3 align="center">Lunch Special</h3>
                    <ul class="price-list p2">
            <li><span><a href='menu.jsp?ADD=<%=arr1[27]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[27]%> ₹ </span><b>Vegetable Curry  </b><br><p>Mixed vegetables (beans, cauliflower, carrots, mushrooms, peas, potatoes) cooked with Indian herbs and spices</p></li>

            <li><span><a href='menu.jsp?ADD=<%=arr1[28]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[28]%> ₹ </span><b>Chana Masala</b><br><p>Chickpeas cooked with herbs and spices </p></li>

            <li><span><a href='menu.jsp?ADD=<%=arr1[29]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[29]%> ₹ </span><b>Bengan Bhurta</b><br><p>Oven roasted eggplant mashed and cooked with onions, tomatoes, green and red peppers and a variety of spices; a delicacy from Punjab</p></li>

            <li><span><a href='menu.jsp?ADD=<%=arr1[30]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[30]%> ₹ </span><b>Alu Mattar</b><br><p>Green peas cooked with potatoes and spices</p></li>

            <li><span><a href='menu.jsp?ADD=<%=arr1[31]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[31]%> ₹ </span><b>Palak (Saag)<br>(Palak Paneer / Alu Palak / Tofu Palak)</b><br><p>Flavorful blend of spinach cooked in rich gravy with your choice of homemade cottage cheese cubes (Paneer), diced potatoes or tofu cubes</p></li>

            <li><span><a href='menu.jsp?ADD=<%=arr1[32]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[32]%> ₹ </span><b>Paneer Butter Masala</b><br><p>Cubed cheese cooked with onion sauce, tomatoes and bell peppers</p></li>

            <li><span><a href='menu.jsp?ADD=<%=arr1[33]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[33]%> ₹ </span><b>Dal Makhani </b><br><p>Lentils and beans cooked in a creamy butter sauce</p></li>

            </ul></li>




            <li><h3 align="center">Biryani</h3>
                    <ul class="price-list p2">
            <li><span><a href='menu.jsp?ADD=<%=arr1[34]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[34]%> ₹ </span><b>Vegetable Biryani</b><br><p>Aromatic basmati rice cooked with nuts and vegetables</p></li>
            
             <li><span><a href='menu.jsp?ADD=<%=arr1[35]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[35]%> ₹ </span><b>Chicken Biryani</b><br><p>Finest basmati rice cooked with chicken, nuts and with or without vegetables</p></li>
                        
             <li><span><a href='menu.jsp?ADD=<%=arr1[36]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                 <span><%= arr[36]%> ₹ </span><b>Shrimp Biryani</b><br><p>Shrimp sautéed in mixed vegetables, nuts and herbs and mixed with basmati rice</p></li>
             
             <li><span><a href='menu.jsp?ADD=<%=arr1[37]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                 <span><%= arr[37]%> ₹ </span><b>Lamb Biryani</b><br><p>Basmati rice cooked with lamb, nuts and vegetables</p></li>
             
             <li><span><a href='menu.jsp?ADD=<%=arr1[38]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                 <span><%= arr[38]%> ₹ </span><b>Mughalai Biryani</b><br><p>Aromatic basmati rice cooked with sautéed shrimp, lamb, chicken, mixed vegetables, nuts and spices</p></li>
             
            </ul></li>
            
            
            <li><h3 align="center">Soup</h3>
                    <ul class="price-list p2">
            <li><span><a href='menu.jsp?ADD=<%=arr1[39]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[39]%> ₹ </span><b>Mulligatawny Soup </b><br><p>A traditional soup of lentils and vegetables seasoned with delicate herbs</p></li>
            
            <li><span><a href='menu.jsp?ADD=<%=arr1[40]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[40]%> ₹ </span><b>Coconut Soup</b><br><p>Soup made up of shredded coconuts, coconut cream, milk and sprinkled with nuts</p></li> 
            
            <li><span><a href='menu.jsp?ADD=<%=arr1[41]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[41]%> ₹ </span><b>Tomato Soup</b><br><p>A traditional soup of fresh tomatoes and vegetables seasoned with delicate herbs</p></li>
            </ul></li>
            
                      </ul>

                  </article>
                  <article class="col-2">

                    <ul class="">

                        

            
            
            
            
            <li><h3 align="center">Salad</h3>
                    <ul class="price-list p2">
            <li><span><a href='menu.jsp?ADD=<%=arr1[42]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[42]%> ₹ </span><b>Kachumber Salad</b><br><p>Green salad of red onion, green pepper, tomato, cucumber and lettuce tossed with cumin powder, chat masala and lemon juice </p></li> 
            
            <li><span><a href='menu.jsp?ADD=<%=arr1[43]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[43]%> ₹ </span><b>IndianSalad</b><br><p>Fresh slices of red onion, lemons and green chillies</p></li>
            
            </ul></li>

            
            
            
            <li><h3 align="center">Pizza’s</h3>
                    <ul class="price-list p2">
            <li><span><a href='menu.jsp?ADD=<%=arr1[44]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[44]%> ₹ </span><b>Plain Cheese Pizza</b></li>
            
            <li><span><a href='menu.jsp?ADD=<%=arr1[45]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[45]%> ₹ </span><b>Capsicum, Onion, Mushroom Pizza</b></li>
            
            <li><span><a href='menu.jsp?ADD=<%=arr1[46]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[46]%> ₹ </span><b>Tandoori Pizza</b></li>
            
            <li><span><a href='menu.jsp?ADD=<%=arr1[47]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[47]%> ₹ </span><b>Super Veggie Pizza(Double Cheese)</b></li>
            
            </ul></li>

            <li><h3 align="center">Pasta</h3>
                    <ul class="price-list p2">
            <li><span><a href='menu.jsp?ADD=<%=arr1[48]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[48]%> ₹ </span><b>White Sauce Pasta</b></li>
            
            <li><span><a href='menu.jsp?ADD=<%=arr1[49]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[49]%> ₹ </span><b>Red Sauce Pasta</b></li>
            
            <li><span><a href='menu.jsp?ADD=<%=arr1[50]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[50]%> ₹ </span><b>Mix Sauce Pasta</b></li>
            
            </ul></li>

            <li><h3 align="center">Sandwich</h3>
                    <ul class="price-list p2">
            <li><span><a href='menu.jsp?ADD=<%=arr1[51]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[51]%> ₹ </span><b>Plain Sandwich</b></li>
            
            <li><span><a href='menu.jsp?ADD=<%=arr1[52]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[52]%> ₹ </span><b>Grilled Sandwich</b></li>
            
            <li><span><a href='menu.jsp?ADD=<%=arr1[53]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[53]%> ₹ </span><b>Club Sandwich</b></li>
            
            </ul></li>


            <li><h3 align="center">Noodles</h3>
                    <ul class="price-list p2">
            <li><span><a href='menu.jsp?ADD=<%=arr1[54]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[54]%> ₹ </span><b>Veg Hakka Noodles</b></li>
            
            <li><span><a href='menu.jsp?ADD=<%=arr1[55]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[55]%> ₹ </span><b>Chilli Garlic Noodles </b></li>
            
            <li><span><a href='menu.jsp?ADD=<%=arr1[56]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[56]%> ₹ </span><b>Pan Fried Noodles</b></li>
            
            </ul></li>

            <li><h3 align="center">All time favourite</h3>
                    <ul class="price-list p2">
            <li><span><a href='menu.jsp?ADD=<%=arr1[57]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[57]%> ₹ </span><b>French Fries</b></li>
            
            <li><span><a href='menu.jsp?ADD=<%=arr1[58]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[58]%> ₹ </span><b>Chilli Cheese Toast </b></li>
            
            <li><span><a href='menu.jsp?ADD=<%=arr1[59]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[59]%> ₹ </span><b>Garlic Bread with Cheese</b></li>
            
            <li><span><a href='menu.jsp?ADD=<%=arr1[60]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[60]%> ₹ </span><b>Veg Cheese Burger</b></li>
            
            </ul></li>

            <li><h3 align="center">Deserts</h3>
                    <ul class="price-list p2">
            <li><span><a href='menu.jsp?ADD=<%=arr1[61]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[61]%> ₹ </span><b>Gulab Jamun</b><br><p>Deep fried milk confection in a sweet syrup (3 pieces)</p></li>
            
            <li><span><a href='menu.jsp?ADD=<%=arr1[62]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[62]%> ₹ </span><b>Kheer</b><br><p>Rice cooked in flavored milk with nuts and cardamon, served cold</p></li>
            
            <li><span><a href='menu.jsp?ADD=<%=arr1[63]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[63]%> ₹ </span><b>Kulfi</b><br><p>Homemade sweetened milk ice cream, choice of mango or pistachio</p></li> 
            
            <li><span><a href='menu.jsp?ADD=<%=arr1[64]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[64]%> ₹ </span><b>Mango Pudding</b><br><p>Vanilla pudding with fresh mango pulp</p></li>
            
            <li><span><a href='menu.jsp?ADD=<%=arr1[65]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[65]%> ₹ </span><b>Gajar Halwa</b><br><p>Grated carrots cooked in milk and butter</p></li>
            
            </ul></li>

            <li><h3 align="center">Beverages</h3>
                    <ul class="price-list p2">
            <li><span><a href='menu.jsp?ADD=<%=arr1[66]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[66]%> ₹ </span><b>Lassi</b><br><p>Cool refreshing yogurt smoothie<br>(Choices: Sweet / Salted / Rose flavors)</p></li>
            
            <li><span><a href='menu.jsp?ADD=<%=arr1[67]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[67]%> ₹ </span><b>Mango Lassi</b><br><p>Cool refreshing mango flavored yogurt smoothie</p></li>
            
            <li><span><a href='menu.jsp?ADD=<%=arr1[68]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[68]%> ₹ </span><b>Mango Milkshake</b><br><p>Refreshing blend of mango and milk</p></li> 
            
            <li><span><a href='menu.jsp?ADD=<%=arr1[69]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[69]%> ₹ </span><b>Lemonade</b> (Nimboo Pani) <br><p>Refreshing traditional lemon water drink</p></li>
            
            <li><span><a href='menu.jsp?ADD=<%=arr1[70]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                 <span><%= arr[70]%> ₹ </span><b>Juices</b><br><p>Mango, Orange or Cranberry</p></li>
             
            <li><span><a href='menu.jsp?ADD=<%=arr1[71]%>'><img src="images/addcart.png" alt="add" width=50" height="50"/></a></span>
                <span><%= arr[71]%> ₹ </span><b>Soda</b><br><p>Coke, Diet Coke, Sprite, Ginger Ale, Club Soda</p></li>
            </ul></li>

</ul>

        </article>
            
            <p align="center" ><a class="button-2" href="#">Back to top</a></p>
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