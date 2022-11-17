package com.devpro.javaweb21Version02.controller.customer;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb21Version02.controller.BaseController;
import com.devpro.javaweb21Version02.model.Categories;
import com.devpro.javaweb21Version02.model.Product;
import com.devpro.javaweb21Version02.model.ProductReview;
import com.devpro.javaweb21Version02.model.ProductSearchModel;
import com.devpro.javaweb21Version02.services.CategoriesService;
import com.devpro.javaweb21Version02.services.PagerData;
import com.devpro.javaweb21Version02.services.ProductReviewService;
import com.devpro.javaweb21Version02.services.ProductService;

@Controller
public class ProductController extends BaseController {
	@Autowired
	private CategoriesService categoriesService;
	@Autowired
	private ProductService productService;
	@Autowired
	private ProductReviewService productReviewService;

	@RequestMapping(value = { "/products" }, method = RequestMethod.GET)
	public String showProduct(final Model model, final HttpServletRequest request, final HttpServletResponse response) {
		String keyword = request.getParameter("keyword");
		Integer categoryId = getInteger(request, "categoryId");
		Integer minPrice = getInteger(request, "minPrice");
		Integer maxPrice = getInteger(request, "maxPrice");

		String[] categoriesId = request.getParameterValues("categoryId");
		List<Integer> categoriesList = new ArrayList<>();
		if (categoriesId != null) {
			for (String x : categoriesId) {
				categoriesList.add(Integer.parseInt(x));
			}
			model.addAttribute("categoriesSearch", categoriesList);

		}

		/*
		 * BigDecimal minPrice = new
		 * BigDecimal(Double.parseDouble(request.getParameter("minPrice"))); BigDecimal
		 * maxPrice = new
		 * BigDecimal(Double.parseDouble(request.getParameter("maxPrice")));
		 */

		ProductSearchModel searchModel = new ProductSearchModel();
		searchModel.setKeyword(keyword);
		searchModel.setCategoryId(categoryId);
		searchModel.setMinPrice(minPrice);
		searchModel.setMaxPrice(maxPrice);
		searchModel.setCategoriesId(categoriesList);
		searchModel.setPage(getCurrentPage(request));
		PagerData<Product> products = productService.search2(searchModel);

		model.addAttribute("products", products);
		model.addAttribute("searchModel", searchModel);
		return "customer/products";
	}

	@RequestMapping(value = { "/product_detail" }, method = RequestMethod.GET)
	public String showProductDetail(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) {
		String product_id = request.getParameter("id");
		Product product = productService.getById(Integer.parseInt(product_id));
		model.addAttribute("product", product);

		List<ProductReview> productReviews = productReviewService
				.getEntitiesByNativeSQL("SELECT * FROM tbl_product_review where product_id = " + product_id);
		
		model.addAttribute("productReviews", productReviews);
		return "customer/product_detail";
	}
}
