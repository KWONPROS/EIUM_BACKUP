package com.myspring.eium.hm.hm_p0004.vo;




import org.springframework.stereotype.Component;

@Component
public class HM_P0004VO {
	
	private String emp_CODE;
	private String  emp_NAME;
	private String  dep_NAME;
	
	public String getEmp_CODE() {
		return emp_CODE;
	}
	public void setEmp_CODE(String emp_CODE) {
		this.emp_CODE = emp_CODE;
	}
	public String getEmp_NAME() {
		return emp_NAME;
	}
	public void setEmp_NAME(String emp_NAME) {
		this.emp_NAME = emp_NAME;
	}
	public String getDep_NAME() {
		return dep_NAME;
	}
	public void setDep_NAME(String dep_NAME) {
		this.dep_NAME = dep_NAME;
	}
	
}
