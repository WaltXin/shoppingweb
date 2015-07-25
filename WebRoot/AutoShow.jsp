<%@ page language="java" import="java.util.*"  pageEncoding="GB18030" import="com.walt.shopping.*"%>

<%
  List<Product> latestProducts = ProductMgr.getInstance().getLatestProduct(10);
 %>
 
 <%
 String path = request.getContextPath();
 String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 %>

<%@ page import="com.walt.shopping.*" import="java.sql.*" %>



<%
  String strCategoryId = request.getParameter("categoryid");
  int categoryId = 0;
  if(strCategoryId!=null&&!strCategoryId.trim().equals("")) {
    categoryId = Integer.parseInt(strCategoryId);
  }
    int id = categoryId;
  if(id==16) {
      response.sendRedirect("Lenovo.jsp");
  } else if(id==17) {
      response.sendRedirect("Apple.jsp");
  }else if(id==18) {
      response.sendRedirect("Dell.jsp");
  }else if(id==19) {
      response.sendRedirect("Toshiba.jsp");
  }else if(id==20) {
      response.sendRedirect("Hp.jsp");
  }else {
      response.sendRedirect("NewCategory.jsp");
  }
  
  
 %>

