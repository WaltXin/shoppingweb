<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@page import="com.walt.shopping.*" import="java.sql.*" %>

<%
   String strId = request.getParameter("id");
   Category c = new Category();
   int id = 0;
   if(strId!=null) {
      id = (Integer.parseInt(strId));
      c.delete(id);
   }
 %>


<html>
  <head>
  </head>
  <body>
   <h2> delete success</h2> <br>
   <table>
   <tr>
     <td colspan=2>
      
       </td>
       </tr>
       </table>
  </body>
</html>
