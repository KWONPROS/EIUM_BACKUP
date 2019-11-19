package com.myspring.eium.pm.pm_p0001.vo;
import org.springframework.stereotype.Component;

@Component
public class PM_P0001VO {
	
	//사원 테이블
	private String employee_code;
	private String employee_name;
	private String payment_code;
	private String payment_date;
	private String payment_des_name;
	private String site_name;
	private String department_name;
	private String work_group_name;
	private String project_name;
	
	

	public String getPayment_code() {
		return payment_code;
	}
	public void setPayment_code(String payment_code) {
		this.payment_code = payment_code;
	}
	public String getSite_name() {
		return site_name;
	}
	public void setSite_name(String site_name) {
		this.site_name = site_name;
	}
	public String getDepartment_name() {
		return department_name;
	}
	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}
	public String getWork_group_name() {
		return work_group_name;
	}
	public void setWork_group_name(String work_group_name) {
		this.work_group_name = work_group_name;
	}
	public String getProject_name() {
		return project_name;
	}
	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}
	
	public String getEmployee_code() {
		return employee_code;
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
	public String getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}
	public String getPayment_des_name() {
		return payment_des_name;
	}
	public void setPayment_des_name(String payment_des_name) {
		this.payment_des_name = payment_des_name;
	}
	public PM_P0001VO() {
		
	}
	
	
	
	
	
}
