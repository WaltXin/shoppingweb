<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
String strId = request.getParameter("id");
if(strId==null||strId.trim().equals("")) {
     out.println("wrong product id ");
     return;
}
 
 int id = Integer.parseInt(strId);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html> 
  <head>
    <title>index.html</title>

    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">

    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->

  </head>

   <body>
   <form action="../servlet/FileUpload" method="post" enctype="multipart/form-data" name="form1">
   <input type="hidden" name="id" value="<%=id %>">
  <input type="file" name="file">
  <input type="submit" name="Submit" value="upload">
</form>
   <form action="./servlet/HelloWord" method="post">
    <input type="submit"/>
    </form>
    <form name="uploadform" method="POST" action="./servlet/FileUpload" ENCTYPE="multipart/form-data">

        <table border="1" width="450" cellpadding="4" cellspacing="2" bordercolor="#9BD7FF">

        <tr><td width="100%" colspan="2">

                        File1:<input name="x" size="40" type="file">

        </td></tr>

        <tr><td width="100%" colspan="2">

                        File2:<input name="y" size="40" type="file">

        </td></tr>

        <tr><td width="100%" colspan="2">

                        File3:<input name="z" size="40" type="file">

        </td></tr>

        </table>

        <br/><br/>

        <table>

        <tr><td align="center"><input name="upload" type="submit" value="upload"/></td></tr>

       </table>

</form>

  </body>
</html>