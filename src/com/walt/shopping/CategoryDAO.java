package com.walt.shopping;

import java.sql.*;
import java.util.List;

import com.walt.shopping.util.*;

public class CategoryDAO {
    public static void save(Category c) {
    	Connection conn =DB.getConn();
    	
		String sql = null;
		if(c.getId()==-1) {
			sql="insert into category values (null,?,?,?,?,?)";
		}else {
			sql="insert into category values ("+c.getId()+",?,?,?,?,?)";
		}
		PreparedStatement pstmt = DB.prepStmt(conn,sql);
		try {	
			pstmt.setString(1, c.getName());
			pstmt.setString(2, c.getDescr());
			pstmt.setInt(3, c.getPid());
			pstmt.setInt(4,c.isLeaf()?0:1);
			pstmt.setInt(5, c.getGrade());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DB.closeStmt(pstmt);
			DB.closeConn(conn);
		}
    }
    
     public static void getCategories(List<Category> list,int id) {
    	 Connection conn = null;
     	 //ResultSet rs =null;
 		
 		try {	
 			conn = DB.getConn();
 			getCategories(conn,list,id);
 		} finally {
 			//DB.closeStmt(pstmt);
 			
 			DB.closeConn(conn);
 			//DB.closeRs(rs);
 		}
	 }
     
     private static void getCategories(Connection conn,List<Category> list,int id) {
    	// Connection conn =DB.getConn();
     	 ResultSet rs =null;
 		
 		
 		//PreparedStatement pstmt = DB.prepStmt(conn,sql);
 		try {	
 			String sql = "select * from category where pid="+id;
 			rs = DB.executeQuery(conn, sql);
 			while(rs.next()) {
 				Category c = new Category();
 				c.setId(rs.getInt("id"));
 				c.setName(rs.getString("name"));
 				c.setDescr(rs.getString("descr"));
 				c.setPid(rs.getInt("pid"));
 				c.setLeaf(rs.getInt("isleaf")==0?true:false);
 				c.setGrade(rs.getInt("grade"));
 				list.add(c);
 				if(!c.isLeaf()) {
 					getCategories(list,c.getId());
 				}
 			}
 		} catch (SQLException e) {
 			e.printStackTrace();
 		}finally {
 			//DB.closeStmt(pstmt);
 			//DB.closeConn(conn);
 			DB.closeRs(rs);
 		}
	 }

	public static void addChildCategory(int pid,String name,String descr) {
		 Connection conn =DB.getConn();
     	 ResultSet rs =null;
 		String sql = "insert into category values (null,?,?,?,?,?)";
 		
 		PreparedStatement pstmt = DB.prepStmt(conn,sql);
 		try {	
 			conn.setAutoCommit(false);
 			rs = DB.executeQuery(conn, "select * from category where id="+pid);
 			int parentGrade = 0;
 			if(rs.next())
 			  parentGrade = rs.getInt("grade");
 			pstmt.setString(1, name);
			pstmt.setString(2, descr);
			pstmt.setInt(3, pid);
			pstmt.setInt(4,0);
			pstmt.setInt(5, parentGrade+1);
			pstmt.executeUpdate();
			//update the parent node not leaf node
			DB.executeUpdate(conn, "update category set isleaf =1 where id = "+pid);
			conn.commit();
			conn.setAutoCommit(true);
 		} catch (SQLException e) {
 			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
 			e.printStackTrace();
 		}finally {
 			DB.closeStmt(pstmt);
 			DB.closeConn(conn);
 			DB.closeRs(rs);
 		}
	}

	public static Category loadById(int id) {
		Connection conn =null;
		Category c = null;
		ResultSet rs = null;
		try {
			conn=DB.getConn();
			rs=DB.executeQuery(conn, "select * from category where id ="+id);
			if(rs.next()) {
				c = new Category();
				c.setId(rs.getInt("id"));
 				c.setName(rs.getString("name"));
 				c.setDescr(rs.getString("descr"));
 				c.setPid(rs.getInt("pid"));
 				c.setLeaf(rs.getInt("isleaf")==0?true:false);
 				c.setGrade(rs.getInt("grade"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
 			DB.closeConn(conn);
 			DB.closeRs(rs);
 		}
		return c;
	}

	public static void delete(int id) {
		Connection conn = null;
		Statement stmt = null;
		try {
			conn = DB.getConn();
			stmt = DB.getStmt(conn);
		    stmt.executeUpdate("delete from category where pid="+id);
			stmt.executeUpdate("delete from category where id = "+id); 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeStmt(stmt);
			DB.closeConn(conn);
		}
		
	}
	
	
	
	
	
	
	
	
	
}
