<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="com.walt.shopping.*" import="java.sql.*" %>

<%
 User u = (User)session.getAttribute("user");
 if(u==null) {
 out.print("you haven't login");
 return;
 }
 %>


<%
request.setCharacterEncoding("GB18030");
String action = request.getParameter("action");
if(action!=null&&action.equals("modify")) {
  String username = request.getParameter("username");
  String phone = request.getParameter("phone");
  String addr = request.getParameter("addr");
  u.setUsername(username);
  u.setPhone(phone);
  u.setAddr(addr);
  //u.save();
  u.update();
  out.print("modify ok!");
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
	<form name="form" action="usermodify.jsp" method="post">
		<input type="hidden" name="action" value="modify"/>

		<table width="750" align="center" border="2">
			<tr>
				<td colspan="2" align="center">modify</td>
			</tr>
			<tr>
				<td>User name:</td>
				<td><input type=text name="username" size="30" maxlength="10"
					value=<%=u.getUsername() %>>
					<div id="usernameErr"></div> <!--<span id="usernameErr"></span>-->
				</td>
			</tr>
			<!--  
			<tr>
				<td>password :</td>
				<td><input type=password name="password" size="15" maxlength="12">
				</td>
			</tr>
			-->
			
            <tr>
				<td>phone:</td>
				<td><input type=text name="phone" size="15" maxlength="12" value=<%=u.getPhone() %>>
				</td>
			</tr>


			<tr>
				<td>address</td>
				<td ><textarea rows="12" cols="80" name="addr" ><%=u.getAddr() %> </textarea></td>
			</tr>

			<tr>
				<td></td>
				<td><input type="submit" value="submit"> <input
					type="reset" value="reset"></td>
			</tr>

		</table>
	</form>
	   </article> 
          </section>
        </div>
      </div>
    </div>
  </div>
	<footer>
    <div class="container">
    	<div class="wrapper">
        <div class="fleft">Copyright - walt @2014</div>
        
    </div>
  </footer>
  <script type="text/javascript"> Cufon.now(); </script>
</body>
</html>
