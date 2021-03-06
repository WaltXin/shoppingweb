package com.walt.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


import com.walt.shopping.Category;
import com.walt.shopping.Product;
import com.walt.shopping.util.DB;

public class ProductMySQLDAO implements ProductDAO{
	
	    public List<Product> getProducts() {
	    	Connection conn =null;
	 		ResultSet rs = null;
	 		List<Product> list = new ArrayList<Product>();
	 		try {	
	 			conn = DB.getConn();
	 			String sql="select * from product";
	 			rs = DB.executeQuery(conn, sql);
	 			while(rs.next()) {
	 				Product p = new Product();
	 				p.setId(rs.getInt("id"));
	 				p.setName(rs.getString("name"));
	 				p.setDescr(rs.getString("descr"));
	 				p.setNormalPrice(rs.getDouble("normalprice"));
	 				p.setMemberPrice(rs.getDouble("memberprice"));
	 				p.setPdate(rs.getTimestamp("pdate"));
	 				p.setCategoryId(rs.getInt("categoryid"));
	 				
	 				list.add(p);
	 			}
	 		} catch (SQLException e) {
	 			e.printStackTrace();
	 		}finally {
	 			DB.closeRs(rs);
	 			DB.closeConn(conn);
	 		}
	    	return list;
	    }
	    
	    public List<Product> Page(int pageNo,int pageSize) {
	    	Connection conn =null;
	 		ResultSet rs = null;
	 		List<Product> pagelist = new ArrayList<Product>();
	 		try {	
	 			conn = DB.getConn();
	 			String sql="select product.id,product.name,product.descr,product.normalprice,product.memberprice,product.pdate,product.categoryid " +
	 			         "category.id cid,category.name cname,category.descr cdescr,category.pid,category.isleaf,category.grade"+
	 					" from product join category on(product.categoryid=categoryid) limit "+ (pageNo-1)*pageSize +","+pageSize;
	 			rs = DB.executeQuery(conn, sql);
	 			while(rs.next()) {
	 				Product p = new Product();
	 				p.setId(rs.getInt("id"));
	 				p.setName(rs.getString("name"));
	 				p.setDescr(rs.getString("descr"));
	 				p.setNormalPrice(rs.getDouble("normalprice"));
	 				p.setMemberPrice(rs.getDouble("memberprice"));
	 				p.setPdate(rs.getTimestamp("pdate"));
	 				p.setCategoryId(rs.getInt("categoryid"));
	 				
	 				Category c = new Category();
	 				c.setId(rs.getInt("cid"));
	 				c.setName(rs.getString("cname"));
	 				c.setDescr(rs.getString("cdescr"));
	 				c.setPid(rs.getInt("pid"));
	 				c.setLeaf(rs.getInt("isleaf")==0?true:false);
	 				c.setGrade(rs.getInt("grade"));
	 				
	 				p.setCategory(c);
	 				
	 				pagelist.add(p);
	 			}
	 		   
	 			
	 		} catch (SQLException e) {
	 			e.printStackTrace();
	 		}finally {
	 			DB.closeRs(rs);
	 			DB.closeConn(conn);
	 		}
	    	return pagelist;
	    }
	    
