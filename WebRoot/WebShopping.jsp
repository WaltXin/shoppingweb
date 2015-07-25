<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ page import ="java.sql.*,com.walt.shopping.*,java.util.*" %>

<%
//get all the users
List<Category> categories = Category.getCategories() ;
 %>




<!DOCTYPE html>
<html lang="en">
<head>
  <title>Laptops - choose the best for you</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
  <link rel="stylesheet" href="css/style.css" type="text/css" media="all">
  <script type="text/javascript" src="js/jquery-1.4.2.min.js" ></script>
  <script type="text/javascript" src="js/cufon-yui.js"></script>
  <script type="text/javascript" src="js/Humanst521_BT_400.font.js"></script>
  <script type="text/javascript" src="js/Humanst521_Lt_BT_400.font.js"></script>
	<script type="text/javascript" src="js/roundabout.js"></script>
  <script type="text/javascript" src="js/roundabout_shapes.js"></script>
  <script type="text/javascript" src="js/gallery_init.js"></script>
  <script type="text/javascript" src="js/cufon-replace.js"></script>
</head>

<body>
  <header>
    <div class="container">
    	<!--  <h1><a href="WebShopping.jsp">Laptops</a></h1>-->
      <nav>
        <ul>
        
         <%
       for(Iterator<Category> it = categories.iterator();it.hasNext();) {
          Category c = it.next();
           String preStr = "";
           for(int i=0;i<c.getGrade();i++) {
             preStr += "----";
           }
           
           
        %>
        
          <li> <a href="AutoShow.jsp?categoryid=<%=c.getId()%>"><%=c.getName() %></a></li>
          <%
           }
           %>
		
		  <li><a href="contacts.jsp">Contact</a></li>
		  <li><a href="loginbefore.jsp">Sign in</a></li>
		
        </ul>
      </nav>
     
    </div>
	</header>
  <!-- #gallery -->
  <section id="gallery">
  	<div class="container">
    	<ul id="myRoundabout">
      	<li><img src="images/slide3.jpg" alt=""></li>
        <li><img src="images/slide2.jpg" alt=""></li>
        <li><img src="images/slide5.jpg" alt=""></li>
        <li><img src="images/slide1.jpg" alt=""></li>
        <li><img src="images/slide4.jpg" alt=""></li>
      </ul>
  	</div>
  </section>
  <!-- /#gallery -->
  <div class="main-box">
    <div class="container">
      <div class="inside">
        <div class="wrapper">
        	<!-- aside -->
          <aside>
            <h2>Recent <span>News</span></h2>
            <!-- .news -->
            <ul class="news">
            	<li>
              	<figure><strong>22</strong>April</figure>
                <h3><a href="Lenovo.jsp">New Product for Lenovo!</a></h3>
                Lenovo Yoga 10 is released in April! Go check it <a href="Lenovo.jsp">...</a>
              </li>
              <li>
              	<figure><strong>09</strong>June</figure>
                <h3><a href="Apple.jsp">Want a new MacBook?</a></h3>
                Apple will release the New Macbook with 12 inch Retine screen soon! <a href="Apple.jsp">...</a>
              </li>
              <li>
              	<figure><strong>31</strong>May</figure>
                <h3><a href="loginbefore.jsp">Check out your account infomation!</a></h3>
                We upgrade the account infomation <a href="loginbefore.jsp">...</a>
              </li>
              <li>
              	<figure><strong>25</strong>May</figure>
                <h3><a href="Apple.jsp">No worry for battery any more!</a></h3>
                Macbook Air for 12 hours battery life! <a href="Apple.jsp">...</a>
              </li>
            </ul>
            <!-- /.news -->
          </aside>
          <!-- content -->
          <section id="content">
            <article>
            	<h2>Welcome to <span>Laptops </span></h2>
              <p>We provide the best product for you.</p>
             
            </article> 
          </section>
        </div>
      </div>
    </div>
  </div>
  <!-- footer -->
  <footer>
    <div class="container">
    	<div class="wrapper">
        <div class="fleft">Copyright - Walt @2014</div>
        
      </div>
    </div>
  </footer>
  <script type="text/javascript"> Cufon.now(); </script>
</body>
</html>
