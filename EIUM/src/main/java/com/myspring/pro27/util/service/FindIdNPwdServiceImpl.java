package com.myspring.pro27.util.service;

import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.pro27.util.vo.FindIdNPwdVO;
import com.myspring.pro27.util.dao.FindIdNPwdDAO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class FindIdNPwdServiceImpl implements FindIdNPwdService {
	@Autowired
	private FindIdNPwdDAO findIdNPwdDAO;
	@Autowired
	FindIdNPwdVO FindIdNPwdvO;
	
	
	@Override
	public FindIdNPwdVO findInfo(Map<String, Object> searchMap) throws Exception {
				
		if(searchMap.get("EMPLOYEE_ID")==null||"".equals(searchMap.get("EMPLOYEE_ID"))) {
			FindIdNPwdvO = findIdNPwdDAO.findId(searchMap);
			
		}else {
			System.out.println(searchMap+"searchMap");
			FindIdNPwdvO = findIdNPwdDAO.findPwd(searchMap);
		}
		  
		return FindIdNPwdvO;
	}
	
	
	@Override
	public void mailSender(FindIdNPwdVO findIdNPwdVO) throws Exception {
		// 네이버일 경우 smtp.naver.com 을 입력합니다. 
		// Google일 경우 smtp.gmail.com 을 입력합니다. 
		String host = "smtp.naver.com"; 
		final String username = "won0935"; //네이버 아이디를 입력해주세요. @nave.com은 입력하지 마시구요. 
		final String password = "Songjw0935!"; //네이버 이메일 비밀번호를 입력해주세요. 
		int port=465; //포트번호 
		
		// 메일 내용 
		String recipient = findIdNPwdVO.getEmail(); //받는 사람의 메일주소를 입력해주세요. 
		String subject = "EIUM - 요청정보 전송"; //메일 제목 입력해주세요. 
		

		String body = "";
		if (findIdNPwdVO.getPwd() != null || !"".equals(findIdNPwdVO.getPwd())) {
			body = String.join( System.getProperty("line.separator"),
					"사원번호: "+ findIdNPwdVO.getEmpCode(),
			        "ID: " + findIdNPwdVO.getId(),
			        "Password: " + findIdNPwdVO.getPwd());
		}else {
			body = String.join( System.getProperty("line.separator"),
			        "사원번호: "+ findIdNPwdVO.getEmpCode(),
			        "ID: " + findIdNPwdVO.getId() );
		}
		
		Properties props = System.getProperties(); // 정보를 담기 위한 객체 생성

		// SMTP 서버 정보 설정 
		props.put("mail.smtp.host", host); props.put("mail.smtp.port", port); 
		props.put("mail.smtp.auth", "true"); props.put("mail.smtp.ssl.enable", "true"); 
		props.put("mail.smtp.ssl.trust", host); //Session 생성 
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
			String un=username; 
			String pw=password;
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() { 
				return new javax.mail.PasswordAuthentication(un, pw); } }); 
		session.setDebug(true); //for debug 
		
		Message mimeMessage = new MimeMessage(session); //MimeMessage 생성 
		mimeMessage.setFrom(new InternetAddress("won0935@naver.com")); //발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 이때는 이메일 풀 주소를 다 작성해주세요. 
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); //수신자셋팅 //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음 
		mimeMessage.setSubject(subject); //제목셋팅 
		mimeMessage.setText(body); //내용셋팅 
		mimeMessage.setText(body); //내용셋팅 
		Transport.send(mimeMessage); //javax.mail.Transport.send() 이용 }
	}
	
	
}
