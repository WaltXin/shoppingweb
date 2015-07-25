package com.walt.shopping.util;
import java.sql.*;


public class DB {
     
    static {
    	try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
    }
  
    private DB() {}
    
    public static Connection getConn() {
    	Connection conn = null;
    	try {
    		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping?user=root&password=root");
    	}catch(SQLException e) { 
    		e.printStackTrace();
    	}
    	return conn;
    }
    
    public static void closeConn(Connection conn) {
    	try{
    		if(conn!=null)
    			conn.close();
    	}catch(SQLException e) {
    		e.printStackTrace();
    	}
    }
    
    public static Statement getStmt(Connection conn) {
    	Statement stmt = null;
    	try {
			stmt = conn.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	return stmt;
    	
    }
    
    public static PreparedStatement prepStmt(Connection conn,String sql) {
    	PreparedStatement pStmt = null;
    	try {
			pStmt = conn.prepareStatement(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	return pStmt;
    	
    }
    
    public static PreparedStatement prepStmt(Connection conn,String sql,boolean generatedKey) {
    	PreparedStatement pStmt = null;
    	try {
			pStmt = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	return pStmt;
    	
    }
    
    public static void closeStmt(Statement stmt) {
    	try {
			if(stmt!=null) {
				stmt.close();
				stmt=null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
    }
    
    public static  ResultSet executeQuery(Statement stmt,String sql) {
    	ResultSet rs = null;
    	try {
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	return rs;
    }
    
    public static void closeRs(ResultSet rs) {
    	try {
			if(rs!=null) {
				rs.close();
				rs=null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
    }
    
    public static ResultSet executeQuery(Connection conn, String sql) {
    	ResultSet rs = null;
    	try {
			rs = conn.createStatement().executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	return rs;
    }
    
    public static void executeUpdate(Connection conn,String sql) {
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.closeStmt(stmt);
		}
	}
}




























