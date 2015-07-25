<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ page import="com.walt.shopping.*" import="java.sql.*" %>

<!--  
   //check session have cart or not
   Cart cart = (Cart)session.getAttribute("cart");
   if(cart==null) {
       cart = new Cart();
       session.setAttribute("cart", cart);
   }
 
 -->
 
 
  <%
 User u = (User)session.getAttribute("user");
 if(u==null) {
    u = new User();
    u.setId(-1); // nomal user order;
 }
  %>
 
 <jsp:useBean id="cart" class="com.walt.shopping.Cart" scope="session" ></jsp:useBean>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Contract -  Laptops</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
  <link rel="stylesheet" href="css/style.css" type="text/css" media="all">
  <script type="text/javascript" src="js/jquery-1.4.2.min.js" ></script>
  <script type="text/javascript" src="js/cufon-yui.js"></script>
  <script type="text/javascript" src="js/Humanst521_BT_400.font.js"></script>
  <script type="text/javascript" src="js/Humanst521_Lt_BT_400.font.js"></script>
  <script type="text/javascript" src="js/cufon-replace.js"></script>
	<script type="text/javascript" src="js/roundabout.js"></script>
  <script type="text/javascript" src="js/roundabout_shapes.js"></script>
  <script type="text/javascript" src="js/gallery_init.js"></script>
<script language="JavaScript" src="script/regcheckdata.js"></script>
</head>

<body>
  <!-- header -->
  <header>
    <div class="container">
    	<h1><a href="WebShopping.jsp">Laptops</a></h1>
      <nav>
        <ul>
        	<li><a href="WebShopping.jsp" class="current">Home</a></li>
          <li><a href="Lenovo.jsp">Lenovo</a></li>
          <li><a href="Apple.jsp">Apple</a></li>
          <li><a href="Dell.jsp">Dell</a></li>
          <li><a href="Toshiba.jsp">Toshiba</a></li>
		  <li><a href="Hp.jsp">HP</a></li>
		   <li><a href="contacts.jsp">Contact</a></li>
        </ul>
      </nav>
    </div>
	</header>
	
	<div class="main-box">
    <div class="container">
      <div class="inside">
        <div class="wrapper">
        <section id="content">
            <article>
            	<h2>Welcome to <span>Laptops </span></h2>
              <p>We provide the best product for you.</p>


 <%
   if(cart==null) {
     out.println("please choose goods"); 
     return;
   }
 %>

<%
  String addr = request.getParameter("addr");
  SalesOrder so = new SalesOrder();
  so.setCart(cart);
  so.setAddr(addr);
  so.setUser(u);
  so.setoDate(new Timestamp(System.currentTimeMillis()));
  so.setStatus(0); //means just order
  
  so.save();
  session.removeAttribute("cart");
 %>

<center> 
   Thanks for shopping here!
 </center>



</article> 
          </section>
        </div>
      </div>
    </div>
  </div>
    </body>







