package com.walt.shopping;

 import java.util.List;

import com.walt.shopping.dao.*;
public class OrderMgr {
   // private OrderMySQLDAO dao;
    private static OrderMgr om = null;
	private int pageCount = 0;
	
	static {
		if(om==null) {
			om=new OrderMgr();
			om.setDao(new OrderMySQLDAO());
		}
	}
	
	
	private OrderMgr(){}
	
	public static OrderMgr getInstance() {
		return om;
	}
	
	OrderMySQLDAO dao;

	public OrderMySQLDAO getDao() {
		return dao;
	}

	public void setDao(OrderMySQLDAO dao) {
		this.dao = dao;
	}
	
	public void saveOrder(SalesOrder so) {
		dao.saveOrder(so);
	}
	
	public int getOrders(List<SalesOrder> list,int pageNo,int pageSize) {
		return dao.getOrders(list,pageNo,pageSize);
	}
	
	public SalesOrder loadById(int id) {
		return dao.loadById(id);
	}

	public  List<SalesItem> getSalesItems(SalesOrder order) {
		return dao.getSalesItems(order);
	}

	public  void updateStatus(SalesOrder order) {
		  dao.updateStatus(order);
		
	}
	
}
