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
double lowNormalPrice=-1;
double highNormalPrice=-1;
double lowMemberPrice=-1; 
double highMemberPrice =-1;
Timestamp startDate = null;
Timestamp endDate = null;
String strStartDate = null;
String strEndDate = null;
int pageNo =1;
       
    String strPageNo = request.getParameter("pageNo");
    if(strPageNo!=null&&!strPageNo.trim().equals("")) {
       pageNo = Integer.parseInt(strPageNo);
    }
    
     int categoryId = 0;
    
  
  
	  keyword = request.getParameter("keyword");
	  lowNormalPrice = Double.parseDouble(request.getParameter("lownormalprice")) ;
	  highNormalPrice = Double.parseDouble(request.getParameter("highnormalprice")) ;
	  lowMemberPrice = Double.parseDouble(request.getParameter("lowmemberprice")) ;
	  highMemberPrice = Double.parseDouble(request.getParameter("highmemberprice")) ;
	  categoryId = Integer.parseInt(request.getParameter("categoryid"));
	  
	  int[] idArray;
	  if(categoryId == 0) {
	    idArray = null;
	  }else {
	     idArray = new int[1];
	     idArray[0] = categoryId;
	  }

    strStartDate = request.getParameter("startdate");
    if(strStartDate==null||strStartDate.trim().equals("")) {
      startDate = null;
    }else {
       startDate = Timestamp.valueOf(request.getParameter("startdate"));
    }
     

    strEndDate = request.getParameter("enddate");
    if(strEndDate==null||strEndDate.trim().equals("")) {
      endDate = null;
    }else {
       endDate = Timestamp.valueOf(request.getParameter("enddate"));
    }
   
     products = new ArrayList<Product>();
    
     pageCount = ProductMgr.getInstance().findProducts(products,idArray, keyword, lowNormalPrice, highNormalPrice, lowMemberPrice, highMemberPrice, startDate, endDate, pageNo, 5); 
    
    %>
    
     <!-- show the result -->
     <center>
    search result
    </center>
    <table  border="1" align ="center" > <!--border="1" align ="center"  -->
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
     
      <a href="<%=request.getContextPath()%>/admin/productsearch.jsp?action=<%=action%>&keyword=<%=keyword %>&lownormalprice=<%=lowNormalPrice %>&highnormalprice=<%=highNormalPrice %>&lowmemberprice=<%=lowMemberPrice %>&highmemberprice=<%=highMemberPrice %>&startdate=<%=strStartDate %>&enddate=<%=strEndDate %>&pageNo=<%=pageNo+1 %>&categoryid=<%=categoryId %>" >next page</a>
      
    </center>
  
      <!-- show the result -->