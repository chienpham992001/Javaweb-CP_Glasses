package com.devpro.javaweb21Version02.controller.customer;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb21Version02.model.Subcriber;

@Controller
public class SubcriberController {

	@RequestMapping(value = { "/home" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_subcribe(final Model model, final HttpServletRequest request,
			final HttpServletResponse response,final @RequestBody Subcriber subcriber) {
		System.out.println(subcriber.getEmail());
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("statusCode", 200);
		jsonResult.put("statusMessage", "Chúc mừng bạn đã đăng ký đồng hành cùng CP Glasses ");
		return ResponseEntity.ok(jsonResult);
		
	}
}
