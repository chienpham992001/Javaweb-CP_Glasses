package com.devpro.javaweb21Version02.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_category")
public class Categories extends BaseEntity{

	@Column(name = "name",length = 100,nullable = false)
	private String name;
	@Column(name = "description",length = 1000,nullable = false)
	private String description;
	@Column(name = "seo",length = 1000,nullable = true)
	private String seo;
	
	@OneToMany(cascade = CascadeType.ALL,
			   fetch = FetchType.LAZY,
			   mappedBy = "categories") //trỏ tới property
	private Set<Product> products = new HashSet<Product>();
	
	//Bất cứ quan hệ OneToMany cần thêm 2 hàm add và delete
	public void addProduct(Product product) {
		products.add(product);
		product.setCategories(this);
	}
	
	public void deleteProduct(Product product) {
		products.remove(product);
		product.setCategories(null);
	}
	
	
	public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getSeo() {
		return seo;
	}
	public void setSeo(String seo) {
		this.seo = seo;
	}
	
	
}
