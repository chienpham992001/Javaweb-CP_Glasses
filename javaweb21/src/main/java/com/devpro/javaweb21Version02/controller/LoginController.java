package com.devpro.javaweb21Version02.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
	@RequestMapping(value = {"/login"},method = RequestMethod.GET)
	public String register(final Model model,
						 final HttpServletRequest request,
						 final HttpServletResponse response) {
		
		return "login";
	}
}
