<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@page import="com.walt.shopping.*"  %>

<%
	 String action = request.getParameter("action");
	 if(action!=null&&action.equals("loginbefore")) 
	 {
		  String username = request.getParameter("username");
		  String password = request.getParameter("password");
		  User u = null;
	      try{
	       u = User.Validate(username, password);
	      }catch(userNotFoundException e) {
	        out.print("user not found");
	        return;
	      }catch(passwordNotCorrectException e) {
	        out.print("password incorrect");
	        return;
	      }
	      session.setAttribute("user", u);
	      response.sendRedirect("selfservice.jsp");
		
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
             <form name="form" action="loginbefore.jsp" method="post">
      <input type="hidden" name="action" value=loginbefore>
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
            <a href="index.jsp">sign up!</a>
           </td>
          
        </tr>
      </table>
    <br><br><br><br><br><br><br><br><br><br><br><br><br>
   </form>
            </article> 
          </section>
        </div>
      </div>
    </div>
  </div>
   
   <body>
   
   
   
   <footer>
    <div class="container">
    	<div class="wrapper">
        <div class="fleft">Copyright - walt @2014</div>
        
    </div>
  </footer>
  <script type="text/javascript"> Cufon.now(); </script>
</body>
</html>
