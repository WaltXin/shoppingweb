<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="_sessioncheck.jsp" %>
<%@ page import ="java.sql.*,com.walt.shopping.*,java.util.*" %>

<%!
private static final int PAGE_SIZE = 8;
 %>

<%
String strPageNo = request.getParameter("pageNo");
int pageNo = 0;
if(strPageNo!=null&&!strPageNo.trim().equals("")) {
  pageNo = Integer.parseInt(strPageNo);
}
if(pageNo<1) {
  pageNo = 1;
}
%>


<%
//get all the users
List<Product> products = new ArrayList<Product>();
int pageCount = ProductMgr.getInstance().getProducts(products,pageNo, PAGE_SIZE);
if(pageNo>pageCount) {
pageNo=pageCount;
}
 %>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'userlist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <form action="<%=request.getContextPath()%>/admin/productlist.jsp" method="post">
    <table border="1" align ="center">
       <tr>
         <td>ID </td>
         <td>name </td>
         <td>descr </td> 
         <td>normalprice</td>
         <td>memberprice </td>
         <td>pdate</td> 
         <td>category</td> 
         <td>Manage</td>
       </tr>
       <%
       for(Iterator<Product> it = products.iterator();it.hasNext();) {
          Product p = it.next();
        %>
        
         <tr>
         <td><%=p.getId() %> </td>
         <td><%=p.getName() %> </td>
         <td><%=p.getDescr() %> </td> 
         <td><%=p.getNormalPrice() %> </td>
         <td><%=p.getMemberPrice() %> </td>
         <td><%=p.getPdate() %> </td>
         <td><%=p.getCategory().getName() %></td> <!--Category.loadById(p.getCategoryId()).getName()  -->
         <td>
             <a href="<%=request.getContextPath()%>/admin/productdelete.jsp?id=<%=p.getId() %>" target="detail" onclick="return confirm('Delete')">Delete</a>
             &nbsp;
            <!--  <a href="<%=request.getContextPath()%>/admin/productmodify.jsp?id=<%=p.getId() %>" target="detail">Modify</a>
             &nbsp;
             <a href="<%=request.getContextPath()%>/admin/productimageup.jsp?id=<%=p.getId() %>" target="detail">UploadPicture</a>
             --> 
         </td> 
       </tr>
       <%
       }
        %>
    </table>
    <center>
    the:<%=pageNo %> page
    &nbsp;
    all:<%=pageCount %> page
    &nbsp;
    <a href="<%=request.getContextPath()%>/admin/productlist.jsp?pageNo=<%=pageNo - 1%>">Previous</a>
    &nbsp;
    <a href="<%=request.getContextPath()%>/admin/productlist.jsp?pageNo=<%=pageNo + 1%>">Next</a>
     &nbsp;
    <a href="<%=request.getContextPath()%>/admin/productlist.jsp?pageNo=<%=pageCount%>">final</a>
    </center>
   </form>
  </body>
</html>
