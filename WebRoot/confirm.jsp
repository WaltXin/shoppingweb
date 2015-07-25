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
 User u = (User)session.getAttribute("user");
 if(u==null) {
    out.println("you have not logged in,if you login you will get the member price!");
    //out.println("<a href=comfirmusenormal.jsp>continue</a><br>");
    out.println("<a href=loginbefore.jsp>Login Page</a>");
 }
  %>
  <br><br>
              
<table border=1 align="center">
     <tr>
       <td>Product ID</td>
       <td>Product Name</td>
       <td>Product Price(<%=(u==null?"normalprice":"memberprice") %>)</td>
       <td>Product Count</td>
       <td></td>
       
     </tr>
     <%
       List<CartItem> items = cart.getItems();
       for(int i=0;i<items.size();i++) {
         CartItem ci = items.get(i);
         Product p = ProductMgr.getInstance().loadById(ci.getProductId());
         %>
          <tr>
            <td><%=ci.getProductId() %></td>
	        <td><%=p.getName() %></td>
	        <td><%=(u==null)?p.getNormalPrice():p.getMemberPrice() %></td> <!-- (u==null)?p.getNormalPrice():p.getMemberPrice() -->
	        <td>
	         <%=ci.getCount() %>
	        </td>
	        <td></td>
          </tr>
         <%
       }
      %>
    </table>
    
    <center> 
     <!--  price:<%=Math.round(cart.getTotalPrice()*100)/100.0 %>euro<br> -->
      <%
        if(u!=null) {
          %>
           Welcome <%=u.getUsername() %>    please ensure your address<br>
           
          <%
        }
       %>
       
       <form action="order.jsp" method="post">
          
          address:<br>
          <textarea name="addr"><%=(u==null?"":u.getAddr()) %></textarea> <br>
          <input type="submit" value="order">
       </form>
    </center>
     </article> 
          </section>
        </div>
      </div>
    </div>
  </div>
    </body>


