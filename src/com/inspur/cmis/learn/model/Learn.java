package com.inspur.cmis.learn.model;

@org.apache.ibatis.type.Alias(value = "learn1")

public class Learn {
	private int l_key;
	private String l_name;
	private int l_type;
	private String l_des;
	private String l_url;
	private String l_uper;
	private String l_date;
	private String l_down;
	private int pageNo;
	private int pageSize;
	private String lt_name;
	private int lt_id;
	private String ispublic;
	
	private String l_fileName;
	
	
	

	
	
	
	public String getL_fileName() {
		return l_fileName;
	}
	public void setL_fileName(String l_fileName) {
		this.l_fileName = l_fileName;
	}
	public int getLt_id() {
		return lt_id;
	}
	public void setLt_id(int lt_id) {
		this.lt_id = lt_id;
	}
	public String getIspublic() {
		return ispublic;
	}
	public void setIspublic(String ispublic) {
		this.ispublic = ispublic;
	}
	public String getLt_name() {
		return lt_name;
	}
	public void setLt_name(String lt_name) {
		this.lt_name = lt_name;
	}
	public String getL_down() {
		return l_down;
	}
	public void setL_down(String l_down) {
		this.l_down = l_down;
	}
	public int getL_key() {
		return l_key;
	}
	public void setL_key(int l_key) {
		this.l_key = l_key;
	}
	public String getL_name() {
		return l_name;
	}
	public void setL_name(String l_name) {
		this.l_name = l_name;
	}
	public int getL_type() {
		return l_type;
	}
	public void setL_type(int l_type) {
		this.l_type = l_type;
	}
	public String getL_des() {
		return l_des;
	}
	public void setL_des(String l_des) {
		this.l_des = l_des;
	}
	public String getL_url() {
		return l_url;
	}
	public void setL_url(String l_url) {
		this.l_url = l_url;
	}
	public String getL_uper() {
		return l_uper;
	}
	public void setL_uper(String l_uper) {
		this.l_uper = l_uper;
	}
	public String getL_date() {
		return l_date;
	}
	public void setL_date(String l_date) {
		this.l_date = l_date;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	

}
