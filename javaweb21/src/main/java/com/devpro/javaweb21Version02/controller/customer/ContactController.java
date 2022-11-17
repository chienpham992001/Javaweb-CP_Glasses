package com.devpro.javaweb21Version02.controller.customer;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb21Version02.controller.BaseController;
import com.devpro.javaweb21Version02.model.Contact;
import com.devpro.javaweb21Version02.services.ContactService;

@Controller
public class ContactController extends BaseController {

	
	//inject 1 Bean vào trong 1 Bean.
	//các Beans được quản lý bởi spring-container
	@Autowired
	private ContactService contactService;
	
	
	@RequestMapping(value = { "/contact" }, method = RequestMethod.GET)
	public String contact(final Model model, final HttpServletRequest request, final HttpServletResponse response) {
		
		// đẩy data xuống view qua model
		// trong view có sử dụng spring-form để binding-data
		// data dùng để binding có tên là contact

		Contact contact = new Contact();
		model.addAttribute("contact",contact);
		// đường dẫn tới file view
		return "customer/contact";
	}
	
	// Cách 1: Đơn giản
//	@RequestMapping(value = {"/contact"},method = RequestMethod.POST)
//	public String contact_post_simple(final Model model,
//					   final HttpServletRequest request,
//					   final HttpServletResponse response) {
//		
//		String hoTen = request.getParameter("fullname");
//		String tieuDe = request.getParameter("subject");
//		String noiDung = request.getParameter("message");
//		System.out.println(hoTen + ";"+tieuDe+";"+noiDung);
//		
//		//đường dẫn tới file view
//		return "customer/contact";
//	}

	// Cách 2: Hứng data đẩy lên từ spring-form
	// ModelAttribute hứng dữ liệu, cần phải đặt tên của data cần hứng
	// ngoài ra @ModelAttribute cũng sẽ đẩy data xuống view với dữ liệu hứng được
	@RequestMapping(value = { "/contact" }, method = RequestMethod.POST)
	public String contact_sf(final Model model, 
			final HttpServletRequest request, 
			final HttpServletResponse response,
			final @ModelAttribute("contact") Contact contact) throws IOException{
		System.out.println(contact.getFullname()+"  "+contact.getMessage());
		
//		contactService.getEntitiesByNativeSQL("SELECT * FROM tbl_contact");
		//lưu contact vào trong dtb
		contact.setEmail(getUserLogined().getUsername());
		contactService.saveOrUpdate(contact);
		
		//reset form
		Contact data = new Contact();
		model.addAttribute("contact", data);

		// đường dẫn tới file view
		return "customer/contact";
	}

	// Cách 3: sử dụng Ajax
	// đối với cách này thì chỉ refresh 1 số phần của trang web không reload lại
	// với ajax sẽ không trả về view(refresh lại) mà trả về kiểu ResponseEntity có
	// giá trị kiểu Map<String, Object>
	// @RequestBody dùng để hứng data
//	@RequestMapping(value = { "/contact" }, method = RequestMethod.POST)
//	public ResponseEntity<Map<String, Object>> ajax_contact(final Model model, final HttpServletRequest request,
//			final HttpServletResponse response, final @RequestBody Contact contact) {
//		System.out.println(contact.getFullname());
//		System.out.println(contact.getSubject());
//
//		Map<String, Object> jsonResult = new HashMap<String, Object>();
//		jsonResult.put("statusCode", 200); // status code ví dụ: 200: Success, 500: Error, 404: NotFound
//		jsonResult.put("statusMessage", "Cảm ơn " + contact.getFullname() + ", đã gửi ý kiến đóng góp về cho chúng tôi!");
//		return ResponseEntity.ok(jsonResult);
//	}
}
