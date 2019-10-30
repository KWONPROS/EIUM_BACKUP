package com.myspring.eium.hm.hm_p0001.vo;


import org.springframework.stereotype.Component;

@Component("hm_P0001VO")
public class HM_P0001VO {
	
	private String  position_CODE;
	private String  position_NAME;
	public String getPosition_CODE() {
		return position_CODE;
	}
	public void setPosition_CODE(String position_CODE) {
		this.position_CODE = position_CODE;
	}
	public String getPosition_NAME() {
		return position_NAME;
	}
	public void setPosition_NAME(String position_NAME) {
		this.position_NAME = position_NAME;
	}
	
	
}
