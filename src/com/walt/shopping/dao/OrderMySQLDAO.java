package com.walt.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.walt.shopping.Cart;
import com.walt.shopping.CartItem;
import com.walt.shopping.Category;
import com.walt.shopping.Product;
import com.walt.shopping.SalesItem;
import com.walt.shopping.SalesOrder;
import com.walt.shopping.User;
import com.walt.shopping.util.DB;

public class OrderMySQLDAO {

	public void saveOrder(SalesOrder so) {
        
		Connection conn =null;
 		PreparedStatement pstmt = null;
 		ResultSet rsKey = null;
 		
 		try {	
 			conn = DB.getConn();
 			conn.setAutoCommit(false);
 			String sql="insert into salesorder values(null,?,?,?,?)";
 			pstmt = DB.prepStmt(conn, sql,true);
 			pstmt.setInt(1, so.getUser().getId());
 			pstmt.setString(2, so.getAddr());
 			pstmt.setTimestamp(3, so.getoDate());
 			pstmt.setDouble(4, so.getStatus());
 			pstmt.executeUpdate();
 			rsKey = pstmt.getGeneratedKeys(); 
 			rsKey.next();
 			int key = rsKey.getInt(1);
 			
 			String sqlItem = "insert into salesitem values (null,?,?,?,?)";
 			pstmt = DB.prepStmt(conn, sqlItem);
 			Cart c = so.getCart();
 			List<CartItem> items = c.getItems();
 			for(int i=0;i<items.size();i++) {
 				CartItem ci = items.get(i);
 				pstmt.setInt(1, ci.getProductId());
 				pstmt.setDouble(2, ci.getPrice());
 				pstmt.setInt(3, ci.getCount());
 				pstmt.setInt(4,key);
 				pstmt.addBatch();
 			}
 			pstmt.executeBatch();
 			conn.commit();
 			conn.setAutoCommit(true);
 			
 		} catch (SQLException e) {
 			e.printStackTrace();
 			
 			try {
				conn.rollback();
				conn.setAutoCommit(true);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

 		}finally {
 			DB.closeStmt(pstmt);
 			DB.closeRs(rsKey);
 			DB.closeConn(conn);
 		}

	}

	public int getOrders(List<SalesOrder> list, int pageNo,int pageSize) {
		Connection conn =null;
 		ResultSet rs = null;
 		ResultSet rscount = null;
 		int pageCount = 0;
 		try {	
 			conn = DB.getConn();
 			rscount=DB.executeQuery(conn, "select count(*) from salesorder");
 			rscount.next();
 			pageCount=(rscount.getInt(1)+pageSize-1)/pageSize;
 			String sql = "select salesorder.id, salesorder.userid, salesorder.odate, salesorder.addr, salesorder.status , "
					+ " user.id uid, user.username, user.password, user.addr uaddr, user.phone, user.rdate from salesorder "
					+ " left join user on (salesorder.userid = user.id)"
					+ " limit " + (pageNo - 1) * pageSize + "," + pageSize;
			rs = DB.executeQuery(conn, sql);
			while(rs.next()) {
				User u = new User();
				u.setId(rs.getInt("uid"));
				u.setAddr(rs.getString("uaddr"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setRdate(rs.getTimestamp("rdate"));
				
				
				SalesOrder so = new SalesOrder();
				so.setId(rs.getInt("id"));
				so.setAddr(rs.getString("addr"));
				so.setoDate(rs.getTimestamp("odate"));
				so.setStatus(rs.getInt("status"));
				so.setUser(u);
                 
				list.add(so);
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

	public SalesOrder loadById(int id) {
		Connection conn =null;
 		ResultSet rs = null;
 		SalesOrder so = null;
 		try {	
 			conn = DB.getConn();
 			String sql = "select salesorder.id, salesorder.userid, salesorder.odate, salesorder.addr, salesorder.status , "
					+ " user.id uid, user.username, user.password, user.addr uaddr, user.phone, user.rdate from salesorder "
					+ " left join user on (salesorder.userid = user.id) where salesorder.id = "+id;
					
			rs = DB.executeQuery(conn, sql);
			if(rs.next()) {
				
				User u = new User();
				u.setId(rs.getInt("uid"));
				u.setAddr(rs.getString("uaddr"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setRdate(rs.getTimestamp("rdate"));
				
				so = new SalesOrder();
				so.setId(rs.getInt("id"));
				so.setAddr(rs.getString("addr"));
				so.setoDate(rs.getTimestamp("odate"));
				so.setStatus(rs.getInt("status"));
				so.setUser(u);
                 
				
			}
 			
 		} catch (SQLException e) {
 			e.printStackTrace();
 		}finally {
 			DB.closeRs(rs);
 			DB.closeConn(conn);
 		}
    	return so; 
	}

	public List<SalesItem> getSalesItems(SalesOrder order) {
		Connection conn =null;
 		ResultSet rs = null;
        List<SalesItem> items = new ArrayList<SalesItem>();
 		try {	
 			conn = DB.getConn();
 			String sql = "select salesorder.id, salesorder.userid, salesorder.odate, salesorder.addr, salesorder.status , "
					+ " salesitem.id itemid,salesitem.productid,salesitem.unitprice,salesitem.pcount,salesitem.orderid , "
 					+ " product.id pid, product.name,product.descr,product.normalprice,product.memberprice,product.pdate, product.categoryid"
					+ " from salesorder join salesitem on (salesorder.id= salesitem.orderid)"
					+ "join product on (salesitem.productid = product.id) where salesorder.id = "+order.getId();
			rs = DB.executeQuery(conn, sql);
			while(rs.next()) {
				Product p = new Product();
				p.setId(rs.getInt("pid"));
				p.setCategoryId(rs.getInt("categoryid"));
				p.setName(rs.getString("name"));
				p.setDescr(rs.getString("descr"));
				p.setPdate(rs.getTimestamp("pdate"));
				p.setNormalPrice(rs.getDouble("normalprice"));
				p.setMemberPrice(rs.getDouble("memberprice"));
				
				SalesItem si = new SalesItem();
                si.setOrder(order);
                si.setId(rs.getInt("itemid"));
                si.setUnitPrice(rs.getDouble("unitprice"));
                si.setCount(rs.getInt("pcount"));
                si.setProduct(p);
                
                items.add(si);
			}
 			
 		} catch (SQLException e) {
 			e.printStackTrace();
 		}finally {
 			DB.closeRs(rs);
 			DB.closeConn(conn);
 		}
    	return items; 
	}

	public void updateStatus(SalesOrder order) {
		Connection conn = DB.getConn();
		Statement stmt = DB.getStmt(conn);
		try {
			String sql = "update salesorder set status = " + order.getStatus() + " where id = " + order.getId();
			DB.executeQuery(stmt, sql);
		} finally {
			DB.closeStmt(stmt);
			DB.closeConn(conn);
		}	

		
	}
    
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
