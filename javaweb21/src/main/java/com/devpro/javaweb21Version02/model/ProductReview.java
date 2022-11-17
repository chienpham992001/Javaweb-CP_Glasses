package com.devpro.javaweb21Version02.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_product_review")
public class ProductReview extends BaseEntity{
	
	@Column(name = "rate",nullable = false)
	private int rate;
	@Column(name = "feedback",length = 1000,nullable = false)
	private String feedback;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "product_id")
	private Product product;

	@OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "saleorder_product_id", referencedColumnName = "id")
    private SaleOrderProducts saleOrderProducts;

	public SaleOrderProducts getSaleOrderProducts() {
		return saleOrderProducts;
	}

	public void setSaleOrderProducts(SaleOrderProducts saleOrderProducts) {
		this.saleOrderProducts = saleOrderProducts;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private User user;
	
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}

	public String getFeedback() {
		return feedback;
	}

	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
}
