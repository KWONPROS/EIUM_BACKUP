package com.myspring.pro27.util.service;

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

	@Override
	public FindIdNPwdVO findInfo(FindIdNPwdVO findIdNPwdVO) throws Exception {
				
		if(findIdNPwdVO.getId()==null||"".equals(findIdNPwdVO.getId())) {
			findIdNPwdVO = findIdNPwdDAO.findId(findIdNPwdVO);
		}else {
			findIdNPwdVO = findIdNPwdDAO.findPwd(findIdNPwdVO);
		}
		
		return findIdNPwdVO;
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
		String subject = "EIUM - ã���� ������ ����Դϴ�."; //���� ���� �Է����ּ���. 
		
		String body = findIdNPwdVO.getEmpCode() + "���� �����Դϴ�.";
		body += "ID: " + findIdNPwdVO.getId();
		if (findIdNPwdVO.getPwd() == null || "".equals(findIdNPwdVO.getPwd())) {
			body += "Password: " + findIdNPwdVO.getPwd();
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
		Transport.send(mimeMessage); //javax.mail.Transport.send() �̿� }
	}
	
	
}
