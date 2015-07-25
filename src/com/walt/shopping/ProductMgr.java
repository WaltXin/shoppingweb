 package com.walt.shopping;

import java.util.*;
import com.walt.shopping.dao.*;

public class ProductMgr {
	
	private static ProductMgr pm = null;
	private int pageCount = 0;
	
	static {
		if(pm==null) {
			pm=new ProductMgr();
			pm.setDao(new ProductMySQLDAO());
		}
	}
	
	
	private ProductMgr(){}
	
	public static ProductMgr getInstance() {
		return pm;
	}
	
	ProductDAO dao;
	
	
	
    public List<Product> getProducts() {
    	return dao.getProducts();
    }
    
    public List<Product> Page(int pageNo,int pageSize) {
    	return dao.Page(pageNo,pageSize);
    }
    
    public int getProducts(List<Product> products,int pageNo,int pageSize) {
    	return dao.getProducts(products,pageNo,pageSize);
    }
    
    public int findProducts(List<Product> list,int[] categoryId,String keyword, 
    		                                double lowNormalPrice, double highNormalPrice,
    		                                double lowMemberPrice, double highMemberPrice,
    		                                Date startDate, Date endDate,
    		                                int pageNo,int pageSize) {
    	
    	return dao.findProducts(list,categoryId, keyword, lowNormalPrice, highNormalPrice, lowMemberPrice, highMemberPrice, startDate, endDate, pageNo, pageSize);
    }
    
    public List<Product> findProducts(String name) {

     return null;
    }
    
    public boolean deleteProductByCategoryId(int categoryId) {
    	return false;
    }
    
    public boolean deleteProductsById(int[] idArray) {
    	return false;
    }
    
    public boolean updateProduct(Product p) {
    	return dao.updateProduct(p);
    }

	public ProductDAO getDao() {
		return dao;
	}

	public void setDao(ProductDAO dao) {
		this.dao = dao;
	}
    
    
    public boolean addProduct(Product p) {
    	return dao.addProduct(p);
    }

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
    
    public Product loadById(int id) {
    	return dao.loadById(id);
    }
    
    public boolean update(Product p) {
    	return dao.updateProduct(p);
    }
    
    
    public List<Product> getLatestProduct(int count) {
    	return dao.getLatestProduct(count);
    }
    
    
    
    
    
    
    
    
    
}
