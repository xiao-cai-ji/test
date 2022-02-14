package com.inspur.cmis.client.model;

@org.apache.ibatis.type.Alias(value="client")

public class Client {
	private int cm_id; //客户经理编号
    private String cm_name; //姓名
    private String cm_sex; //性别
    private String cm_ssn; //身份证号
    private String cm_birthday; //出生年月
    private int cm_age; //年龄
    private int cm_nation; //民族 
    private String cm_political_landscape; //政治面貌 
    private String cm_hometown; //籍贯
    private String cm_photo; //照片
    private String cm_education; //学历
    private String cm_status; //客户经理状态  (在职、离职)
    private String cm_graduated; //毕业院系
    
    private String cm_professional_titles; //专业技术职称
    private String cm_hiredate; //参加工作时间
    private String cm_entry_time; //入行时间
    private int cm_financial_years; //从事金融工作年限
    private int cm_working_years; //客户经理从业年限
    private String cm_exit_time; //退出时间（离职时间）
    private String cm_level; //客户经理等级
    private String cm_unit; //所在单位（机构）
    private String cm_dept; //部门
    private String cm_position; //职务
    private String cm_tel; //办公电话
    private String cm_mobile; //移动电话
    private String cm_certificate_number; //从业资格证书编号
    private String cm_certificate_date; //从业资格证书发证时间
    private int cm_certificate_period; //从业资格证书有效性
    private String cm_status_number; //岗位证书编号
    private String cm_status_number_date; //岗位证书发证时间
    private int cm_status_number_period;  //岗位证书有效性
    private String cm_level_number; //等级资格证编号
    private String cm_level_date; //等级资格证发证日期
    private int cm_level_period; //等级资格证有效性
    private String cm_modification_date; //维护日期
    private String cm_modification_person; //维护人
    private String cm_degree; //学位
    private String cm_certificate_type;
    private int pageNo;
    private int pageSize;
    
