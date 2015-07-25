<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="_sessioncheck.jsp" %>
<%@ page import ="java.sql.*,com.walt.shopping.*,java.util.*" %>


<%
 int id = Integer.parseInt(request.getParameter("id"));
 SalesOrder so = OrderMgr.getInstance().loadById(id);
   
  String action = request.getParameter("action");
  if(action != null && action.equals("modify") ) {
	int status = Integer.parseInt(request.getParameter("status"));
	so.setStatus(status);
	so.updateStatus(); 
}
 %>
 

 
<center>
     orderBy:<%=so.getUser().getUsername() %>
     <form name="form" action="ordermodify.jsp" method="post">
       <input type="hidden" name="action" value="modify">
       <input type="hidden" name="id" value="<%=id%>">
      <select name="status">
         <option value="0">to do </option>
          <option value="1">done </option>
           <option value="2">destroy </option>
      </select>
      <br>
       <input type="submit" value="ok">
     </form>
</center>

 <!--  <script type="text/javascript">
   for(var option in document.forms("form").status.options) {
       if(option.value=<%=so.getStatus()%>) {
          document.forms("form").status.selectedIndex = option.index;
       }
   }
 
</script>
-->

<script type="text/javascript">
	//alert(document.forms("form").status.options.length);
	for(i=0; i<document.forms("form").status.options.length; i++) {

		if(document.forms("form").status.options[i].value == <%=so.getStatus()%>) {
			document.forms("form").status.selectedIndex = i;
		}
		
	}
</script>

