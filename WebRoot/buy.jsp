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

<%
  request.setCharacterEncoding("GB18030");
  int id = Integer.parseInt(request.getParameter("id"));
  CartItem ci = new CartItem();
  Product p = ProductMgr.getInstance().loadById(id);
  ci.setProductId(id);
  ci.setPrice(p.getNormalPrice());  //check if the user logged in
  ci.setCount(1);
  cart.add(ci);
  
  response.sendRedirect("cart.jsp"); 
  
 %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  
  </head>
  
  <body>
    
    
  </body>
</html>














