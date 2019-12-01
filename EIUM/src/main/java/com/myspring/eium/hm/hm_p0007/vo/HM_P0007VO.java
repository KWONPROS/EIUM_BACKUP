package com.myspring.eium.hm.hm_p0007.vo;


import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class HM_P0007VO {
	
	private String employee_code;
	private String employee_name;
	private String marriage_yn;
	private String religion;
	private String military_type;
	private String military_number;
	private String discharge_yn;
	private String residential_division;
	private String hr_appoint_number;
	private String hr_appoint_date;
	private String hr_appoint_title;
	private String hr_appoint_history;
	private String hr_appoint_before_info;
	private MultipartFile picture;
	private String height;
	private String weight;
	private String blood_type;
	private String handicapped_yn;
	private String hobby;
	private String special_ability;

	
	
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public String getSpecial_ability() {
		return special_ability;
	}
	public void setSpecial_ability(String special_ability) {
		this.special_ability = special_ability;
	}
	public MultipartFile getPicture() {
		return picture;
	}
	public void setPicture(MultipartFile picture) {
		this.picture = picture;
	}
	public String getHr_appoint_number() {
		return hr_appoint_number;
	}
	public void setHr_appoint_number(String hr_appoint_number) {
		this.hr_appoint_number = hr_appoint_number;
	}
	public String getHr_appoint_date() {
		return hr_appoint_date;
	}
	public void setHr_appoint_date(String hr_appoint_date) {
		this.hr_appoint_date = hr_appoint_date;
	}
	public String getHr_appoint_title() {
		return hr_appoint_title;
	}
	public void setHr_appoint_title(String hr_appoint_title) {
		this.hr_appoint_title = hr_appoint_title;
	}
	public String getHr_appoint_history() {
		return hr_appoint_history;
	}
	public void setHr_appoint_history(String hr_appoint_history) {
		this.hr_appoint_history = hr_appoint_history;
	}
	public String getHr_appoint_before_info() {
		return hr_appoint_before_info;
	}
	public void setHr_appoint_before_info(String hr_appoint_before_info) {
		this.hr_appoint_before_info = hr_appoint_before_info;
	}
	public String getHr_appoint_current_info() {
		return hr_appoint_current_info;
	}
	public void setHr_appoint_current_info(String hr_appoint_current_info) {
		this.hr_appoint_current_info = hr_appoint_current_info;
	}
	public String getHr_appoint_after_info() {
		return hr_appoint_after_info;
	}
	public void setHr_appoint_after_info(String hr_appoint_after_info) {
		this.hr_appoint_after_info = hr_appoint_after_info;
	}


	private String hr_appoint_current_info;
	private String hr_appoint_after_info;
	
	
	
	
	
	
	
	
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getBlood_type() {
		return blood_type;
	}
	public void setBlood_type(String blood_type) {
		this.blood_type = blood_type;
	}
	public String getHandicapped_yn() {
		return handicapped_yn;
	}
	public void setHandicapped_yn(String handicapped_yn) {
		this.handicapped_yn = handicapped_yn;
	}
	
	public String getMarriage_yn() {
		return marriage_yn;
	}
	public void setMarriage_yn(String marriage_yn) {
		this.marriage_yn = marriage_yn;
	}
	public String getReligion() {
		return religion;
	}
	public void setReligion(String religion) {
		this.religion = religion;
	}
	public String getMilitary_type() {
		return military_type;
	}
	public void setMilitary_type(String military_type) {
		this.military_type = military_type;
	}
	public String getMilitary_number() {
		return military_number;
	}
	public void setMilitary_number(String military_number) {
		this.military_number = military_number;
	}
	public String getDischarge_yn() {
		return discharge_yn;
	}
	public void setDischarge_yn(String discharge_yn) {
		this.discharge_yn = discharge_yn;
	}
	public String getResidential_division() {
		return residential_division;
	}
	public void setResidential_division(String residential_division) {
		this.residential_division = residential_division;
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
	

	public HM_P0007VO() {
		super();
	}

		
	
	
}
