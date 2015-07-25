<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ page import="com.walt.shopping.*" import="java.sql.*" %>



<%
  request.setCharacterEncoding("GB18030");
  int id = Integer.parseInt(request.getParameter("id"));
  Product p = ProductMgr.getInstance().loadById(id);
  
 %>

<%
    String str="";
    if(id==4) {
        str="./images/lenovos/flex10.jpg";
    }else if(id==5) {
        str="./images/lenovos/flex14.jpg";
    }else if(id==6) {
        str="./images/lenovos/flex15.jpg";
    }else if(id==7) {
        str="./images/lenovos/helix.jpg";
    }else if(id==8) {
        str="./images/lenovos/miix2.jpg";
    }else if(id==9) {
        str="./images/lenovos/thinkpad8.jpg";
    }else if(id==10) {
        str="./images/lenovos/yoga10.jpg";
    }else if(id==11) {
        str="./images/lenovos/yoga8.jpg";
    }else if(id==12) {
        str="./images/apples/AppleAir11.jpg";
    }else if(id==13) {
        str="./images/apples/AppleAir13.jpg";
    }else if(id==14) {
        str="./images/apples/AppleAir15.jpg";
    }else if(id==15) {
        str="./images/apples/ApplePro13.jpg";
    }else if(id==16) {
        str="./images/apples/ApplePro15.jpg";
    }else if(id==17) {
        str="./images/apples/ApplePro17.jpg";
    }else if(id==18) {
        str="./images/dells/adamo.jpg";
    }else if(id==19) {
        str="./images/dells/Inspiron15.jpg";
    }else if(id==20) {
        str="./images/dells/Inspiron15r.jpg";
    }else if(id==21) {
        str="./images/dells/Inspiron17r.jpg";
    }else if(id==22) {
        str="./images/dells/Notebook.jpg";
    }else if(id==23) {
        str="./images/dells/studio.jpg";
    }else if(id==24) {
        str="./images/dells/vostro.jpg";
    }else if(id==25) {
        str="./images/dells/xps.jpg";
    }else if(id==26) {
        str="./images/toshibas/L50.jpg"; ///fsdkfjdlf
    }else if(id==27) {
        str="./images/toshibas/qosmio70.jpg";
    }else if(id==28) {
        str="./images/toshibas/satellitec50.jpg";
    }else if(id==29) {
        str="./images/toshibas/Satellitel.jpg";
    }else if(id==30) {
        str="./images/toshibas/satellitem40.jpg";
    }else if(id==31) {
        str="./images/toshibas/satellitem50.jpg";
    }else if(id==32) {
        str="./images/toshibas/satellitem50d.jpg";
    }else if(id==33) {
        str="./images/toshibas/SatelliteP50t.jpg";
    }else if(id==34) {
        str="./images/hps/NR.jpg";
    }else if(id==35) {
        str="./images/hps/NV14.jpg";
    }else if(id==36) {
        str="./images/hps/NV15.jpg";
    }else if(id==37) {
        str="./images/hps/NV17.jpg";
    }else if(id==38) {
        str="./images/hps/TouchSmart.jpg";
    }else if(id==39) {
        str="./images/hps/TouchSmart14.jpg";
    }else if(id==41) {
        str="./images/hps/TouchSmart15.jpg";
    }else if(id==40) {
        str="./images/hps/X2.jpg";
    }else {
       str="./images/apples/ApplePro15.jpg";
    }
    
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- DW6 -->
<head>
<!-- Copyright 2005 Macromedia, Inc. All rights reserved. -->
<title>Product</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="./Laptops/mm_training.css" type="text/css">
</head>
<body bgcolor="#64748B">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr bgcolor="#26354A">
	<td width="15" nowrap><img src="mm_spacer.gif" alt="" width="15" height="1" border="0"></td>
	<td height="70" colspan="2" class="logo" nowrap>Laptops <span class="tagline">Choose your best one!</span></td>
	<td width="100%">&nbsp;</td>
	</tr>

	<tr bgcolor="#FF6600">
	<td colspan="4"><img src="mm_spacer.gif" alt="" width="1" height="4" border="0"></td>
	</tr>

	<tr bgcolor="#D3DCE6">
	<td colspan="4"><img src="mm_spacer.gif" alt="" width="1" height="1" border="0"></td>
	</tr>

	<tr bgcolor="#FFCC00">
	<td width="15" nowrap>&nbsp;</td>
	<td width="705" colspan="2" height="24">
	<table border="0" cellpadding="0" cellspacing="0" id="navigation">
        <tr>
          <td class="navText" align="center" nowrap><a href="WebShopping.jsp">HOME</a></td>
        </tr>
      </table>	</td>
	<td width="100%">&nbsp;</td>
	</tr>

	<tr bgcolor="#D3DCE6">
	<td colspan="4"><img src="mm_spacer.gif" alt="" width="1" height="1" border="0"></td>
	</tr>

	<tr bgcolor="#FF6600">
	<td colspan="4"><img src="mm_spacer.gif" alt="" width="1" height="4" border="0"></td>
	</tr>

	<tr bgcolor="#D3DCE6">
	<td colspan="4"><img src="mm_spacer.gif" alt="" width="1" height="1" border="0"></td>
	</tr>

	<tr bgcolor="#D3DCE6">
	<td width="15" valign="top">&nbsp;</td>
	<td width="35"><img src="mm_spacer.gif" alt="" width="35" height="1" border="0"></td>
	<td width="710" valign="top"><br>
	&nbsp;<br>
	<table border="0" cellspacing="0" cellpadding="2" width="610">
        <tr>
          <td class="pageName" colspan="3">Purchase your Laptops now!</td>
        </tr>
        <tr>
         <td width="260" class="subHeader"><%=p.getName() %></td>
		  <td width="30" rowspan="2">&nbsp;</td>
		  <td width="320" height="100" rowspan="2"><img style="display: block; width: 300px; height: 256px; margin:0px; padding:0px; border:none" src=<%=str %> 
    alt=<%=p.getName() %> 
    title=""></td>
        </tr>
        <tr>
          <td valign="top" class="bodyText"><p><%=p.getDescr() %><br><br></p>
			<p><strong>Nomal Price:  <%=p.getNormalPrice() %><br><br>
                       Member Price:  <%=p.getMemberPrice() %><br><br>
                       </strong></p>
                       <p> <a href="buy.jsp?id=<%=id %>"><button type="button" >I want buy it</button></a>
                       </td>
          
                       
        </tr>
      </table>
	<br>	</td>
	<td>&nbsp;</td>
	</tr>

	<tr>
	<td width="15">&nbsp;<br>
	&nbsp;<br>	</td>
    <td width="35">&nbsp;</td>
    <td width="710">&nbsp;</td>
	<td width="100%">&nbsp;</td>
  </tr>
</table>
</body>
</html>


