package com.devpro.javaweb21Version02.controller.administrator;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb21Version02.controller.BaseController;
import com.devpro.javaweb21Version02.model.Categories;
import com.devpro.javaweb21Version02.model.Product;
import com.devpro.javaweb21Version02.model.ProductSearchModel;
import com.devpro.javaweb21Version02.model.SaleOrder;
import com.devpro.javaweb21Version02.model.User;
import com.devpro.javaweb21Version02.services.CategoriesService;
import com.devpro.javaweb21Version02.services.PagerData;
import com.devpro.javaweb21Version02.services.ProductService;
import com.devpro.javaweb21Version02.services.SaleOrderService;
import com.devpro.javaweb21Version02.services.UserService;

@Controller
public class AdminHomeController extends BaseController {

	@Autowired
	private ProductService productService;
	@Autowired
	private CategoriesService categoriesService;
	@Autowired
	private UserService userService;
	@Autowired
	private SaleOrderService saleOrderService;
	

	@RequestMapping(value = { "/admin" }, method = RequestMethod.GET)
	public String admin(final Model model, final HttpServletRequest request, final HttpServletResponse response) {
		Calendar cal = Calendar.getInstance();
		Integer month = cal.get(Calendar.MONTH)+1;
		List<Product> products = productService.findAll();
		List<Categories> cates = categoriesService.findAll();
		List<User> users =userService.findAll();
		List<SaleOrder> saleOrders = saleOrderService.findAll();
		/*
		 * List<SaleOrder> saleOrders = saleOrderService.
		 * getEntitiesByNativeSQL("SELECT * FROM tbl_saleorder where month(created_date)="
		 * +month);
		 */
		
		model.addAttribute("usersQuanlity", users.size());
		model.addAttribute("saleOrdersQuanlity", saleOrders.size());
		model.addAttribute("productQuanlity", products.size());
		model.addAttribute("categoryQuanlity", cates.size());
		return "administrator/index";
	}

	// Hiển thị form danh sách sản phẩm

	

	
	
	/*
	 * @RequestMapping(value = { "/admin/manage_products/{productId}" }, method =
	 * RequestMethod.POST) public String adminProductEdit(final Model model, final
	 * HttpServletRequest request, final HttpServletResponse response,
	 * 
	 * 
	 * @ModelAttribute("product") Product product,
	 * 
	 * @RequestParam("productAvatar") MultipartFile productAvatar,
	 * 
	 * @RequestParam("productPictures") MultipartFile[] productPictures) throws
	 * IOException {
	 * 
	 * if (product.getId() != null || product.getId() > 0) {
	 * productService.update(product, productAvatar, productPictures); } return
	 * "redirect:/admin/manage_products"; }
	 */
	
}
