<%@ page language="java" import="java.util.*" %>
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
  int id = 20;
  
  Product p = ProductMgr.getInstance().loadById(id);
  
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- DW6 -->
<head>
<!-- Copyright 2005 Macromedia, Inc. All rights reserved. -->
<title>Laptops---Lenovo</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="./Laptops/mm_restaurant1.css" type="text/css">
</head>
<body bgcolor="#0066cc">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr bgcolor="#99ccff">
	<td width="15" nowrap>&nbsp;</td>
	<td width="745" height="60" colspan="2" class="logo" nowrap><br>
	Laptops <span class="tagline">|------------- Apple</span></td>
	<td width="100%">&nbsp;</td>
	</tr>

	<tr bgcolor="#003399">
	<td width="15" nowrap>&nbsp;</td>
	<td height="36" colspan="2" id="navigation" nowrap class="navText"><a href="WebShopping.jsp">HOME</a></td>
	<td>&nbsp;</td>
	</tr>

	<tr bgcolor="#ffffff">
	<td width="15" valign="top"><img src="mm_spacer.gif" alt="" width="15" height="1" border="0"></td>
	<td width="35" valign="top"><img src="mm_spacer.gif" alt="" width="35" height="1" border="0"></td>
	<td width="710" valign="top"><br>
	<table border="0" cellspacing="0" cellpadding="2" width="801">
        <tr>
          <td colspan="7" class="pageName">Please add product under your category and upload the picture for example:</td>
        </tr>
		<tr>
          <td width="22%" height="110"><a href="login.jsp"><img style="display: block; width: 184px; height: 168px; margin:0px; padding:0px; border:none" src="./images/apples/AppleAir11.jpg" alt="small product photo" width="110" height="110" border="0"></a></td>
		  <td>&nbsp;</td>
		  <td width="22%" height="110"><a href="login.jsp"><img style="display: block; width: 184px; height: 168px; margin:0px; padding:0px; border:none" src="./images/apples/AppleAir13.jpg" alt="small product photo" width="110" height="110" border="0"></a></td>
		  <td>&nbsp;</td>
		  <td width="22%" height="110"><a href="login.jsp"><img style="display: block; width: 184px; height: 168px; margin:0px; padding:0px; border:none" src="./images/apples/AppleAir15.jpg" alt="small product photo" width="110" height="110" border="0"></a></td>
		 
        </tr>
		<tr>
          <td valign="top" class="bodyText" nowrap><A HREF="login.jsp">MacBook Air 11</A><br>
		  Price: 1300.00</td>
		  <td>&nbsp;</td>
		   <td valign="top" class="bodyText" nowrap><A HREF="login.jsp">MacBook Air 13</A><br>
		  Price: 1400.00</td>
		 <td>&nbsp;</td>
		   <td valign="top" class="bodyText" nowrap><A HREF="login.jsp">MacBook Air 15</A><br>
		  Price: 1500.00</td>
		 <td>&nbsp;</td>
		  
        </tr>
		<tr>
			<td colspan="7">&nbsp;</td>
		</tr>
		<tr>
         <td height="110"> <a href="login.jsp"><img  style="display: block; width: 184px; height: 168px; margin:0px; padding:0px; border:none" src="./images/apples/ApplePro13.jpg" alt="small product photo" width="110" height="110" border="0"></a></td>
		  <td>&nbsp;</td>
		  <td height="110"><a href="login.jsp"><img style="display: block; width: 184px; height: 168px; margin:0px; padding:0px; border:none" src="./images/apples/ApplePro15.jpg" alt="small product photo" width="110" height="110" border="0"></a></td>
		  <td>&nbsp;</td>
		  <td height="110"><a href="login.jsp"><img style="display: block; width: 184px; height: 168px; margin:0px; padding:0px; border:none" src="./images/apples/ApplePro17.jpg" alt="small product photo" width="110" height="110" border="0"></a></td>
		 
        </tr>
		<tr>
          <td valign="top" class="bodyText" nowrap><A HREF="login.jsp">MacBook Pro 13</A><br>
		  Price: 1400.00</td>
		  <td>&nbsp;</td>
		   <td valign="top" class="bodyText" nowrap><A HREF="login.jsp">MacBook Pro 15</A><br>
		  Price: 1800.00</td>
		 <td>&nbsp;</td>
		   <td valign="top" class="bodyText" nowrap><A HREF="login.jsp">MacBook Pro 17</A><br>
		  Price: 1900.00</td>
		 <td>&nbsp;</td>
		  
        </tr>
		<tr>
			<td colspan="7">&nbsp;</td>
		</tr>
      </table>	</td>
	<td>&nbsp;</td>
	</tr>

	<tr>
	<td width="15">&nbsp;</td>
    <td width="35">&nbsp;</td>
    <td width="710">&nbsp;</td>
	<td width="100%">&nbsp;</td>
  </tr>
</table>
</body>
</html>
