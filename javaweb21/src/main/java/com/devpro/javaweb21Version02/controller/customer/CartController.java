package com.devpro.javaweb21Version02.controller.customer;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

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

import com.devpro.javaweb21Version02.controller.BaseController;
import com.devpro.javaweb21Version02.model.Cart;
import com.devpro.javaweb21Version02.model.CartItem;
import com.devpro.javaweb21Version02.model.Product;
import com.devpro.javaweb21Version02.model.SaleOrder;
import com.devpro.javaweb21Version02.model.SaleOrderProducts;
import com.devpro.javaweb21Version02.services.ProductService;
import com.devpro.javaweb21Version02.services.SaleOrderService;

@Controller
public class CartController extends BaseController {
	@Autowired
	private ProductService productService;

	@Autowired
	private SaleOrderService saleOrderService;
	
	@RequestMapping(value = { "/cart/checkout" }, method = RequestMethod.GET)
	public String cartCheckout(final Model model, 
						   final HttpServletRequest request, 
						   final HttpServletResponse response) throws IOException {
		model.addAttribute("saleOrder",new SaleOrder());
		return "customer/cart"; // -> đường dẫn tới View.
	}
	@RequestMapping(value = { "/cart/checkout" }, method = RequestMethod.POST)
	public String checkOut(final Model model, 
						   final HttpServletRequest request, 
						   final HttpServletResponse response,
						   @Valid @ModelAttribute ("saleOrder") SaleOrder saleOrder,
						   BindingResult result) throws IOException {
		//Lấy thông tin khách hàng
		/*
		 * String customerName = request.getParameter("fullName-receiver"); String
		 * customerPhone = request.getParameter("phone-receiver"); String
		 * customerAddress = request.getParameter("address-receiver"); String
		 * customerNote = request.getParameter("note-receiver");
		 */
		
		//Tạo hóa đơn + thông tin khách hàng
		/*
		 * saleOrder.setCustomerName(customerName);
		 * saleOrder.setCustomerPhone(customerPhone);
		 * saleOrder.setCustomerAddress(customerAddress);
		 * saleOrder.setCustomerNote(customerNote);
		 */
		if(result.hasErrors())
		{
			return "customer/cart";
		}
		else {
			saleOrder.setCode(String.valueOf(System.currentTimeMillis()));//Mã hóa đơn
			saleOrder.setUser(getUserLogined());
			saleOrder.setStatusShipping("Chờ xác nhận");
			
			//Lấy giỏ hàng
			HttpSession session = request.getSession();
			Cart cart = (Cart)session.getAttribute("cart");
			
			//Lấy sản phẩm trong giỏ hàng
			for (CartItem cartItem : cart.getCartItems()) {
				SaleOrderProducts saleOrderProducts = new SaleOrderProducts();
				saleOrderProducts.setProduct(productService.getById(cartItem.getProductId()));
				saleOrderProducts.setQuanlity(cartItem.getQuanlity());
				
				//Sử dụng hàm add hoặc remove(OneToMany)
				saleOrder.addSaleOrderProducts(saleOrderProducts);
			}
			//Lưu DTB
			saleOrderService.saveOrUpdate(saleOrder);
			
			//Reset lại session
			session.setAttribute("cart",null);
			session.setAttribute("totalItems", 0);
			
			return "customer/thankYou";
		}
		
	}
	
	
	@RequestMapping(value = { "/ajax/addToCart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_AddToCart(final Model model,
														      final HttpServletRequest request,
														      final HttpServletResponse response, 
														      final @RequestBody CartItem cartItem) {

		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng. Đầu tiên giả sử giỏ hàng là null(chưa có giỏ hàng)
		Cart cart = null;
		
		// kiểm tra xem session có tồn tại đối tượng nào tên là "cart"
		if (session.getAttribute("cart") != null) { // tồn tại 1 giỏ hàng trên session
			cart = (Cart) session.getAttribute("cart");
		} else {// chưa có giỏ hàng nào trên session
			cart = new Cart(); //khởi tạo giỏ hàng mới
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm đang có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		// kiểm tra nếu sản phẩm muốn bổ sùng vào giỏ hàng có trong giỏ hàng nếu có thì tăng số lượng
		boolean isExists = false;
		for (CartItem item : cartItems) {
			if (item.getProductId() == cartItem.getProductId()) {
				isExists = true;
				// tăng số lượng sản phẩm lên
				item.setQuanlity(item.getQuanlity() + cartItem.getQuanlity());
			}
		}

		// nếu sản phẩm chưa có trong giỏ hàng thì thực hiện add sản phẩm đó vào giỏ hàng
		if (!isExists) {
			// trước khi thêm mới thì lấy sản phẩm trong db
			// và thiết lập tên + đơn giá cho cartitem
			Product productInDb = productService.getById(cartItem.getProductId());

			cartItem.setProductName(productInDb.getTitle());
			cartItem.setPriceUnit(productInDb.getPrice());
			cartItem.setAvatar(productInDb.getAvatar());

			cart.getCartItems().add(cartItem); // thêm mới sản phẩm vào giỏ hàng
		}

		// tính tổng tiền
		//this.calculateTotalPrice(request);
		
		// trả về kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		
		// lưu totalItems vào session
		// tất cả các giá trị lưu trên session đều có thể truy cập được từ View
		session.setAttribute("totalItems", getTotalItems(request));
		
		return ResponseEntity.ok(jsonResult);
	}
	
	private int getTotalItems(final HttpServletRequest request) {
		HttpSession httpSession = request.getSession();

		if (httpSession.getAttribute("cart") == null) {
			return 0;
		}

		Cart cart = (Cart) httpSession.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();

		int total = 0;
		for (CartItem item : cartItems) {
			total += item.getQuanlity();
		}
		return total;
	}
	
	@RequestMapping(value = { "/cart/checkout/deleteItem/{productId}" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteCartItem(
			final Model model, 
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("productId") int productId
			) throws IOException {

		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");

		List<CartItem> cartItems = cart.getCartItems();
		List<CartItem> deletedCartItems = new ArrayList<CartItem>();
		for (CartItem x : cartItems) {
			if(x.getProductId()==productId) {
				deletedCartItems.add(x);
				session.setAttribute("totalItems", getTotalItems(request)-x.getQuanlity());
			}
		}
		cartItems.removeAll(deletedCartItems);
		Map<String,Object> jsonResult = new HashMap<String,Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Đã xóa thành công");
		return ResponseEntity.ok(jsonResult);
	}
	@RequestMapping(value = { "/cart/checkout/plusQuantity/{productId}" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> plusQuantityCartItem(
			final Model model, 
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("productId") int productId
			) throws IOException {

		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		
		List<CartItem> cartItems = cart.getCartItems();
		for (CartItem x : cartItems) {
			if(x.getProductId()==productId) { 
				x.setQuanlity(x.getQuanlity()+1);
				session.setAttribute("totalItems", getTotalItems(request));
			}
		}
		Map<String,Object> jsonResult = new HashMap<String,Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Plus");
		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = { "/cart/checkout/minusQuantity/{productId}" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> minusQuantityCartItem(
			final Model model, 
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("productId") int productId
			) throws IOException {

		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		
		List<CartItem> cartItems = cart.getCartItems();
		for (CartItem x : cartItems) {
			if(x.getProductId()==productId&& x.getQuanlity()>=2) { 
				x.setQuanlity(x.getQuanlity()-1);
				session.setAttribute("totalItems", getTotalItems(request));
				System.out.println(getTotalItems(request));
			}
		}
		Map<String,Object> jsonResult = new HashMap<String,Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Minus");
		return ResponseEntity.ok(jsonResult);
	}
	
}
