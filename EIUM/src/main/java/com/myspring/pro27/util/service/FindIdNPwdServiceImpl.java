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
		// ���̹��� ��� smtp.naver.com �� �Է��մϴ�. 
		// Google�� ��� smtp.gmail.com �� �Է��մϴ�. 
		String host = "smtp.naver.com"; 
		final String username = "won0935"; //���̹� ���̵� �Է����ּ���. @nave.com�� �Է����� ���ñ���. 
		final String password = "Songjw0935!"; //���̹� �̸��� ��й�ȣ�� �Է����ּ���. 
		int port=465; //��Ʈ��ȣ 
		
		// ���� ���� 
		String recipient = findIdNPwdVO.getEmail(); //�޴� ����� �����ּҸ� �Է����ּ���. 
		String subject = "EIUM - ��û���� ����"; //���� ���� �Է����ּ���. 
		

		String body = "";
		if (findIdNPwdVO.getPwd() != null || !"".equals(findIdNPwdVO.getPwd())) {
			body = String.join( System.getProperty("line.separator"),
					"�����ȣ: "+ findIdNPwdVO.getEmpCode(),
			        "ID: " + findIdNPwdVO.getId(),
			        "Password: " + findIdNPwdVO.getPwd());
		}else {
			body = String.join( System.getProperty("line.separator"),
			        "�����ȣ: "+ findIdNPwdVO.getEmpCode(),
			        "ID: " + findIdNPwdVO.getId() );
		}
		
		Properties props = System.getProperties(); // ������ ��� ���� ��ü ����

		// SMTP ���� ���� ���� 
		props.put("mail.smtp.host", host); props.put("mail.smtp.port", port); 
		props.put("mail.smtp.auth", "true"); props.put("mail.smtp.ssl.enable", "true"); 
		props.put("mail.smtp.ssl.trust", host); //Session ���� 
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
			String un=username; 
			String pw=password;
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() { 
				return new javax.mail.PasswordAuthentication(un, pw); } }); 
		session.setDebug(true); //for debug 
		
		Message mimeMessage = new MimeMessage(session); //MimeMessage ���� 
		mimeMessage.setFrom(new InternetAddress("won0935@naver.com")); //�߽��� ���� , ������ ����� �̸����ּҸ� �ѹ� �� �Է��մϴ�. �̶��� �̸��� Ǯ �ּҸ� �� �ۼ����ּ���. 
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); //�����ڼ��� //.TO �ܿ� .CC(����) .BCC(��������) �� ���� 
		mimeMessage.setSubject(subject); //������� 
		mimeMessage.setText(body); //������� 
		mimeMessage.setText(body); //������� 
		Transport.send(mimeMessage); //javax.mail.Transport.send() �̿� }
	}
	
	
}
