package com.devpro.javaweb21Version02.services;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.devpro.javaweb21Version02.model.SaleOrder;
import com.devpro.javaweb21Version02.model.SearchModel;

@Service
public class SaleOrderService extends BaseService<SaleOrder> {

	@Override
	protected Class<SaleOrder> clazz() {
		// TODO Auto-generated method stub
		return SaleOrder.class;
	}

	public PagerData<SaleOrder> search(SearchModel searchModel) {
		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_saleorder p WHERE 1=1";

		if (searchModel != null) {
			if (searchModel.getKeyoption() != null ) {
				if(searchModel.getKeyoption() == "") {
					sql+="";
					
				}
				if(searchModel.getKeyoption() != "") {
					sql += " and status_shipping = '" +searchModel.getKeyoption()+ "'";
				}
			}
			// tìm kiếm theo customer_name,phone,address
			if (!StringUtils.isEmpty(searchModel.getKeyword())) {
				sql += " and (p.customer_name like '%" + searchModel.getKeyword() + "%'" + " or p.customer_address like '%"
						+ searchModel.getKeyword()+ "%'"  +" or p.customer_note like '%"
						+ searchModel.getKeyword()+ "%'"  + " or p.customer_phone like '%" + searchModel.getKeyword() + "%')";
			}
		}

		// chi lay san pham chua xoa
//						sql += " and p.status=1 ";

		return getEntitiesByNativeSQL(sql, searchModel.getPage());
	}
	@Transactional
	public void confirm(SaleOrder p) {
		p = this.getById(p.getId());
		p.setStatusShipping("Đang giao");
		
		this.saveOrUpdate(p);
	}
	@Transactional
	public void cancel(SaleOrder p) {
		p = this.getById(p.getId());
		p.setStatusShipping("Hủy đơn");
		this.saveOrUpdate(p);
	}
	@Transactional
	public void success(SaleOrder p) {
		p = this.getById(p.getId());
		p.setStatusShipping("Giao thành công");
		this.saveOrUpdate(p);
	}
}
