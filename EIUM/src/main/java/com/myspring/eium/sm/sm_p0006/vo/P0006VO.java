package com.myspring.eium.sm.sm_p0006.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class P0006VO {
	private String EMPLOYEE_ID;
	private String EMPLOYEE_CODE;
	private String EMPLOYEE_NAME;
	private String INT_USER_ID;
	private Date INT_DATE;
	private String UPT_USER_ID;
	private Date UPT_DATE;
	
	public P0006VO() {

	}

	public P0006VO(String EMPLOYEE_ID, String EMPLOYEE_CODE, String EMPLOYEE_NAME, String INT_USER_ID,
			Date INT_DATE, String UPT_USER_ID, Date UPT_DATE) {
		
		this.EMPLOYEE_ID = EMPLOYEE_ID;
		this.EMPLOYEE_CODE = EMPLOYEE_CODE;
		this.EMPLOYEE_NAME = EMPLOYEE_NAME;
		this.INT_USER_ID = INT_USER_ID;
		this.INT_DATE = INT_DATE;
		this.UPT_USER_ID = UPT_USER_ID;
		this.UPT_DATE = UPT_DATE;
	
	}

	public String getEMPLOYEE_ID() {
		return EMPLOYEE_ID;
	}

	public void setEMPLOYEE_ID(String eMPLOYEE_ID) {
		EMPLOYEE_ID = eMPLOYEE_ID;
	}

	public String getEMPLOYEE_CODE() {
		return EMPLOYEE_CODE;
	}

	public void setEMPLOYEE_CODE(String eMPLOYEE_CODE) {
		EMPLOYEE_CODE = eMPLOYEE_CODE;
	}

	public String getEMPLOYEE_NAME() {
		return EMPLOYEE_NAME;
	}

	public void setEMPLOYEE_NAME(String eMPLOYEE_NAME) {
		EMPLOYEE_NAME = eMPLOYEE_NAME;
	}

	public String getINT_USER_ID() {
		return INT_USER_ID;
	}

	public void setINT_USER_ID(String iNT_USER_ID) {
		INT_USER_ID = iNT_USER_ID;
	}

	public Date getINT_DATE() {
		return INT_DATE;
	}

	public void setINT_DATE(Date iNT_DATE) {
		INT_DATE = iNT_DATE;
	}

	public String getUPT_USER_ID() {
		return UPT_USER_ID;
	}

	public void setUPT_USER_ID(String uPT_USER_ID) {
		UPT_USER_ID = uPT_USER_ID;
	}

	public Date getUPT_DATE() {
		return UPT_DATE;
	}

	public void setUPT_DATE(Date uPT_DATE) {
		UPT_DATE = uPT_DATE;
	}


}
