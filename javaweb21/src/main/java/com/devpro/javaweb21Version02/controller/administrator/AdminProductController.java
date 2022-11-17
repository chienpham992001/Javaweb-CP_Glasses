package com.devpro.javaweb21Version02.controller.administrator;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
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
import com.devpro.javaweb21Version02.model.ProductSearchModel;
import com.devpro.javaweb21Version02.services.PagerData;
import com.devpro.javaweb21Version02.services.ProductService;

@Controller
public class AdminProductController extends BaseController {

//	@Autowired
//	private CategoriesService categoriesService;
	@Autowired
	private ProductService productService;

	@RequestMapping(value = { "/admin/manage_products" }, method = RequestMethod.GET)
	public String manage(final Model model, final HttpServletRequest request, final HttpServletResponse response) {

		String keyword = request.getParameter("keyword");
		Integer categoryId = getInteger(request, "categoryId");

		ProductSearchModel searchModel = new ProductSearchModel();
		searchModel.setKeyword(keyword);
		searchModel.setCategoryId(categoryId);
		searchModel.setPage(getCurrentPage(request));

		PagerData<Product> products = productService.search(searchModel);

		model.addAttribute("products", products);
		model.addAttribute("searchModel", searchModel);
		return "administrator/manage_products";
	}

	@RequestMapping(value = { "/admin/add_product" }, method = RequestMethod.GET)
	public String add_product(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {

		Product product = new Product();
		model.addAttribute("product", product);

		return "administrator/add_product";
	}

	@RequestMapping(value = { "/admin/add_product" }, method = RequestMethod.POST)
	public String adminProductAdd(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, 
			@Valid @ModelAttribute("product") Product product, 
			BindingResult result,
			@RequestParam("productAvatar") MultipartFile productAvatar,
			@RequestParam("productPictures") MultipartFile[] productPictures) throws IOException {
		// Thêm mới
		if(result.hasErrors()) {
			return "administrator/add_product";
		}
		else {
			if (product.getId() == null || product.getId() <= 0) {

				productService.add(product, productAvatar, productPictures);

			} else {
				productService.update(product, productAvatar, productPictures);
			}

			return "redirect:/admin/manage_products";
		}
		// Load lại trang khi submit
		// Khởi tạo 1 product(entity) mới
//		Product sp = new Product();
//		model.addAttribute("product", sp);
	}

	// Sửa sản phẩm
	@RequestMapping(value = { "/admin/add_product/{productId}" }, method = RequestMethod.GET)
	public String adminProductEditShow(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("productId") int productId) throws IOException {
		// Lấy product trong db theo ID
		Product productInDTB = productService.getById(productId);
		model.addAttribute("product", productInDTB);

		return "administrator/add_product";
	}

	// Xóa sản phẩm (cập nhật status)
	@RequestMapping(value = { "/admin/manage_products/delete" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> adminDeleteProduct(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody Product product) throws IOException {
		// Lấy product trong db theo ID
		Product productInDTB = productService.getById(product.getId());
		productService.delete(productInDTB);

		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Đã xóa thành công");
		return ResponseEntity.ok(jsonResult);
	}

	// Hiển thị trang sửa sản phẩm theo ID
	@RequestMapping(value = { "/admin/manage_products/{productId}" }, method = RequestMethod.GET)
	public String adminProductDetail(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("productId") int productId) throws IOException {
		// Lấy product trong db theo ID
		Product productInDTB = productService.getById(productId);
		model.addAttribute("product", productInDTB);

		System.out.println(productInDTB.getId());

		return "administrator/edit_product_modal";
	}
}
