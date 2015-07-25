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
            <h2>My <span>Contacts</span></h2>
            <!-- .contacts -->
            <ul class="contacts">
              <li><strong>Country:</strong>Ireland</li>
              <li><strong>City:</strong>Galway</li>
              <li><strong>Number</strong>0873969595</li>
              <li><strong>Email:</strong><a href="#">xiongxinwei6@gmail.com</a></li>
            </ul>
            <!-- /.contacts -->
           
          </aside>
          <!-- content -->
          <section id="content">
            <article>
            	<h2>Contact <span>Form</span></h2>
              <form id="contacts-form" action="" method="post">
                <fieldset>
                  <div class="field">
                    <label>Your Name:</label>
                    <input type="text" value=""/>
                  </div>
                  <div class="field">
                    <label>Your E-mail:</label>
                    <input type="email" value=""/>
                  </div>
                  <div class="field">
                    <label>Your Website:</label>
                    <input type="url" value=""/>
                  </div>
                  <div class="field">
                    <label>Your Message:</label>
                    <textarea></textarea>
                  </div>
                  <div><a href="#" onclick="document.getElementById('contacts-form').submit()">Send Your Message!</a></div>
                </fieldset>
              </form>
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
        <div class="fleft">Copyright - walt @2014</div>
        
    </div>
  </footer>
  <script type="text/javascript"> Cufon.now(); </script>
</body>
</html>
