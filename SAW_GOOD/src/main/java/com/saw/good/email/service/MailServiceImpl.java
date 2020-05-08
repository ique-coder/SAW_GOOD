package com.saw.good.email.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.saw.good.email.Email;

@Service
public class MailServiceImpl implements MailService{

	
	@Autowired
	private Logger logger;
	
	@Autowired
	private JavaMailSender javaMailSender;
	
	@Autowired
	private Email e;
	
	public void setJavaMailSender(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}
	
	
	@Override
	public boolean send(Email e) {
		
		MimeMessage message = javaMailSender.createMimeMessage();

		try {
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"UTF-8");
			helper.setSubject(e.getTitle());
			helper.setText(e.getContent(),true);
	
			helper.setFrom("SAWGOOD");
			helper.setTo(e.getUserEmail());
			
			javaMailSender.send(message);
			return true;
		}catch(MessagingException ex) {
			ex.printStackTrace();
		}
		
		
		return false;
	}

	
}
