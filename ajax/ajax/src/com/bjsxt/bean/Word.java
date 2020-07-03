package com.bjsxt.bean;

public class Word {
	private int id;
	private String title;
	private String remark;
	public Word() {
		super();
	}
	@Override
	public String toString() {
		return "Word [id=" + id + ", title=" + title + ", remark=" + remark + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}
