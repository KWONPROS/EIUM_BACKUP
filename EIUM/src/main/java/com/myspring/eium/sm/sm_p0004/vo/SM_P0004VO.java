package com.myspring.eium.sm.sm_p0004.vo;

import org.springframework.stereotype.Component;

@Component
public class SM_P0004VO {
	private String employee_code;
	private String employee_name;
	private String employee_id;
	private String department_code;
	private String department_name;
	private String employee_join_date;
	private String employee_resignation_date;
	private String employee_available_yn;
	private String employee_password;
	private String access_range;
	private String authority_code;
	private String user;

	
	



	



	public SM_P0004VO(String employee_code, String employee_name, String employee_id, String department_code,
			String department_name, String employee_join_date, String employee_resignation_date,
			String employee_available_yn, String employee_password, String access_range, String authority_code, String user,
			String contact) {
		super();
		this.employee_code = employee_code;
		this.employee_name = employee_name;
		this.employee_id = employee_id;
		this.department_code = department_code;
		this.department_name = department_name;
		this.employee_join_date = employee_join_date;
		this.employee_resignation_date = employee_resignation_date;
		this.employee_available_yn = employee_available_yn;
		this.employee_password = employee_password;
		this.access_range = access_range;
		this.authority_code = authority_code;
		this.user = user;
		this.contact = contact;
	}



	public String getUser() {
		return user;
	}



	public void setUser(String user) {
		this.user = user;
	}



	public void setauthority_code(String authority_code) {
		this.authority_code = authority_code;
	}
	
	public String getauthority_code() {
		return authority_code;
	}


	private String contact;

	public SM_P0004VO() {

	}

	public String getEmployee_code() {
		return employee_code;
	}

	public String getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}

	public void setEmployee_code(String employee_code) {
		this.employee_code = employee_code;
	}

	public String getEmployee_name() {
		return employee_name;
	}

	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}

	public String getDepartment_code() {
		return department_code;
	}

	public void setDepartment_code(String department_code) {
		this.department_code = department_code;
	}

	public String getDepartment_name() {
		return department_name;
	}

	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}

	public String getEmployee_join_date() {
		return employee_join_date;
	}

	public void setEmployee_join_date(String employee_join_date) {
		this.employee_join_date = employee_join_date;
	}

	public String getEmployee_resignation_date() {
		return employee_resignation_date;
	}

	public void setEmployee_resignation_date(String employee_resignation_date) {
		this.employee_resignation_date = employee_resignation_date;
	}

	public String getEmployee_available_yn() {
		return employee_available_yn;
	}

	public void setEmployee_available_yn(String employee_available_yn) {
		this.employee_available_yn = employee_available_yn;
	}

	public String getEmployee_password() {
		return employee_password;
	}

	public void setEmployee_password(String employee_password) {
		this.employee_password = employee_password;
	}

	public String getAccess_range() {
		return access_range;
	}

	public void setAccess_range(String access_range) {
		this.access_range = access_range;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}


	
	

	

}
