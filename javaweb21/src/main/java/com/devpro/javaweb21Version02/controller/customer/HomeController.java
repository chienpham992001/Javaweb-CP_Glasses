package com.devpro.javaweb21Version02.controller.customer;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb21Version02.controller.BaseController;
import com.devpro.javaweb21Version02.model.Product;
import com.devpro.javaweb21Version02.services.ProductService;

@Controller
public class HomeController extends BaseController{
	@Autowired
	private ProductService productService;
	@RequestMapping(value = {"/home"},method = RequestMethod.GET)
	public String home(final Model model,
					   final HttpServletRequest request,
					   final HttpServletResponse response) {
		List<Product> products = productService.getEntitiesByNativeSQL("SELECT * FROM tbl_products order by id DESC LIMIT 6");
		model.addAttribute("products", products);
		return "customer/index";
	}
	
	/**
	 * 1. Lấy thông tin từ Request Param
	 * Ví dụ localhost:8080/getRequestParams?hoten=ChienPham&tuoi=20
	 */
	@RequestMapping(value = {"/getRequestParams"},method = RequestMethod.GET)
	public String getRequestParams(final Model model,
								 final HttpServletRequest request,
								 final HttpServletResponse response) {
		String hoten = request.getParameter("hoten");
		int tuoi = Integer.parseInt(request.getParameter("tuoi"));
		System.out.println(hoten +" ; "+tuoi);
		return "customer/index";
	}
	
	/**
	 * 1. Lấy thông tin từ Request Path Variables
	 * Ví dụ: localhost:8080/getPathVariables/ChienPham/20
	 */
//	@RequestMapping(value = {"/getPathVariables/{hoten}/{tuoi}"},method = RequestMethod.GET)
//	public String getPathVariables(final Model model,
//								   final HttpServletRequest request,
//								   final HttpServletResponse response,
//								   @PathVariable("hoten") String ten,
//								   @PathVariable("tuoi") Integer tuoi) {
//		System.out.println(ten + ":" + tuoi);
//		return "customer/index";
//	}
	
	/*
	 * @RequestMapping(value = {"/{pageName}"},method = RequestMethod.GET) public
	 * String movePage(final Model model, final HttpServletRequest request, final
	 * HttpServletResponse response,
	 * 
	 * @PathVariable("pageName") String tenPage) {
	 * 
	 * return "customer/"+tenPage; }
	 */
}
