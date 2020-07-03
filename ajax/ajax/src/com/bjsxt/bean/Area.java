package com.bjsxt.bean;

public class Area {
	private int id;
	private String name;
	private int pid;
	public Area() {
		super();
	}
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
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	@Override
	public String toString() {
		return "Area [id=" + id + ", name=" + name + ", pid=" + pid + "]";
	}
	
}
