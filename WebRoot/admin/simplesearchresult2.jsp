<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ page import="com.walt.shopping.*" import="java.sql.*" %>

<%@ include file="_sessioncheck.jsp" %>


<%

String action = request.getParameter("action");

//List<Category> categories = Category.getCategories();
List<Product> products = new ArrayList<Product>();
int pageCount = 0;
String keyword=null;

String strCategoryIdQuery = "";

    int pageNo =1;
       
    String strPageNo = request.getParameter("pageNo");
    if(strPageNo!=null&&!strPageNo.trim().equals("")) {
       pageNo = Integer.parseInt(strPageNo);
    }
    
     int categoryId = 0;
    
    //simplesearch2
     keyword = request.getParameter("keyword");
    String[] strCategoryIds = request.getParameterValues("categoryid");
    int[] idArray;
  
    if(strCategoryIds == null||strCategoryIds.length==0) 
    {
      idArray = null;
    }else {
    
     for(int i=0;i<strCategoryIds.length;i++) {
        strCategoryIdQuery += "&categoryid="+ strCategoryIds[i];
      }
    
       idArray = new int[strCategoryIds.length];
      for(int i=0;i<strCategoryIds.length;i++) {
       idArray[i] = Integer.parseInt(strCategoryIds[i]);
       
      }
   
      products = new ArrayList<Product>();
    
      pageCount = ProductMgr.getInstance().findProducts(products,idArray, keyword, -1, -1, -1, -1, null, null, pageNo, 5); 
      }
     
     %>
    
     <!-- show the result -->
     <center>
    search result
    </center>
    <table  border="1" align ="center" > <!-- border="1" align ="center" -->
       <tr>
         <td>ID </td>
         <td>name </td>
         <td>descr </td> 
         <td>normalprice</td>
         <td>memberprice </td>
         <td>pdate</td> 
         <td>categoryid</td> 
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
         <td><%=p.getCategoryId() %></td>
         <td>
             <a href="productdelete.jsp?id=<%=p.getId() %>" target="detail">Delete</a>
             &nbsp;
             <a href="productmodify.jsp?id=<%=p.getId() %>" target="detail">Modify</a>
             &nbsp;
         </td> 
       </tr>
       <%
       }
        %>
      </table>
     <center>
      all: <%=pageCount %>
      &nbsp;
     
      <a href="<%=request.getContextPath()%>/admin/productsearch.jsp?action=<%=action%>&keyword=<%=keyword %>&pageNo=<%=pageNo+1 %><%=strCategoryIdQuery %>" >next page</a>      
    </center>
  
      <!-- show the result -->