	    public int findProducts(List<Product> list,int[] categoryId,String keyword,
                double lowNormalPrice, double highNormalPrice,
                double lowMemberPrice, double highMemberPrice,
                Date startDate, Date endDate,
                int pageNo,int pageSize) {
	    	
	    	Connection conn =null;
	 		ResultSet rs = null;
	 		ResultSet rsCount = null;
	 		int pageCount = 0;
	 		try {	
	 			conn = DB.getConn();
	 			//String sql="select * from product limit "+ (pageNo-1)*pageSize +","+pageSize;
	 			String sql ="select * from product where 1=1 ";
	 			 String strId="";
	 			 //(2,3)
	 			if(categoryId!=null&&categoryId.length>0)
	 			{
		 		      strId+="(";
	 				for(int i=0;i<categoryId.length;i++) {
	 					if(i<categoryId.length-1) {
	 					strId+=categoryId[i]+",";
	 					}else {
	 						strId+=categoryId[i];
	 					}
	 				}
	 				 strId+=")";
	 				 sql+=" and categoryid in"+strId;
	 			}
	 			
	 			if(keyword != null && !keyword.trim().equals("")) {
	 				sql += " or name like '%" + keyword + "%' or descr like '%" + keyword + "%'";
	 			}
	 			
	 			if(lowNormalPrice>=0) {
	 				sql+=" and normalprice > "+lowNormalPrice;
	 			}
	 			
	 			if(highNormalPrice>0) {
	 				sql+=" and normalprice < "+highNormalPrice;
	 			}
	 			
	 			if(lowMemberPrice>=0) {
	 				sql+=" and memberprice > "+lowMemberPrice;
	 			}
	 			
	 			if(highNormalPrice>0) {
	 				sql+=" and memberprice < "+highMemberPrice;
	 			}
	 			
	 			if(startDate!=null) {
	 				sql+=" and pdate > '"+ new SimpleDateFormat("yyyy-MM-dd").format(startDate)+"'";
	 			}
	 			
	 			if(endDate!=null) {
	 				sql+=" and pdate <= '"+ new SimpleDateFormat("yyyy-MM-dd").format(endDate)+"'";
	 			}
	 			// because * is different can't find out  replace select * to select count(*)
	 			String sqlCount = sql.replaceFirst("select \\*", "select count(*)");
	 			sql+=" limit "+(pageNo-1)*pageSize+","+pageSize;
	 		   	System.out.println(sql);
	 			//System.out.println(pageNo);
	 			//System.out.println(pageSize);
	 		   	
	 		   	
	 		   	rsCount = DB.executeQuery(conn, sqlCount);
	 		   	rsCount.next();
	 		   	pageCount = (rsCount.getInt(1)+pageSize-1)/pageSize;
	 			rs = DB.executeQuery(conn, sql);
	 			while(rs.next()) {
	 				Product p = new Product();//error
	 				p.setId(rs.getInt("id"));
	 				p.setName(rs.getString("name"));
	 				p.setDescr(rs.getString("descr"));
	 				p.setNormalPrice(rs.getDouble("normalprice"));
	 				p.setMemberPrice(rs.getDouble("memberprice"));
	 				p.setPdate(rs.getTimestamp("pdate"));
	 				p.setCategoryId(rs.getInt("categoryid"));
	 				list.add(p);
	 			}
	 		   
	 			
	 		} catch (SQLException e) {
	 			e.printStackTrace();
	 		}finally {
	 			DB.closeRs(rs);
	 			DB.closeConn(conn);
	 		}
	    	return pageCount;

            //return null;
        }
	      
       public boolean deleteProductByCategoryId(int categoryId) {
       	return false;
       }
	        
       public boolean deleteProductsById(int[] idArray) {
       	return false;
       }
       
       public boolean updateProduct(Product p) {
    	   Connection conn =null;
    		PreparedStatement pstmt = null;
    		try {	
    			conn = DB.getConn();
    			String sql="update product set name=? ,descr=? ,normalprice=? ,memberprice=? ,categoryid=? ,where id=?";
    			pstmt = DB.prepStmt(conn, sql);
    			pstmt.setString(1, p.getName());
    			pstmt.setString(2, p.getDescr());
    			pstmt.setDouble(3, p.getNormalPrice());
    			pstmt.setDouble(4, p.getMemberPrice());
    			pstmt.setInt(5, p.getCategoryId());
    			pstmt.setInt(6, p.getId());
    			pstmt.executeUpdate();
    			
    		} catch (SQLException e) {
    			e.printStackTrace();
    			return false; 
    		}finally {
    			DB.closeStmt(pstmt);
    			DB.closeConn(conn);
    		}
   		return true;
       }

	@Override
	public boolean addProduct(Product p) {
		Connection conn =null;
 		PreparedStatement pstmt = null;
 		try {	
 			conn = DB.getConn();
 			String sql="insert into product values(null,?,?,?,?,?,?)";
 			pstmt = DB.prepStmt(conn, sql);
 			pstmt.setString(1, p.getName());
 			pstmt.setString(2, p.getDescr());
 			pstmt.setDouble(3, p.getNormalPrice());
 			pstmt.setDouble(4, p.getMemberPrice());
 			pstmt.setTimestamp(5, p.getPdate());
 			pstmt.setInt(6, p.getCategoryId());
 			pstmt.executeUpdate();
 			
 		} catch (SQLException e) {
 			e.printStackTrace();
 			return false; 
 		}finally {
 			DB.closeStmt(pstmt);
 			DB.closeConn(conn);
 		}
		return true;
	}

