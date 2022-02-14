package com.inspur.cmis.permit.user.model;



@org.apache.ibatis.type.Alias(value = "user")

public class User {
	private int men_id;
	private String cname;
	private String   isenable;
	private String  men_sex;
	private String  register_time;
	private String  last_time;
	private int     roleid;
	private String  men_born;
	private int pageNo;
	private int pageSize;
	
	
	
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
	public String getMen_sex() {
		return men_sex;
	}
	public void setMen_sex(String men_sex) {
		this.men_sex = men_sex;
	}
	public String getMen_born() {
		return men_born;
	}
	public void setMen_born(String men_born) {
		this.men_born = men_born;
	}
	
	public int getRoleid() {
		return roleid;
	}
	public void setRoleid(int roleid) {
		this.roleid = roleid;
	}
	public int getMen_id() {
		return men_id;
	}
	public void setMen_id(int men_id) {
		this.men_id = men_id;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	
	public String getIsenable() {
		return isenable;
	}
	public void setIsenable(String isenable) {
		this.isenable = isenable;
	}
	public String getRegister_time() {
		return register_time;
	}
	public void setRegister_time(String register_time) {
		this.register_time = register_time;
	}
	public String getLast_time() {
		return last_time;
	}
	public void setLast_time(String last_time) {
		this.last_time = last_time;
	}
	

}
