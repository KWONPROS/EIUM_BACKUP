package com.myspring.eium.common.service;

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

import com.myspring.eium.common.dao.HomeDAO;
import com.myspring.eium.common.vo.HomeVO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class HomeService {
	@Autowired
	HomeDAO HomeDAO;
	@Autowired
	HomeVO HomeVO;
	
	public HomeVO findInfo(Map<String, Object> searchMap) throws Exception {
				
		if(searchMap.get("EMPLOYEE_ID")==null||"".equals(searchMap.get("EMPLOYEE_ID"))) {
			HomeVO = HomeDAO.findId(searchMap);
		}else {
			HomeVO = HomeDAO.findPwd(searchMap);
		}
		return HomeVO;
	}
	

	public void mailSender(HomeVO homeVO) throws Exception {
		// ���̹��� ��� smtp.naver.com �� �Է��մϴ�. 
		// Google�� ��� smtp.gmail.com �� �Է��մϴ�. 
		String host = "smtp.naver.com"; 
		final String username = "won0935"; //���̹� ���̵� �Է����ּ���. @nave.com�� �Է����� ���ñ���. 
		final String password = "Songjw0935!"; //���̹� �̸��� ��й�ȣ�� �Է����ּ���. 
		int port=465; //��Ʈ��ȣ 
		
		// ���� ���� 
		String recipient = homeVO.getEmail(); //�޴� ����� �����ּҸ� �Է����ּ���. 
		String subject = "EIUM - ��û���� ����"; //���� ���� �Է����ּ���. 
		

		String body = "";
		if (homeVO.getPwd() != null || !"".equals(homeVO.getPwd())) {
			body = String.join( System.getProperty("line.separator"),
					"�����ȣ: "+ homeVO.getEmpCode(),
			        "ID: " + homeVO.getId(),
			        "Password: " + homeVO.getPwd());
		}else {
			body = String.join( System.getProperty("line.separator"),
			        "�����ȣ: "+ homeVO.getEmpCode(),
			        "ID: " + homeVO.getId() );
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
