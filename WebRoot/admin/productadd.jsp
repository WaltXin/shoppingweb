<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ page import="com.walt.shopping.*" import="java.sql.*" %>

<%@ include file="_sessioncheck.jsp" %>

<%
  request.setCharacterEncoding("GB18030");
  String action = request.getParameter("action");
  
  String strCategoryId = request.getParameter("categoryid");
  int categoryId = 0;
  if(strCategoryId!=null&&!strCategoryId.trim().equals("")) {
    categoryId = Integer.parseInt(strCategoryId);
  }
  
  
  if(action!=null&&action.trim().equals("add")) {
    String name = request.getParameter("name");
    String descr = request.getParameter("descr");
    double normalPrice = Double.parseDouble(request.getParameter("normalprice")) ;
    double memberPrice = Double.parseDouble(request.getParameter("memberprice")) ;
     
    
    Category c = Category.loadById(categoryId);
    if(!c.isLeaf()) {
       out.print("you must add from leaf node");
       return;
    }
    
    Product p = new Product();
    p.setId(-1);
    p.setName(name);
    p.setDescr(descr);
    p.setNormalPrice(normalPrice);
    p.setMemberPrice(memberPrice);
    p.setPdate(new Timestamp(System.currentTimeMillis()));
    p.setCategoryId(categoryId);
    
    ProductMgr.getInstance().addProduct(p);
    
    out.print("success add");
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
       var arrLeaf = new Array();
      function checkdate() {
        if(arrayLeaf[document.form.category.selectedIndex]!="leaf") {
         alert("please select leaf node");
          document.form.category.focus();
          return false;
        }
        return true;
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
                     
    <center>add category list</center>
    <form action="<%=request.getContextPath()%>/admin/productadd.jsp" method="post" onsubmit="return checkdate()" name="form">
      <input type="hidden" name="action" value="add"/>

     <table>
     <tr>
       <td>
          name:
       </td>
       <td><input type="text" name="name"/></td>
     </tr>
     <tr>
       <td>
          descr:
       </td>
       <td>
       <textarea name="descr"></textarea>
       </td>
     </tr>
     <tr>
       <td>
          normalprice:
       </td>
       <td><input type="text" name="normalprice"/></td>
     </tr>
      <tr>
       <td>
          memberprice:
       </td>
       <td><input type="text" name="memberprice"/></td>
     </tr>
     <tr>
       <td>
         category:
       </td>
       <td>
         <select name="categoryid">
        <option value="0">All</option>
        <script type="text/javascript">
         arrLeaf[0] ="noleaf";
        </script>
       <%
        List<Category> categories = Category.getCategories(); //initial 
        int index = 1;
         for(Iterator<Category> it = categories.iterator();it.hasNext();) {
           Category c = it.next();
           String preStr = "--";
           for(int i=1;i<c.getGrade();i++) {
             preStr+="--";
           }
           %>
           <script type="text/javascript">
           arrayLeaf[<%=index%>] = '<%=c.isLeaf()?"leaf":"notleaf" %>';
           </script>
           <option value="<%=c.getId() %>" <%=c.getId() == categoryId?"selected":"" %>><%=preStr+c.getName() %></option>
           <%
           index++;
         }
        %>
       </select>
       </td>
     </tr>
      <tr>
      
       <td colspan=2>
         <input type="submit" value="add" /> <!-- onClick="history.go(0)" -->
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
