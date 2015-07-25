<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
	 String action = request.getParameter("action");
	 if(action!=null&&action.equals("login")) 
	 {
		  String username = request.getParameter("username");
		  String password = request.getParameter("password");
	 
		 if(username==null||!username.equals("admin")) 
		 {
		  out.println("user name is incorrect");
		 }else if(password==null||!password.equals("admin")) {
		   out.println("password is incorrect");
		 }else {
		  session.setAttribute("admin", "true");
		  response.sendRedirect("admin/ManagerView.jsp");    //use to be admin/index.jsp
		 }
	 }
 %>

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
		   <li><a href="login.jsp">Manager</a></li>
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
   <form name="form" action="login.jsp" method="post">
      <input type="hidden" name="action" value=login>
      <table width="750" align="center" border=2>
        <tr>
          <td colspan=2 align="center"></td>
        </tr>
        <tr>
          <td >user name:</td>
          <td>
            <input type="text" name="username" size="30" maxlength="10">
           </td>
        </tr>
        <tr>
          <td >password:</td>
          <td>
            <input type=password name="password" size="15" maxlength="12">
           </td>
        </tr>
         <tr>
          <td ></td>
          <td>
            <input type="submit" value="sign in">
            <input type="reset" value="reset">
           </td>
        </tr>
      </table>
    
   </form>
    </article> 
          </section>
        </div>
      </div>
    </div>
  </div>
   
  </body>
</html>
