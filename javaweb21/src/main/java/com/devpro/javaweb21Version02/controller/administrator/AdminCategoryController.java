package com.devpro.javaweb21Version02.controller.administrator;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.javaweb21Version02.controller.BaseController;
import com.devpro.javaweb21Version02.model.Categories;
import com.devpro.javaweb21Version02.model.Product;
import com.devpro.javaweb21Version02.model.ProductSearchModel;
import com.devpro.javaweb21Version02.services.CategoriesService;
import com.devpro.javaweb21Version02.services.PagerData;

@Controller
public class AdminCategoryController extends BaseController {
	@Autowired
	private CategoriesService categoriesService;

	@RequestMapping(value = { "/admin/manage_categories" }, method = RequestMethod.GET)
	public String manage(final Model model, final HttpServletRequest request, final HttpServletResponse response) {

		/*
		 * Integer categoryId = getInteger(request, "categoryId");
		 * 
		 * ProductSearchModel searchModel = new ProductSearchModel();
		 * searchModel.setKeyword(""); searchModel.setCategoryId(categoryId);
		 * searchModel.setPage(getCurrentPage(request));
		 * 
		 * PagerData<Categories> categories = categoriesService.search(searchModel);
		 * request.removeAttribute("categories"); model.addAttribute("categories",
		 * categories); model.addAttribute("searchModel", searchModel);
		 */

		return "administrator/manage_categories";
	}
	
	@RequestMapping(value = { "/admin/addOrEdit_category" }, method = RequestMethod.GET)
	public String adminCategoryGET(final Model model, 
			final HttpServletRequest request, 
			final HttpServletResponse response) throws IOException{

		Categories categories = new Categories();
		model.addAttribute("category", categories);

		return "administrator/addOrEdit_category";
	}
	@RequestMapping(value = { "/admin/addOrEdit_category" }, method = RequestMethod.POST)
	public String adminCategoryPOST(
			final Model model, 
			final HttpServletRequest request,
			final HttpServletResponse response, 
			@ModelAttribute("category") Categories category)
			throws IOException {

		//Thêm mới
		if (category.getId() == null || category.getId() <= 0) {
			categoriesService.add(category);
		}
		else {
			categoriesService.saveOrUpdate(category);
		}
		return "redirect:/admin/manage_categories";
	}
	@RequestMapping(value = { "/admin/addOrEdit_category/{categoryId}" }, method = RequestMethod.GET)
	public String adminShowCategortEdit(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("categoryId") int categoryId) throws IOException {
		// Lấy product trong db theo ID
		Categories categoryInDTB = categoriesService.getById(categoryId);
		model.addAttribute("category", categoryInDTB);

		return "administrator/addOrEdit_category";
	}

	@RequestMapping(value = { "/admin/manage_categories/delete" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> adminDeleteCategory(
			final Model model, 
			final HttpServletRequest request,
			final HttpServletResponse response,
			final @RequestBody Categories category) throws IOException {
		// Lấy product trong db theo ID
		Categories categoryInDTB = categoriesService.getById(category.getId());
		categoriesService.delete(categoryInDTB);
		Map<String,Object> jsonResult = new HashMap<String,Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Đã xóa thành công");
		return ResponseEntity.ok(jsonResult);
	}
}
