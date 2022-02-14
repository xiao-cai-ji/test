package com.inspur.cmis.client.model;
@org.apache.ibatis.type.Alias(value="certificate")
public class Certificate {
	private String cm_key;//主键
	private int  cm_id;//客户经理编号
	private String cm_certificate_name;//证书名称
	private String cm_certificate_type;//证书类型
	private String cm_certificate_no;//证书编号
	private String cm_certificate_unit;//发证单位
	private String cm_start_date;//发证时间
	private String cm_end_date;//失效时间
	private int cm_period;//有效性
	private String cm_certificate_url;//证书路径
	private String cm_invalid;//作废标识
	private String cm_remark;//备注
	private String cm_modification_date;//维护日期
	private String cm_modification_person;//维护人
	private String cm_name;

	private String cm_year;
	
	
	private int pageNo;
	private int pageSize;
	
	private int type_id;
	private String type_name;
	
	
	
	
	
	
	public int getType_id() {
		return type_id;
	}
	public void setType_id(int type_id) {
		this.type_id = type_id;
	}
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	public String getCm_year() {
		return cm_year;
	}
	public void setCm_year(String cm_year) {
		this.cm_year = cm_year;
	}
	public String getCm_name() {
		return cm_name;
	}
	public void setCm_name(String cm_name) {
		this.cm_name = cm_name;
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
	public String getCm_key() {
		return cm_key;
	}
	public void setCm_key(String cm_key) {
		this.cm_key = cm_key;
	}
	
	public int getCm_id() {
		return cm_id;
	}
	public void setCm_id(int cm_id) {
		this.cm_id = cm_id;
	}
	public String getCm_certificate_name() {
		return cm_certificate_name;
	}
	public void setCm_certificate_name(String cm_certificate_name) {
		this.cm_certificate_name = cm_certificate_name;
	}
	public String getCm_certificate_type() {
		return cm_certificate_type;
	}
	public void setCm_certificate_type(String cm_certificate_type) {
		this.cm_certificate_type = cm_certificate_type;
	}
	public String getCm_certificate_no() {
		return cm_certificate_no;
	}
	public void setCm_certificate_no(String cm_certificate_no) {
		this.cm_certificate_no = cm_certificate_no;
	}
	public String getCm_certificate_unit() {
		return cm_certificate_unit;
	}
	public void setCm_certificate_unit(String cm_certificate_unit) {
		this.cm_certificate_unit = cm_certificate_unit;
	}
	public String getCm_start_date() {
		return cm_start_date;
	}
	public void setCm_start_date(String cm_start_date) {
		this.cm_start_date = cm_start_date;
	}
	public String getCm_end_date() {
		return cm_end_date;
	}
	public void setCm_end_date(String cm_end_date) {
		this.cm_end_date = cm_end_date;
	}
	public int getCm_period() {
		return cm_period;
	}
	public void setCm_period(int cm_period) {
		this.cm_period = cm_period;
	}
	public String getCm_certificate_url() {
		return cm_certificate_url;
	}
	public void setCm_certificate_url(String cm_certificate_url) {
		this.cm_certificate_url = cm_certificate_url;
	}
	public String getCm_invalid() {
		return cm_invalid;
	}
	public void setCm_invalid(String cm_invalid) {
		this.cm_invalid = cm_invalid;
	}
	public String getCm_remark() {
		return cm_remark;
	}
	public void setCm_remark(String cm_remark) {
		this.cm_remark = cm_remark;
	}
	public String getCm_modification_date() {
		return cm_modification_date;
	}
	public void setCm_modification_date(String cm_modification_date) {
		this.cm_modification_date = cm_modification_date;
	}
	public String getCm_modification_person() {
		return cm_modification_person;
	}
	public void setCm_modification_person(String cm_modification_person) {
		this.cm_modification_person = cm_modification_person;
	}

}
