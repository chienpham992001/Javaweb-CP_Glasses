package com.devpro.javaweb21Version02.controller.customer;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb21Version02.model.Role;
import com.devpro.javaweb21Version02.model.User;
import com.devpro.javaweb21Version02.services.RoleService;
import com.devpro.javaweb21Version02.services.UserService;

@Controller
public class RegisterController {
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;

	@RequestMapping(value = { "/register" }, method = RequestMethod.GET)
	public String register(final Model model, final HttpServletRequest request, final HttpServletResponse response) {

		return "register";
	}

	@RequestMapping(value = { "/register" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_register(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody User user) throws IllegalStateException, IOException {
		List<User> users = userService.findAll();
		boolean flag = false;
		for (User x : users) {
			if(x.getUsername().compareToIgnoreCase(user.getUsername())==0) flag=true;
		}
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("statusCode", 200);
		if(flag)
		{
			jsonResult.put("statusMessage", "Email " + user.getUsername() + " đã tồn tại trong hệ thống ");
		}
		else {
			Role role = roleService.getById(17);
			user.setPassword(new BCryptPasswordEncoder(4).encode(user.getPassword()));
			userService.add(user, role);
			jsonResult.put("statusMessage", "Chào mừng " + user.getFullname() + " đến với CP Glasses ");
		}
		
		return ResponseEntity.ok(jsonResult);
	}
}
