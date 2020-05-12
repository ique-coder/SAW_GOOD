package com.saw.good.email;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data

public class Email {
	
	
	private String adminEmail;
	private String userEmail;
	private String title;
	private String content;
	private String host;
	public Email() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Email(String adminEmail, String userEmail, String title, String content, String host) {
		super();
		this.adminEmail = adminEmail;
		this.userEmail = userEmail;
		this.title = title;
		this.content = content;
		this.host = host;
	}
	public String getAdminEmail() {
		return adminEmail;
	}
	public void setAdminEmail(String adminEmail) {
		this.adminEmail = adminEmail;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	@Override
	public String toString() {
		return "Email [adminEmail=" + adminEmail + ", userEmail=" + userEmail + ", title=" + title + ", content="
				+ content + ", host=" + host + "]";
	}
	
	
	
}
