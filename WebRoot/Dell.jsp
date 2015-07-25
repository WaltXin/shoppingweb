<%@ page language="java" import="java.util.*"  pageEncoding="GB18030" import="com.walt.shopping.*"%>

<%
  List<Product> latestProducts = ProductMgr.getInstance().getLatestProduct(10);
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- DW6 -->
<head>
<!-- Copyright 2005 Macromedia, Inc. All rights reserved. -->
<title>Laptops---Dell</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="./Laptops/mm_restaurant1.css" type="text/css">
</head>
<body bgcolor="#0066cc">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr bgcolor="#99ccff">
	<td width="15" nowrap>&nbsp;</td>
	<td width="745" height="60" colspan="2" class="logo" nowrap><br>
	Laptops <span class="tagline">|------------- Dell</span></td>
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
          <td colspan="7" class="pageName">DELL</td>
        </tr>
		<tr>
          <td width="22%" height="110"><a href="productdetailshow.jsp?id=18"><img style="display: block; width: 184px; height: 168px; margin:0px; padding:0px; border:none" src="./images/dells/adamo.jpg" alt="small product photo" width="110" height="110" border="0"></a> </td>
		  <td>&nbsp;</td>
		  <td width="22%" height="110"><a href="productdetailshow.jsp?id=19"><img style="display: block; width: 184px; height: 168px; margin:0px; padding:0px; border:none" src="./images/dells/Inspiron15.jpg" alt="small product photo" width="110" height="110" border="0"></a></td>
		  <td>&nbsp;</td>
		  <td width="22%" height="110"><a href="productdetailshow.jsp?id=20"><img style="display: block; width: 184px; height: 168px; margin:0px; padding:0px; border:none" src="./images/dells/Inspiron15r.jpg" alt="small product photo" width="110" height="110" border="0"></a></td>
		  <td>&nbsp;</td>
		  <td width="22%" height="110"><a href="productdetailshow.jsp?id=21"><img style="display: block; width: 184px; height: 168px; margin:0px; padding:0px; border:none" src="./images/dells/Inspiron17r.jpg" alt="small product photo" width="110" height="110" border="0"></a></td>
        </tr>
		<tr>
          <td valign="top" class="bodyText" nowrap><A HREF="productdetailshow.jsp?id=18">Adamo</A><br>
		  Price: €650.00</td>
		  <td>&nbsp;</td>
		   <td valign="top" class="bodyText" nowrap><A HREF="productdetailshow.jsp?id=19">Inspiron15</A><br>
		  Price: €720.00</td>
		 <td>&nbsp;</td>
		   <td valign="top" class="bodyText" nowrap><A HREF="productdetailshow.jsp?id=20">Inspiron15r</A><br>
		  Price: €800.00</td>
		 <td>&nbsp;</td>
		   <td valign="top" class="bodyText" nowrap><A HREF="productdetailshow.jsp?id=21">Inspiron17r</A><br>
		  Price: €750.00</td>
        </tr>
		<tr>
			<td colspan="7">&nbsp;</td>
		</tr>
		<tr>
         <td height="110"> <a href="productdetailshow.jsp?id=22"><img  style="display: block; width: 184px; height: 168px; margin:0px; padding:0px; border:none" src="./images/dells/Notebook.jpg" alt="small product photo" width="110" height="110" border="0"></a></td>
		  <td>&nbsp;</td>
		  <td height="110"><a href="productdetailshow.jsp?id=23"><img style="display: block; width: 184px; height: 168px; margin:0px; padding:0px; border:none" src="./images/dells/studio.jpg" alt="small product photo" width="110" height="110" border="0"></a></td>
		  <td>&nbsp;</td>
		  <td height="110"><a href="productdetailshow.jsp?id=24"><img style="display: block; width: 184px; height: 168px; margin:0px; padding:0px; border:none" src="./images/dells/vostro.jpg" alt="small product photo" width="110" height="110" border="0"></a></td>
		  <td>&nbsp;</td>
		  <td height="110"><a href="productdetailshow.jsp?id=25"><img style="display: block; width: 184px; height: 168px; margin:0px; padding:0px; border:none" src="./images/dells/xps.jpg" alt="small product photo" width="110" height="110" border="0"></a></td>
        </tr>
		<tr>
          <td valign="top" class="bodyText" nowrap><A HREF="productdetailshow.jsp?id=22">Notebook</A><br>
		  Price: €760.00</td>
		  <td>&nbsp;</td>
		   <td valign="top" class="bodyText" nowrap><A HREF="productdetailshow.jsp?id=23">Studio</A><br>
		  Price: €600.00</td>
		 <td>&nbsp;</td>
		   <td valign="top" class="bodyText" nowrap><A HREF="productdetailshow.jsp?id=24">Vostro</A><br>
		  Price: €900.00</td>
		 <td>&nbsp;</td>
		   <td valign="top" class="bodyText" nowrap><A HREF="productdetailshow.jsp?id=25">XPS</A><br>
		  Price: €830.00</td>
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
