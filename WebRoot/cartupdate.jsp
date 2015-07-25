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
   if(cart==null) {
     out.println("please choose goods"); 
     return;
   }
   
   List<CartItem> items = cart.getItems();
   for(int i=0;i<items.size();i++) {
     CartItem ci = items.get(i);
     String count = request.getParameter("p"+ci.getProductId());
     if(count!=null&&!count.trim().equals("")) {
        ci.setCount(Integer.parseInt(count));
     }
     
   }
   
  // response.sendRedirect("cart.jsp");
  %>

  <center>Modified count </center>

 3 Second back to the purchase page;
 
 <div id="num">
 </div>
 
 <script >
  var leftTime = 3000;
   function go()
   {
     document.getElementById("num").innerText=leftTime;
     leftTime-=1000;
     if(leftTime<=0) {
     document.location.href="cart.jsp";
     }
   }
  
   setInterval(go,1000);
   
 </script>









