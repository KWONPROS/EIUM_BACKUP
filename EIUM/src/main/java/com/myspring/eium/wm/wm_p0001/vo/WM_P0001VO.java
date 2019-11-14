package com.myspring.eium.wm.wm_p0001.vo;
import org.springframework.stereotype.Component;

@Component
public class WM_P0001VO {
	
	//사원 테이블
	private String employee_CODE="";
	private String employee_NAME="";
	
	
	public String getEmployee_CODE() {
		return employee_CODE;
	}
	public void setEmployee_CODE(String employee_CODE) {
		this.employee_CODE = employee_CODE;
	}
	public String getEmployee_NAME() {
		return employee_NAME;
	}
	public void setEmployee_NAME(String employee_NAME) {
		this.employee_NAME = employee_NAME;
	}
	
	//부서 테이블
	private String department_CODE="";
	private String department_NAME="";
	
	public String getDepartment_CODE() {
		return department_CODE;
	}
	public void setDepartment_CODE(String department_CODE) {
		this.department_CODE = department_CODE;
	}
	public String getDepartment_NAME() {
		return department_NAME;
	}
	public void setDepartment_NAME(String department_NAME) {
		this.department_NAME = department_NAME;
	}

	//WORKING_STATUS 근태 상태
	private String working_STATUS_CODE="";
	private String working_STATUS_MONTH="";
	private String working_STATUS_DATE="";
	private String working_STATUS_START_TIME="";
	private String working_STATUS_END_TIME="";
	private String working_STATUS_TOTAL_TIME="";
	private String working_STATUS_DESC="";


	public String getWorking_STATUS_CODE() {
		return working_STATUS_CODE;
	}
	public void setWorking_STATUS_CODE(String working_STATUS_CODE) {
		this.working_STATUS_CODE = working_STATUS_CODE;
	}
	public String getWorking_STATUS_MONTH() {
		return working_STATUS_MONTH;
	}
	public void setWorking_STATUS_MONTH(String working_STATUS_MONTH) {
		this.working_STATUS_MONTH = working_STATUS_MONTH;
	}
	public String getWorking_STATUS_DATE() {
		return working_STATUS_DATE;
	}
	public void setWorking_STATUS_DATE(String working_STATUS_DATE) {
		this.working_STATUS_DATE = working_STATUS_DATE;
	}
	public String getWorking_STATUS_START_TIME() {
		return working_STATUS_START_TIME;
	}
	public void setWorking_STATUS_START_TIME(String working_STATUS_START_TIME) {
		this.working_STATUS_START_TIME = working_STATUS_START_TIME;
	}
	public String getWorking_STATUS_END_TIME() {
		return working_STATUS_END_TIME;
	}
	public void setWorking_STATUS_END_TIME(String working_STATUS_END_TIME) {
		this.working_STATUS_END_TIME = working_STATUS_END_TIME;
	}
	public String getWorking_STATUS_TOTAL_TIME() {
		return working_STATUS_TOTAL_TIME;
	}
	public void setWorking_STATUS_TOTAL_TIME(String working_STATUS_TOTAL_TIME) {
		this.working_STATUS_TOTAL_TIME = working_STATUS_TOTAL_TIME;
	}
	public String getWorking_STATUS_DESC() {
		return working_STATUS_DESC;
	}
	public void setWorking_STATUS_DESC(String working_STATUS_DESC) {
		this.working_STATUS_DESC = working_STATUS_DESC;
	}
	
	
	
}