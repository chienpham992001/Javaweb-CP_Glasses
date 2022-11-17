package com.devpro.javaweb21Version02.services;

import org.springframework.stereotype.Service;

import com.devpro.javaweb21Version02.model.ProductReview;

@Service
public class ProductReviewService extends BaseService<ProductReview>{

	@Override
	protected Class<ProductReview> clazz() {
		// TODO Auto-generated method stub
		return ProductReview.class;
	}
	
}
