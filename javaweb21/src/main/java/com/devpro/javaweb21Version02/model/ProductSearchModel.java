package com.devpro.javaweb21Version02.model;

import java.math.BigDecimal;
import java.util.List;

/**
 * DTO này chứa các tiêu chí để tìm kiếm sản phẩm
 * @author daing
 *
 */
public class ProductSearchModel extends BaseSearchModel {
	
	// tìm theo keyword
	private String keyword;

	// tìm theo category
	private Integer categoryId;
	private List<Integer> categoriesId;
	private Integer minPrice;
	private Integer maxPrice;
	
	
	
	public List<Integer> getCategoriesId() {
		return categoriesId;
	}

	public void setCategoriesId(List<Integer> categoriesId) {
		this.categoriesId = categoriesId;
	}

	public Integer getMinPrice() {
		return minPrice;
	}

	public void setMinPrice(Integer minPrice) {
		this.minPrice = minPrice;
	}

	public Integer getMaxPrice() {
		return maxPrice;
	}

	public void setMaxPrice(Integer maxPrice) {
		this.maxPrice = maxPrice;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	
}
