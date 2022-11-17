package com.devpro.javaweb21Version02.services;

import java.io.IOException;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.devpro.javaweb21Version02.model.Categories;
import com.devpro.javaweb21Version02.model.ProductSearchModel;
@Service
public class CategoriesService extends BaseService<Categories>{

	@Override
	protected Class<Categories> clazz() {
		// TODO Auto-generated method stub
		return Categories.class;
	}

	@Transactional
	public Categories add(Categories p)
			throws IllegalStateException, IOException {

		// tạo seo: bổ sung thêm thời gian tính bằng miliseconds để tránh trùng seo
//		p.setSeo(new Slugify().slugify(p.getTitle() + "-" + System.currentTimeMillis()));

		// lưu vào database
		return super.saveOrUpdate(p);
	}
	
	
	public PagerData<Categories> search(ProductSearchModel searchModel) {
		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_category p WHERE 1=1";

		if (searchModel != null) {

			// tìm kiếm theo category
			if (searchModel.getCategoryId() != null && searchModel.getCategoryId() > 0) {
				sql += " and category_id = " + searchModel.getCategoryId();
			}

			// tìm theo seo
//					if (!StringUtils.isEmpty(searchModel.seo)) {
//						sql += " and p.seo = '" + searchModel.seo + "'";
//					}

			// tìm kiếm sản phẩm hot
//					if (searchModel.isHot != null) {
//						sql += " and p.is_hot = '" + searchModel.seo + "'";
//					}

		}

		// chi lay san pham chua xoa
//						sql += " and p.status=1 ";

		return getEntitiesByNativeSQL(sql,searchModel.getPage());
	}
	
}
