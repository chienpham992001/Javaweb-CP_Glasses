package com.devpro.javaweb21Version02.model;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class Cart {
	// tổng số tiền trong giỏ hàng
		private BigDecimal totalPrice = BigDecimal.ZERO;
		
		private Integer totalProducts = 0;
		
		// danh sách sản phẩm trong giỏ hàng
		private List<CartItem> cartItems = new ArrayList<CartItem>();
		
		public List<CartItem> getCartItems() {
			return cartItems;
		}
		
		public void setCartItems(List<CartItem> cartItems) {
			this.cartItems = cartItems;
		}

		public BigDecimal getTotalPrice() {
			return totalPrice;
		}

		public void setTotalPrice(BigDecimal totalPrice) {
			this.totalPrice = totalPrice;
		}

		public Integer getTotalProducts() {
			return totalProducts;
		}

		public void setTotalProducts(Integer totalProducts) {
			this.totalProducts = totalProducts;
		}
}
