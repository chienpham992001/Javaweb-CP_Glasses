package com.devpro.javaweb21Version02.services;

import org.springframework.stereotype.Service;

import com.devpro.javaweb21Version02.model.SaleOrderProducts;

@Service
public class SaleOrderProductService extends BaseService<SaleOrderProducts>{

	@Override
	protected Class<SaleOrderProducts> clazz() {
		// TODO Auto-generated method stub
		return SaleOrderProducts.class;
	}

}
