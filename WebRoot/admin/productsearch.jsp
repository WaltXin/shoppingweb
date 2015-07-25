<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ page import="com.walt.shopping.*" import="java.sql.*" import="java.util.*"%>

<%@ include file="_sessioncheck.jsp" %>

<%
   List<Category> categories = Category.getCategories();
   request.setCharacterEncoding("GB18030");
   String action = request.getParameter("action");
  if(action!=null&&action.equals("complexsearch")) {
   pageContext.forward("complexsearchresult.jsp");
   %>
   
    <%

  }
  if(action!=null&&action.equals("simplesearch2")) {
   pageContext.forward("simplesearchresult2.jsp");
     
  }
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
 
  <script type="text/javascript">
   <!--
    function checkdata() {
      with(document.forms["complex"]) {
       if(lownormalprice.value==null||lownormalprice.value=="") {
        lownormalprice.value=-1;
       }
       if(highnormalprice.value==null||highnormalprice.value=="") {
        highnormalprice.value=-1;
       }
       if(lowmemberprice.value==null||lowmemberprice.value=="") {
        lowmemberprice.value=-1;
       }
       if(highmemberprice.value==null||highmemberprice.value=="") {
        highmemberprice.value=-1;
       }
      }
    }
   -->
  </script>
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
          <table>
            <tr><td>
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
                     </td>
                     <td>
                     <!--  
    <center>simple search</center>
	    <form action="<%=request.getContextPath()%>/admin/productsearch.jsp" method="post">
	      <input type="hidden" name="action" value="simplesearch">
	      category:<select></select>
	      keyword:<input type="text" name="keyword">
	      <input type="submit" value="search">
	    </form>
	   
	    <center>The second search</center>
	     <form action="<%=request.getContextPath()%>/admin/productsearch.jsp" method="post">
	      <input type="hidden" name="action" value="simplesearch2">
	      category:<br>-->
	        <%
		         for(Iterator<Category> it = categories.iterator();it.hasNext();) {
		           Category c = it.next();
		           if(c.isLeaf()) {
		           %>
		       <!--    <input type="checkbox" name="categoryid" value="<%=c.getId() %>"><%=c.getName() %><br> --> 
		           <%
		         }else {
		           %>
		            <%=c.getName() %><br>
		           <%
		         }
		         
		         }
	        %>
	     <!--   keyword:<input type="text" name="keyword">
	      <input type="submit" value="search">
	    </form>-->
	    
    <center></center>
	    <form action="<%=request.getContextPath()%>/admin/productsearch.jsp" method="post" onsubmit="checkdata()" name="complex">
	      <input type="hidden" name="action" value="complexsearch">

     <table>
     <tr>
       <td>
          category:
       </td>
       <td>
       
       <select name="categoryid">
        <option value="0">All</option>
       <%
         for(Iterator<Category> it = categories.iterator();it.hasNext();) {
           Category c = it.next();
           String preStr = "--";
           for(int i=1;i<c.getGrade();i++) {
             preStr+="--";
           }
           
           %>
           <option value="<%=c.getId() %>"><%=preStr+c.getName() %></option>
          <%
          }
          %>
       </select>
       </td>
     </tr>
     <tr>
       <td>
          keyword:
       </td>
       <td>
       <input type="text" name="normalprice">
       </td>
     </tr>
     <tr>
       <td>
          normalprice:
       </td>
       <td> From:<input type="text" name="lownormalprice"/>
       To:<input type="text" name="highnormalprice"/></td>
     </tr>
     <tr>
       <td>
          memberprice:
       </td>
       <td> From:<input type="text" name="lowmemberprice"/>
            To:<input type="text" name="highmemberprice"/>
      </td>
     </tr>
      <tr>
       <td>
          pdate:
       </td>
       <td>From:<input type="text" name="startdate"/>
            To:<input type="text" name="enddate"/>
        </td>
     </tr>
   
      <tr>
      
       <td colspan=2>
         <input type="submit" value="search" /><!-- onClick="history.go(0)" -->
       </td>
       
     </tr>
     
                 </article> 
          </section>
        </div>
      </div>
    </div>
  </div>
    </table>
    </td>
    </table>
  </body>
    
  
</html>
