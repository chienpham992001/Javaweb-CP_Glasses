package com.devpro.javaweb21Version02.model;
import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import net.bytebuddy.implementation.bind.annotation.Empty;

@Entity
@Table(name = "tbl_saleorder")
public class SaleOrder extends BaseEntity {
	@Column(name = "code")
	private String code;

	@Column(name = "total", precision = 13, scale = 2, nullable = false)
	private BigDecimal total;

	@NotEmpty(message = "Tên người nhận không được để trống")
	@Column(name = "customer_name")
	private String customerName;
	
	@NotEmpty(message = "Địa chỉ không được để trống")
	@Column(name = "customer_address")
	private String customerAddress;

	@NotEmpty(message = "Số điện thoại không được để trống")
	@Size(min = 10,max = 11,message = "Số điện thoại từ 10-11 chữ số")
	@Column(name = "customer_phone")
	private String customerPhone;

	@Column(name = "customer_note")
	private String customerNote;
	
	@Column(name = "status_shipping")
	private String statusShipping;

	public String getStatusShipping() {
		return statusShipping;
	}
	public void setStatusShipping(String statusShipping) {
		this.statusShipping = statusShipping;
	}

	@Column(name = "seo")
	private String seo;

	@OneToMany(cascade = CascadeType.ALL, 
			   mappedBy = "saleOrder", 
			   fetch = FetchType.EAGER)
	private Set<SaleOrderProducts> saleOrderProducts = new HashSet<SaleOrderProducts>();
	public void addSaleOrderProducts(SaleOrderProducts _saleOrderProducts) {
		_saleOrderProducts.setSaleOrder(this);
		saleOrderProducts.add(_saleOrderProducts);
	}
	public void removeSaleOrderProducts(SaleOrderProducts _saleOrderProducts) {
		_saleOrderProducts.setSaleOrder(null);
		saleOrderProducts.remove(_saleOrderProducts);
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private User user;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public BigDecimal getTotal() {
		return total;
	}

	public void setTotal(BigDecimal total) {
		this.total = total;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerAddress() {
		return customerAddress;
	}

	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public Set<SaleOrderProducts> getSaleOrderProducts() {
		return saleOrderProducts;
	}

	public void setSaleOrderProducts(Set<SaleOrderProducts> saleOrderProducts) {
		this.saleOrderProducts = saleOrderProducts;
	}

	public String getCustomerPhone() {
		return customerPhone;
	}

	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	public String getCustomerNote() {
		return customerNote;
	}
	public void setCustomerNote(String customerNote) {
		this.customerNote = customerNote;
	}
}

