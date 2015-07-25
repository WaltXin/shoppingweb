package com.walt.shopping;

import java.util.ArrayList;
import java.util.List;

public class Category {
	
	
	int id;
    String name;
    String descr;
    int pid;
    boolean leaf;
    int grade;
	
    public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	public boolean isLeaf() {
		return leaf;
	}
	public void setLeaf(boolean leaf) {
		this.leaf = leaf;
	}
	
	public void addChild(Category c) {
		Category.addChildCategory(id, c.getName(), c.getDescr());
	}
	
	public void delete(int id) {
		CategoryDAO.delete(id);
	}
	
	public static void add(Category c) {
		CategoryDAO.save(c);
	}
	
	
	
	public static void addTopCategory(String name,String descr) {
		/*Category c = new Category();
		c.setId(-1);
		c.setName(name);
		c.setDescr(descr);
		c.setPid(0);
		c.setLeaf(true);
		c.setGrade(1);
		CategoryDAO.save(c);
		*/
		addChildCategory(0,name,descr);
	}
	
	public static List<Category> getCategories() {
		List<Category> list = new ArrayList<Category>();
		CategoryDAO.getCategories(list,0);
		return list;
	}
	
	public static void addChildCategory(int pid,String name,String descr) {
		CategoryDAO.addChildCategory(pid,name,descr);
	}
	
	public static Category loadById(int id) {
		return CategoryDAO.loadById(id);
	}
	 
	public static boolean isLeaf(int id) {  //if the node is leaf u can add 
		return false;
	}
	
}
