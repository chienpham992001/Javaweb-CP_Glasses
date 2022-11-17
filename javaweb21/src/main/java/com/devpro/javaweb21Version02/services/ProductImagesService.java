package com.devpro.javaweb21Version02.services;

import org.springframework.stereotype.Service;

import com.devpro.javaweb21Version02.model.ProductImages;

@Service
public class ProductImagesService extends BaseService<ProductImages>{

	@Override
	protected Class<ProductImages> clazz() {
		// TODO Auto-generated method stub
		return ProductImages.class;
	}

}
