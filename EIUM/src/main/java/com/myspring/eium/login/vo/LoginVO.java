package com.myspring.eium.login.vo;

import org.springframework.stereotype.Component;

@Component
public class LoginVO { 
	private String employee_id;
	private String employee_name;
	 private String employee_password;
	
	public LoginVO() {
	}

	public String getEmployee_name() {
		return employee_name;
	}

	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}

	public String getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}

	public String getEmployee_password() {
		return employee_password;
	}

	public void setEmployee_password(String employee_password) {
		this.employee_password = employee_password;
	}

	public LoginVO(String employee_id, String employee_name, String employee_password) {
		this.employee_id = employee_id;
		this.employee_name = employee_name;
		this.employee_password = employee_password;
	}

	

}