	@Override
	public int getProducts(List<Product> products, int pageNo, int pageSize) {
		Connection conn =null;
 		ResultSet rs = null;
 		ResultSet rscount = null;
 		int pageCount = 0;
 		try {	
 			conn = DB.getConn();
 			rscount=DB.executeQuery(conn, "select count(*) from product");
 			rscount.next();
 			pageCount=(rscount.getInt(1)+pageSize-1)/pageSize;
 			String sql="select product.id,product.name,product.descr,product.normalprice,product.memberprice,product.pdate,product.categoryid " +
			         ",category.id cid,category.name cname,category.descr cdescr,category.pid,category.isleaf,category.grade"+
					" from product join category on(product.categoryid=categoryid) limit "+ (pageNo-1)*pageSize +","+pageSize;
			rs = DB.executeQuery(conn, sql);
			while(rs.next()) {
				Product p = new Product();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setDescr(rs.getString("descr"));
				p.setNormalPrice(rs.getDouble("normalprice"));
				p.setMemberPrice(rs.getDouble("memberprice"));
				p.setPdate(rs.getTimestamp("pdate"));
				p.setCategoryId(rs.getInt("categoryid"));
				
				Category c = new Category();
				c.setId(rs.getInt("cid"));
				c.setName(rs.getString("cname"));
				c.setDescr(rs.getString("cdescr"));
				c.setPid(rs.getInt("pid"));
				c.setLeaf(rs.getInt("isleaf")==0?true:false);
				c.setGrade(rs.getInt("grade"));
				
				p.setCategory(c);
				
				products.add(p);
			}
 			
 		} catch (SQLException e) {
 			e.printStackTrace();
 		}finally {
 			DB.closeRs(rs);
 			DB.closeRs(rscount);
 			DB.closeConn(conn);
 		}
    	return pageCount;
	}
    
	/**
	 * return null if data Not in database
	 */
	@Override
	public Product loadById(int id) {
		Product p = null;
		Connection conn =null;
 		ResultSet rs = null;
 		try {	
 			conn = DB.getConn();
 			String sql="select product.id,product.name,product.descr,product.normalprice,product.memberprice,product.pdate,product.categoryid " +
			         ",category.id cid,category.name cname,category.descr cdescr,category.pid,category.isleaf,category.grade"+
					" from product join category on(product.categoryid=categoryid) where product.id= "+id;
 			rs = DB.executeQuery(conn, sql);
 			if(rs.next()) {
 			    p = new Product();
 				p.setId(rs.getInt("id"));
 				p.setName(rs.getString("name"));
 				p.setDescr(rs.getString("descr"));
 				p.setNormalPrice(rs.getDouble("normalprice"));
 				p.setMemberPrice(rs.getDouble("memberprice"));
 				p.setPdate(rs.getTimestamp("pdate"));
 				p.setCategoryId(rs.getInt("categoryid"));
 				
 				Category c = new Category();
				c.setId(rs.getInt("cid"));
				c.setName(rs.getString("cname"));
				c.setDescr(rs.getString("cdescr"));
				c.setPid(rs.getInt("pid"));
				c.setLeaf(rs.getInt("isleaf")==0?true:false);
				c.setGrade(rs.getInt("grade"));
				
				p.setCategory(c);
 				
 				
 			}
 		} catch (SQLException e) {
 			e.printStackTrace();
 		}finally {
 			DB.closeRs(rs);
 			DB.closeConn(conn);
 		}
    	
		return p;
	}

	@Override
	public List<Product> getLatestProduct(int count) {
		Connection conn =null;
 		ResultSet rs = null;
 		List<Product> list = new ArrayList<Product>();
 		try {	
 			conn = DB.getConn();
 			String sql="select * from product order by pdate desc limit 0,"+count;
 			rs = DB.executeQuery(conn, sql);
 			while(rs.next()) {
 				Product p = new Product();
 				p.setId(rs.getInt("id"));
 				p.setName(rs.getString("name"));
 				p.setDescr(rs.getString("descr"));
 				p.setNormalPrice(rs.getDouble("normalprice"));
 				p.setMemberPrice(rs.getDouble("memberprice"));
 				p.setPdate(rs.getTimestamp("pdate"));
 				p.setCategoryId(rs.getInt("categoryid"));
 				
 				list.add(p);
 			}
 		} catch (SQLException e) {
 			e.printStackTrace();
 		}finally {
 			DB.closeRs(rs);
 			DB.closeConn(conn);
 		}
    	return list;
	}
}
