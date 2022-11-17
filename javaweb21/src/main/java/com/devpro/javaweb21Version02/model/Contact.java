package com.devpro.javaweb21Version02.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_contact")
public class Contact extends BaseEntity{
	
	//Tương ứng với từng cặp thẻ trong form contact(path)
	@Column(name = "fullname",length = 45,nullable = false)
	private String fullname;
	@Column(name = "email",length = 45,nullable = false)
	private String email;
	@Column(name = "subject",length = 45,nullable = false)
	private String subject;
	@Column(name = "message",length = 1000,nullable = false)
	private String message; //property
	

	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	
}
