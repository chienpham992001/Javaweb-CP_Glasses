package com.devpro.javaweb21Version02.controller.administrator;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.javaweb21Version02.controller.BaseController;
import com.devpro.javaweb21Version02.model.Product;
import com.devpro.javaweb21Version02.model.SaleOrder;
import com.devpro.javaweb21Version02.model.SaleOrderProducts;
import com.devpro.javaweb21Version02.model.SearchModel;
import com.devpro.javaweb21Version02.services.PagerData;
import com.devpro.javaweb21Version02.services.ProductService;
import com.devpro.javaweb21Version02.services.SaleOrderProductService;
import com.devpro.javaweb21Version02.services.SaleOrderService;

@Controller
public class AdminSaleOrder extends BaseController{
	
	@Autowired
	private SaleOrderService saleOrderService;
	@Autowired
	private SaleOrderProductService saleOrderProductService;
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = { "/admin/manage_saleOrder" }, method = RequestMethod.GET)
	public String manage_saleOrder(final Model model, final HttpServletRequest request, final HttpServletResponse response) {

		String keyword = request.getParameter("keyword");
		String keyoption = request.getParameter("keyoption");
		SearchModel searchModel = new SearchModel();
		searchModel.setKeyword(keyword);
		searchModel.setKeyoption(keyoption);
		searchModel.setPage(getCurrentPage(request));
		PagerData<SaleOrder> saleOrders = saleOrderService.search(searchModel);
		model.addAttribute("saleorders", saleOrders);
		model.addAttribute("searchModel", searchModel);
		return "administrator/manage_saleOrder";
	}
	
	@RequestMapping(value = { "/admin/manage_saleOrder/{saleOrderId}" }, method = RequestMethod.GET)
	public String show_saleOrderProduct(final Model model, 
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("saleOrderId") Integer saleOrderId) {
		
		SaleOrder saleOrder = saleOrderService.getEntityByNativeSQL("SELECT * FROM tbl_saleorder where id="+saleOrderId);
		
		model.addAttribute("saleorder", saleOrder);
		List<SaleOrderProducts> saleorderproducts = saleOrderProductService.getEntitiesByNativeSQL("SELECT * FROM tbl_saleorder_products where saleorder_id="+saleOrderId);
		
		model.addAttribute("saleorderproducts", saleorderproducts);

		return "administrator/invoice";
	}
	
	@RequestMapping(value = { "/admin/manage_saleOrder/confirm" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> adminConfirmSaleOrder(
			final Model model, 
			final HttpServletRequest request,
			final HttpServletResponse response,
			final @RequestBody SaleOrder saleOrder) throws IOException {
		// Lấy product trong db theo ID
		

		List<SaleOrderProducts> saleorderproducts = saleOrderProductService.getEntitiesByNativeSQL("SELECT * FROM tbl_saleorder_products where saleorder_id="+saleOrder.getId());

		String status="";
		for (SaleOrderProducts x : saleorderproducts) {
			Product product = productService.getById(x.getProduct().getId());
			if(product.getQuantity()<x.getQuanlity()) {
				status+="\nSố lượng sản phẩm "+product.getTitle()+" trong kho không đủ.";
			}
			
		}
		Map<String,Object> jsonResult = new HashMap<String,Object>();
		jsonResult.put("code", 200);
		if(status=="") {
			for (SaleOrderProducts x : saleorderproducts) {
				Product product = productService.getById(x.getProduct().getId());
				product.setQuantity(product.getQuantity()-x.getQuanlity());
				productService.saveOrUpdate(product);
			}
			SaleOrder saleOrderInDTB = saleOrderService.getById(saleOrder.getId());
			saleOrderService.confirm(saleOrderInDTB);
			jsonResult.put("message", "Xác nhận thành công");
			
		}
		if(status!="") {
			jsonResult.put("message", status);
		}
		
		return ResponseEntity.ok(jsonResult);
		
	}
	@RequestMapping(value = { "/admin/manage_saleOrder/cancel" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> adminCancelSaleOrder(
			final Model model, 
			final HttpServletRequest request,
			final HttpServletResponse response,
			final @RequestBody SaleOrder saleOrder) throws IOException {
		// Lấy product trong db theo ID
		SaleOrder saleOrderInDTB = saleOrderService.getById(saleOrder.getId());
		saleOrderService.cancel(saleOrderInDTB);

		Map<String,Object> jsonResult = new HashMap<String,Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Xác nhận thành công");
		return ResponseEntity.ok(jsonResult);
	}
	@RequestMapping(value = { "/admin/manage_saleOrder/success" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> adminSuccessSaleOrder(
			final Model model, 
			final HttpServletRequest request,
			final HttpServletResponse response,
			final @RequestBody SaleOrder saleOrder) throws IOException {
		// Lấy product trong db theo ID
		SaleOrder saleOrderInDTB = saleOrderService.getById(saleOrder.getId());
		saleOrderService.success(saleOrderInDTB);

		Map<String,Object> jsonResult = new HashMap<String,Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Xác nhận thành công");
		return ResponseEntity.ok(jsonResult);
	}
}
