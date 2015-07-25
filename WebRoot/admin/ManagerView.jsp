<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Contract -  Laptops</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="../css/reset.css" type="text/css" media="all">
  <link rel="stylesheet" href="../css/style.css" type="text/css" media="all">
  <script type="text/javascript" src="../js/jquery-1.4.2.min.js" ></script>
  <script type="text/javascript" src="../js/cufon-yui.js"></script>
  <script type="text/javascript" src="../js/Humanst521_BT_400.font.js"></script>
  <script type="text/javascript" src="../js/Humanst521_Lt_BT_400.font.js"></script>
  <script type="text/javascript" src="../js/cufon-replace.js"></script>
	<script type="text/javascript" src="../js/roundabout.js"></script>
  <script type="text/javascript" src="../js/roundabout_shapes.js"></script>
  <script type="text/javascript" src="../js/gallery_init.js"></script>
 
</head>

<body>
  <!-- header -->
  <header>
    <div class="container">
    	<h1><a href="index.html">Laptops</a></h1>
      <nav>
        <ul>
        <li><a href="../WebShopping.jsp">Home</a></li>
          <li><a href="../Lenovo.jsp">Lenovo</a></li>
          <li><a href="../Apple.jsp">Apple</a></li>
          <li><a href="../Dell.jsp">Dell</a></li>
          <li><a href="../Toshiba.jsp">Toshiba</a></li>
		  <li><a href="../Hp.jsp">HP</a></li>
		    <li><a href="../loginbefore.jsp">Sign in</a></li>
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
              
              <div id="navigation"> 
              <ul> <li>User Manager <ul> <br>
                    <li><a href="userlist.jsp">--- user list</a></li> <br>
                    
                    </ul> </li> 
                    <li> Category Manager <ul> <br>
                    <li><a href="categoryadd.jsp">--- add category</a></li> 
                    <li><a href="categorylist.jsp">--- category list</a></li> <br>
                  
                    </ul> </li> 
                    <li> Product Manager<ul> <br>
                    <li><a href="productadd.jsp">--- product add</a></li> 
                    <li><a href="productsearch.jsp">--- product search</a></li> <br>
                    </ul> </li> 
                    <li> Order Manager <ul> <br>
                    <li><a href="orderlist.jsp">--- order list</a></li> 
                     </ul> </li> </ul> </div>
              
              

              
              
                 </article> 
          </section>
        </div>
      </div>
    </div>
  </div>
	
	
  </body>
</html>
