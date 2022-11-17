package com.devpro.javaweb21Version02.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_saleorder_products")
public class SaleOrderProducts extends BaseEntity {
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "product_id")
	private Product product;
	
	@Column(name = "quanlity")
	private Integer quanlity;
	@Column(name = "feedback_status", length = 45, nullable = true)
	private String feedback_status;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "saleorder_id")
	private SaleOrder saleOrder;
	
	@OneToOne(mappedBy = "saleOrderProducts")
    private ProductReview productReview;
	
	public ProductReview getProductReview() {
		return productReview;
	}

	public void setProductReview(ProductReview productReview) {
		this.productReview = productReview;
	}

	public SaleOrder getSaleOrder() {
		return saleOrder;
	}

	public void setSaleOrder(SaleOrder saleOrder) {
		this.saleOrder = saleOrder;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Integer getQuanlity() {
		return quanlity;
	}

	public void setQuanlity(Integer quanlity) {
		this.quanlity = quanlity;
	}

	public String getFeedback_status() {
		return feedback_status;
	}

	public void setFeedback_status(String feedback_status) {
		this.feedback_status = feedback_status;
	}

	

}