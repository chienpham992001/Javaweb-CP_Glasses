package com.devpro.javaweb21Version02.model;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Entity
@Table(name = "tbl_products")
public class Product extends BaseEntity{
	
	@NotEmpty(message = "Tên sản phẩm không được để trống")
	@Size(min = 4,message = "Tên sản phẩm phải từ 4 ký tự trở lên")
	@Column(name = "title",length = 1000,nullable = false)
	private String title;
	

	@Min(value = 1,message = "Số lượng tối thiểu là 1")
	@Column(name = "quantity",nullable = false)
	private int quantity;
	
	@Min(value = 10000,message = "Giá tối thiểu là 10000")
	@Column(name = "price", precision = 13, scale = 2, nullable = false)
	private BigDecimal price;
	
	@Column(name = "price_sale", precision = 13, scale = 2, nullable = true)
	private BigDecimal priceSale;

	@NotEmpty(message = "Mô tả ngắn gọn sản phẩm không được để trống")
	@Column(name = "short_description",length = 3000,nullable = false)
	private String shortDes;

	@NotEmpty(message = "Mô tả sản phẩm không được để trống")
	@Lob
	@Column(name = "detail_description",nullable = false,columnDefinition = "LONGTEXT")
	private String detail;

	@Column(name = "avatar",length = 200,nullable = true)
	private String avatar;

	@Column(name = "seo",length = 1000,nullable = true)
	private String seo;
	
	@Column(name = "is_hot",nullable = true)
	private Boolean isHot;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id")
	private Categories categories;
	
	@OneToMany(cascade = CascadeType.ALL, 
			   fetch = FetchType.EAGER, 
			   mappedBy = "product")
	private Set<ProductReview> productReviews = new HashSet<ProductReview>();
	public void addProductReviews(ProductReview _productReviews) {
		_productReviews.setProduct(this);
		productReviews.add(_productReviews);
	}
	public void deleteProductReviews(ProductReview _productReviews) {
		_productReviews.setProduct(null);
		productReviews.remove(_productReviews);
	}
	
	public Set<ProductReview> getProductReviews() {
		return productReviews;
	}
	public void setProductReviews(Set<ProductReview> productReviews) {
		this.productReviews = productReviews;
	}

	@OneToMany(cascade = CascadeType.ALL, 
			   fetch = FetchType.EAGER, 
			   mappedBy = "product")
	private Set<ProductImages> productImages = new HashSet<ProductImages>();
	public void addProductImages(ProductImages _productImages) {
		_productImages.setProduct(this);
		productImages.add(_productImages);
	}
	public void deleteProductImages(ProductImages _productImages) {
		_productImages.setProduct(null);
		productImages.remove(_productImages);
	}
	
	public Set<ProductImages> getProductImages() {
		return productImages;
	}
	public void setProductImages(Set<ProductImages> productImages) {
		this.productImages = productImages;
	}
	public Categories getCategories() {
		return categories;
	}

	public void setCategories(Categories categories) {
		this.categories = categories;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public BigDecimal getPriceSale() {
		return priceSale;
	}

	public void setPriceSale(BigDecimal priceSale) {
		this.priceSale = priceSale;
	}

	public String getShortDes() {
		return shortDes;
	}

	public void setShortDes(String shortDes) {
		this.shortDes = shortDes;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public Boolean getIsHot() {
		return isHot;
	}

	public void setIsHot(Boolean isHot) {
		this.isHot = isHot;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
}
