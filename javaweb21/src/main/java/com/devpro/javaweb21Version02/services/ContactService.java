package com.devpro.javaweb21Version02.services;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.devpro.javaweb21Version02.model.Contact;
import com.devpro.javaweb21Version02.model.SearchModel;
import com.devpro.javaweb21Version02.model.User;


/*
 * Mỗi Entity sẽ cần 1 Service tương ứng
 * Để thực hiện thêm,sửa,xóa,search Entity đó trong dtb 
 */
@Service
public class ContactService extends BaseService<Contact>{

	@Override
	protected Class<Contact> clazz() {
		// TODO Auto-generated method stub
//		return Contact.class;
		return Contact.class;
	}

	public PagerData<Contact> search(SearchModel searchModel) {
		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_contact p WHERE 1=1";

		if (searchModel != null) {
			// tìm kiếm theo username,phone
			if (!StringUtils.isEmpty(searchModel.getKeyword())) {
				sql += " and (p.fullname like '%" + searchModel.getKeyword() + "%'" + " or p.subject like '%"
						+ searchModel.getKeyword() + "%'" + " or p.message like '%" + searchModel.getKeyword()
						+ "%')";
			}
		}

		// chi lay san pham chua xoa
//						sql += " and p.status=1 ";

		return getEntitiesByNativeSQL(sql, searchModel.getPage());
	}
}
