<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@page import="com.walt.shopping.*" %>

<%
request.setCharacterEncoding("GB18030");
String action = request.getParameter("action");
if(action!=null&&action.equals("modify")) {
  String name = request.getParameter("name");
  String descr = request.getParameter("descr");
  String addr = request.getParameter("id");
 // u.setUsername(username);
 // u.setPhone(phone);
 // u.setAddr(addr);
  //u.save();
 // u.update();
  out.print("modify ok!");
  }
 %>

<html>
  <head>
    
  </head>
  
  <body>
    <form name="form" action="usermodify.jsp" method="post">
		<input type="hidden" name="action" value="modify"/>

		
	</form>
  </body>
</html>
