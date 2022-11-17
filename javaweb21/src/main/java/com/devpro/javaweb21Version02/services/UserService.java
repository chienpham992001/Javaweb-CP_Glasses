package com.devpro.javaweb21Version02.services;

import java.io.IOException;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.devpro.javaweb21Version02.model.Categories;
import com.devpro.javaweb21Version02.model.Role;
import com.devpro.javaweb21Version02.model.SearchModel;
import com.devpro.javaweb21Version02.model.User;

@Service
public class UserService extends BaseService<User> {

	@Override
	protected Class<User> clazz() {
		return User.class;
	}

	public User loadUserByUsername(String userName) {
		String sql = "select * from tbl_users u where u.username = '" + userName + "' and status = 1";
		return this.getEntityByNativeSQL(sql);
	}

	
	@Transactional
	public User add(User p,Role r)
			throws IllegalStateException, IOException {

		// tạo seo: bổ sung thêm thời gian tính bằng miliseconds để tránh trùng seo
//		p.setSeo(new Slugify().slugify(p.getTitle() + "-" + System.currentTimeMillis()));

		// lưu vào database
		p.addRoles(r);
		r.addUsers(p);
		return super.saveOrUpdate(p);
		
	}
	
	@Transactional
	public User update(User p,Role r)
			throws IllegalStateException, IOException {

		// tạo seo: bổ sung thêm thời gian tính bằng miliseconds để tránh trùng seo
//		p.setSeo(new Slugify().slugify(p.getTitle() + "-" + System.currentTimeMillis()));
		

		// lưu vào database
		return super.saveOrUpdate(p);
	}
	
	public PagerData<User> search(SearchModel searchModel) {
		// khởi tạo câu lệnh
		String sql = "SELECT tbl_users.id,tbl_users.username,tbl_users.password, tbl_users.fullname,tbl_users.phone,tbl_users.created_date,tbl_users.updated_date,tbl_users.updated_by,tbl_users.created_by,tbl_users.status FROM tbl_users,tbl_users_roles WHERE 1=1 and tbl_users.id=tbl_users_roles.user_id";

		if (searchModel != null) {

			if (searchModel.getKeyoption() != null) {
				if (searchModel.getKeyoption() == "") {
					sql += "";

				}
				if (searchModel.getKeyoption() != "") {
					sql += "  and tbl_users_roles.role_id = '" + searchModel.getKeyoption() + "'";
				}
			}

			// tìm kiếm theo username,phone
			if (!StringUtils.isEmpty(searchModel.getKeyword())) {
				sql += " and (tbl_users.username like '%" + searchModel.getKeyword() + "%'" + " or tbl_users.fullname like '%"
						+ searchModel.getKeyword() + "%'" + " or tbl_users.phone like '%" + searchModel.getKeyword() + "%')";
			}
		}

		// chi lay san pham chua xoa
//						sql += " and p.status=1 ";

		return getEntitiesByNativeSQL(sql, searchModel.getPage());
	}
}