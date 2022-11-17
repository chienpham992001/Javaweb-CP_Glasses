package com.devpro.javaweb21Version02.controller.administrator;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.javaweb21Version02.controller.BaseController;
import com.devpro.javaweb21Version02.model.Product;
import com.devpro.javaweb21Version02.model.Role;
import com.devpro.javaweb21Version02.model.SearchModel;
import com.devpro.javaweb21Version02.model.User;
import com.devpro.javaweb21Version02.services.PagerData;
import com.devpro.javaweb21Version02.services.RoleService;
import com.devpro.javaweb21Version02.services.UserService;

@Controller
public class AdminUserController extends BaseController {

	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;

	@RequestMapping(value = { "/admin/manage_users" }, method = RequestMethod.GET)
	public String manage_users(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) {

		String keyword = request.getParameter("keyword");
		String keyoption = request.getParameter("keyoption");
		SearchModel searchModel = new SearchModel();
		searchModel.setKeyword(keyword);
		searchModel.setKeyoption(keyoption);
		searchModel.setPage(getCurrentPage(request));
		PagerData<User> users = userService.search(searchModel);
		model.addAttribute("users", users);

		model.addAttribute("searchModel", searchModel);
		return "administrator/manage_users";
	}

	@RequestMapping(value = { "/admin/addOrEdit_user" }, method = RequestMethod.GET)
	public String addOrEdit_user_GET(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {

		User user = new User();
		model.addAttribute("user", user);

		/*
		 * List<Role> roles = roleService.findAll(); for (Role role : roles) {
		 * System.out.println(role.getName()); }
		 */
		/* model.addAttribute("roles", roles); */

		return "administrator/addOrEdit_user";
	}

	@RequestMapping(value = { "/admin/addOrEdit_user" }, method = RequestMethod.POST)
	public String addOrEdit_user_POST(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @ModelAttribute("user") User user) throws IOException {

		if(user.getFullname()==""||user.getUsername()==""||user.getPassword()==""||user.getPhone()=="") {
			List<User> users = userService.findAll();
			boolean flag = false;
			for (User x : users) {
				if (x.getUsername().compareToIgnoreCase(user.getUsername()) == 0)
					flag = true;
			}
			if (!flag) {
				Role role = roleService.getById(17);

				if (user.getId() == null || user.getId() <= 0) {
					userService.add(user, role);
				} else {
					userService.saveOrUpdate(user);
				}
			}
		}
		
		return "redirect:/admin/addOrEdit_user";
	}

	@RequestMapping(value = { "/admin/edit_user" }, method = RequestMethod.GET)
	public String edit_user_GET(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		// Lấy product trong db theo ID

		Integer userId = getInteger(request, "id");
		User userInDTB = userService.getById(userId);
		model.addAttribute("user", userInDTB);

		Integer roleId = getInteger(request, "roleId");
		Role roleInDTB = roleService.getById(roleId);
		model.addAttribute("role", roleInDTB);
		return "administrator/edit_user";
	}

	// Sửa thông tin user
	@RequestMapping(value = { "/admin/edit_user" }, method = RequestMethod.POST)
	public String edit_user_POST(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @ModelAttribute("user") User user) throws IOException {

		/*
		 * userService.saveOrUpdate(user); Role adminRole = roleService.getById(17);
		 * user.addRoles(adminRole); userService.saveOrUpdate(user);
		 */
		return "redirect:/admin/manage_users";
	}

	@RequestMapping(value = { "/admin/change_role" }, method = RequestMethod.GET)
	public String change_user_role(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		User user = userService.getById(getInteger(request, "id"));
		Integer roleId = getInteger(request, "roleId");

		Set<Role> userRoles = user.getRoles();
		List<Role> userRoleList = new ArrayList<>(userRoles);
		for (Role role2 : userRoleList) {
			user.deleteRole(role2);
		}
		if (roleId == 17) {
			Role adminRole = roleService.getById(16);
			user.addRoles(adminRole);
		}
		if (roleId == 16) {
			Role adminRole = roleService.getById(17);
			user.addRoles(adminRole);
		}
		userService.saveOrUpdate(user);

		return "redirect:/admin/manage_users";
	}
}
