package com.devpro.javaweb21Version02.controller.customer;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb21Version02.controller.BaseController;
import com.devpro.javaweb21Version02.model.Product;
import com.devpro.javaweb21Version02.model.ProductReview;
import com.devpro.javaweb21Version02.model.SaleOrder;
import com.devpro.javaweb21Version02.model.SaleOrderProducts;
import com.devpro.javaweb21Version02.model.User;
import com.devpro.javaweb21Version02.services.ProductReviewService;
import com.devpro.javaweb21Version02.services.ProductService;
import com.devpro.javaweb21Version02.services.SaleOrderProductService;
import com.devpro.javaweb21Version02.services.SaleOrderService;

@Controller
public class UserProfileController extends BaseController {
	@Autowired
	private ProductReviewService productReviewService;
	@Autowired
	private ProductService productService;
	@Autowired
	private SaleOrderProductService saleOrderProductService;

	@RequestMapping(value = { "/user/user_profile" }, method = RequestMethod.GET)
	public String cartCheckout(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		String user_id = request.getParameter("id");
		
		List<SaleOrderProducts> saleOrderProducts = saleOrderProductService.getEntitiesByNativeSQL(
				"SELECT tbl_saleorder_products.id,tbl_saleorder_products.saleorder_id,tbl_saleorder_products.product_id,tbl_saleorder_products.quanlity,tbl_saleorder_products.created_date,tbl_saleorder_products.updated_date, tbl_saleorder_products.created_by,tbl_saleorder_products.updated_by,tbl_saleorder_products.status,tbl_saleorder_products.feedback_status FROM tbl_saleorder,tbl_saleorder_products where tbl_saleorder.id = tbl_saleorder_products.saleorder_id and status_shipping ='Giao thành công' and user_id ="
						+ user_id);
		model.addAttribute("saleorderproducts", saleOrderProducts);

		/*
		 * List<SaleOrderProducts> saleOrderProducts =
		 * saleOrderProductService.findAll();
		 * model.addAttribute("saleorderproducts",saleOrderProducts);
		 */

		return "customer/user_profile";

	}

	@RequestMapping(value = { "/user/send_feedback" }, method = RequestMethod.POST)
	public String userSendFeedback(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		Integer productId = getInteger(request, "productId");
		Product product = productService.getById(productId);
		Integer saleOrderProductId = getInteger(request, "saleOrderProductId");
		SaleOrderProducts saleOrderProducts = saleOrderProductService.getById(saleOrderProductId);
		Integer rate = getInteger(request, "rate");
		String feedback = request.getParameter("feedback");
		ProductReview productReview = new ProductReview();
		productReview.setProduct(product);
		productReview.setUser(getUserLogined());
		productReview.setRate(rate);
		productReview.setFeedback(feedback);
		productReview.setSaleOrderProducts(saleOrderProducts);

		saleOrderProducts.setFeedback_status("Đã đánh giá");

		productReviewService.saveOrUpdate(productReview);
		saleOrderProductService.saveOrUpdate(saleOrderProducts);
		return "redirect:/user/user_profile?id="+getUserLogined().getId().toString();
	}

}
