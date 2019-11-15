package com.myspring.eium.common.vo;
import org.springframework.stereotype.Component;

@Component
public class HomeVO {
	private String empCode;
	private String id;
	private String pwd;
	private String email;
	private String board_DES;
	private String board_DES_DES;
	private String board_TITLE;
	private String board_START_DATE;
	private String board_END_DATE;
	private String board_CONTENT;
	private String board_CODE;


	public String getBoard_DES() {
		return board_DES;
	}
	public void setBoard_DES(String board_DES) {
		this.board_DES = board_DES;
	}
	public String getBoard_DES_DES() {
		return board_DES_DES;
	}
	public void setBoard_DES_DES(String board_DES_DES) {
		this.board_DES_DES = board_DES_DES;
	}
	public String getBoard_TITLE() {
		return board_TITLE;
	}
	public void setBoard_TITLE(String board_TITLE) {
		this.board_TITLE = board_TITLE;
	}
	public String getBoard_START_DATE() {
		return board_START_DATE;
	}
	public void setBoard_START_DATE(String board_START_DATE) {
		this.board_START_DATE = board_START_DATE;
	}
	public String getBoard_END_DATE() {
		return board_END_DATE;
	}
	public void setBoard_END_DATE(String board_END_DATE) {
		this.board_END_DATE = board_END_DATE;
	}
	public String getBoard_CONTENT() {
		return board_CONTENT;
	}
	public void setBoard_CONTENT(String board_CONTENT) {
		this.board_CONTENT = board_CONTENT;
	}
	public String getBoard_CODE() {
		return board_CODE;
	}
	public void setBoard_CODE(String board_CODE) {
		this.board_CODE = board_CODE;
	}
	public String getEmpCode() {
		return empCode;
	}
	public void setEmpCode(String empCode) {
		this.empCode = empCode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
