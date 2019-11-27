package com.myspring.eium.login.vo;

import org.springframework.stereotype.Component;

@Component
public class LoginVO { 
	 private String employee_id;
	 private String employee_name;
	 private String employee_password;
	 private String employee_code;
	 
	 private String authority_code;
	 private String authority_name;
	 
	 private String menu_code;
	 private String access_grant;
	
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

	public String getEmployee_code() {
		return employee_code;
	}

	public void setEmployee_code(String employee_code) {
		this.employee_code = employee_code;
	}

	public String getAuthority_code() {
		return authority_code;
	}

	public void setAuthority_code(String authority_code) {
		this.authority_code = authority_code;
	}

	public String getAuthority_name() {
		return authority_name;
	}

	public void setAuthority_name(String authority_name) {
		this.authority_name = authority_name;
	}

	public String getMenu_code() {
		return menu_code;
	}

	public void setMenu_code(String menu_code) {
		this.menu_code = menu_code;
	}

	public String getAccess_grant() {
		return access_grant;
	}

	public void setAccess_grant(String access_grant) {
		this.access_grant = access_grant;
	}

	public LoginVO(String employee_id, String employee_name, String employee_password, String employee_code,
			String authority_code, String authority_name, String menu_code, String access_grant) {
		this.employee_id = employee_id;
		this.employee_name = employee_name;
		this.employee_password = employee_password;
		this.employee_code = employee_code;
		this.authority_code = authority_code;
		this.authority_name = authority_name;
		this.menu_code = menu_code;
		this.access_grant = access_grant;
	}

}
