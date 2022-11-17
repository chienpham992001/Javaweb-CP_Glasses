package com.devpro.javaweb21Version02.controller.administrator;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb21Version02.controller.BaseController;
import com.devpro.javaweb21Version02.model.Contact;
import com.devpro.javaweb21Version02.model.SearchModel;
import com.devpro.javaweb21Version02.services.ContactService;
import com.devpro.javaweb21Version02.services.PagerData;


@Controller
public class AdminContactController extends BaseController{
	@Autowired
	private ContactService contactService;
	
	@Autowired
    public JavaMailSender emailSender;
	
	@RequestMapping(value = {"/admin/manage_contacts"}, method = RequestMethod.GET)
	public String manage_contact(final Model model,
					   final HttpServletRequest request,
					   final HttpServletResponse response) {
		
		String keyword = request.getParameter("keyword");
		SearchModel searchModel = new SearchModel();
		searchModel.setKeyword(keyword);
		searchModel.setPage(getCurrentPage(request));
		PagerData<Contact> contacts = contactService.search(searchModel);
		model.addAttribute("contacts", contacts);
		
		model.addAttribute("searchModel", searchModel);
		return "administrator/manage_contacts";
		
	}
	
	@RequestMapping(value = {"/admin/send_feedback"}, method = RequestMethod.POST)
	public String send_email_contact(final Model model,
					   final HttpServletRequest request,
					   final HttpServletResponse response) throws MessagingException{
		
		MimeMessage message = emailSender.createMimeMessage();
        boolean multipart = true;
        MimeMessageHelper helper = new MimeMessageHelper(message, multipart, "utf-8");

        String email_receiver =request.getParameter("email_receiver");
        String subject = request.getParameter("subject");
        String content = request.getParameter("content");
        
        String htmlMsg ="<center>" +"<img src='https://f8-zpcloud.zdn.vn/2315072002868201996/1525861ca59363cd3a82.jpg'>"
                +"<h1>We are CP Glasses</h1>"
        		+"<p>We have received your comments from the contact form at the hompage</p>"
                +content
        		+"</center>";
        
        message.setContent(htmlMsg, "text/html");
        helper.setTo(email_receiver);
        helper.setSubject(subject);
        this.emailSender.send(message);

        
        return "redirect:/admin/manage_contacts";
	}
}