	public String getCm_certificate_type() {
		return cm_certificate_type;
	}
	public void setCm_certificate_type(String cm_certificate_type) {
		this.cm_certificate_type = cm_certificate_type;
	}
	public int getCm_id() {
		return cm_id;
	}
	public void setCm_id(int cm_id) {
		this.cm_id = cm_id;
	}
	public String getCm_name() {
		return cm_name;
	}
	public void setCm_name(String cm_name) {
		this.cm_name = cm_name;
	}
	public String getCm_sex() {
		return cm_sex;
	}
	public void setCm_sex(String cm_sex) {
		this.cm_sex = cm_sex;
	}
	public String getCm_ssn() {
		return cm_ssn;
	}
	public void setCm_ssn(String cm_ssn) {
		this.cm_ssn = cm_ssn;
	}
	public String getCm_birthday() {
		return cm_birthday;
	}
	public void setCm_birthday(String cm_birthday) {
		this.cm_birthday = cm_birthday;
	}
	public int getCm_age() {
		return cm_age;
	}
	public void setCm_age(int cm_age) {
		this.cm_age = cm_age;
	}
	public int getCm_nation() {
		return cm_nation;
	}
	public void setCm_nation(int cm_nation) {
		this.cm_nation = cm_nation;
	}
	public String getCm_political_landscape() {
		return cm_political_landscape;
	}
	public void setCm_political_landscape(String cm_political_landscape) {
		this.cm_political_landscape = cm_political_landscape;
	}
	public String getCm_hometown() {
		return cm_hometown;
	}
	public void setCm_hometown(String cm_hometown) {
		this.cm_hometown = cm_hometown;
	}
	public String getCm_photo() {
		return cm_photo;
	}
	public void setCm_photo(String cm_photo) {
		this.cm_photo = cm_photo;
	}
	public String getCm_education() {
		return cm_education;
	}
	public void setCm_education(String cm_education) {
		this.cm_education = cm_education;
	}
	public String getCm_status() {
		return cm_status;
	}
	public void setCm_status(String cm_status) {
		this.cm_status = cm_status;
	}
	public String getCm_graduated() {
		return cm_graduated;
	}
	public void setCm_graduated(String cm_graduated) {
		this.cm_graduated = cm_graduated;
	}
	public String getCm_professional_titles() {
		return cm_professional_titles;
	}
	public void setCm_professional_titles(String cm_professional_titles) {
		this.cm_professional_titles = cm_professional_titles;
	}
	public String getCm_hiredate() {
		return cm_hiredate;
	}
	public void setCm_hiredate(String cm_hiredate) {
		this.cm_hiredate = cm_hiredate;
	}
	public String getCm_entry_time() {
		return cm_entry_time;
	}
	public void setCm_entry_time(String cm_entry_time) {
		this.cm_entry_time = cm_entry_time;
	}
	public int getCm_financial_years() {
		return cm_financial_years;
	}
	public void setCm_financial_years(int cm_financial_years) {
		this.cm_financial_years = cm_financial_years;
	}
	public int getCm_working_years() {
		return cm_working_years;
	}
	public void setCm_working_years(int cm_working_years) {
		this.cm_working_years = cm_working_years;
	}
	public String getCm_exit_time() {
		return cm_exit_time;
	}
	public void setCm_exit_time(String cm_exit_time) {
		this.cm_exit_time = cm_exit_time;
	}
	public String getCm_level() {
		return cm_level;
	}
	public void setCm_level(String cm_level) {
		this.cm_level = cm_level;
	}
	public String getCm_unit() {
		return cm_unit;
	}
	public void setCm_unit(String cm_unit) {
		this.cm_unit = cm_unit;
	}
	public String getCm_dept() {
		return cm_dept;
	}
	public void setCm_dept(String cm_dept) {
		this.cm_dept = cm_dept;
	}
	public String getCm_position() {
		return cm_position;
	}
	public void setCm_position(String cm_position) {
		this.cm_position = cm_position;
	}
	public String getCm_tel() {
		return cm_tel;
	}
	public void setCm_tel(String cm_tel) {
		this.cm_tel = cm_tel;
	}
	public String getCm_mobile() {
		return cm_mobile;
	}
	public void setCm_mobile(String cm_mobile) {
		this.cm_mobile = cm_mobile;
	}
	public String getCm_certificate_number() {
		return cm_certificate_number;
	}
	public void setCm_certificate_number(String cm_certificate_number) {
		this.cm_certificate_number = cm_certificate_number;
	}

	public String getCm_certificate_date() {
		return cm_certificate_date;
	}
	public void setCm_certificate_date(String cm_certificate_date) {
		this.cm_certificate_date = cm_certificate_date;
	}
	public int getCm_certificate_period() {
		return cm_certificate_period;
	}
	public void setCm_certificate_period(int cm_certificate_period) {
		this.cm_certificate_period = cm_certificate_period;
	}
	public String getCm_status_number() {
		return cm_status_number;
	}
	public void setCm_status_number(String cm_status_number) {
		this.cm_status_number = cm_status_number;
	}
	public String getCm_status_number_date() {
		return cm_status_number_date;
	}
	public void setCm_status_number_date(String cm_status_number_date) {
		this.cm_status_number_date = cm_status_number_date;
	}
	public int getCm_status_number_period() {
		return cm_status_number_period;
	}
	public void setCm_status_number_period(int cm_status_number_period) {
		this.cm_status_number_period = cm_status_number_period;
	}
	public String getCm_level_number() {
		return cm_level_number;
	}
	public void setCm_level_number(String cm_level_number) {
		this.cm_level_number = cm_level_number;
	}
	public String getCm_level_date() {
		return cm_level_date;
	}
	public void setCm_level_date(String cm_level_date) {
		this.cm_level_date = cm_level_date;
	}
	public int getCm_level_period() {
		return cm_level_period;
	}
	public void setCm_level_period(int cm_level_period) {
		this.cm_level_period = cm_level_period;
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
	public String getCm_degree() {
		return cm_degree;
	}
	public void setCm_degree(String cm_degree) {
		this.cm_degree = cm_degree;
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
