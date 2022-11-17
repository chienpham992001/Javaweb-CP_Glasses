package com.devpro.javaweb21Version02.services;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.javaweb21Version02.model.Product;
import com.devpro.javaweb21Version02.model.ProductImages;
import com.devpro.javaweb21Version02.model.ProductSearchModel;

@Service
public class ProductService extends BaseService<Product> {

	@Autowired
	private ProductImagesService productImagesService;

	@Override
	protected Class<Product> clazz() {
		// TODO Auto-generated method stub
		return Product.class;
	}

	/*
	 * Dùng để kiểm tra admin có upload ảnh lên không
	 */
	private boolean isEmptyUploadFile(MultipartFile[] images) {
		if (images == null || images.length <= 0)
			return true;

		if (images.length == 1 && images[0].getOriginalFilename().isEmpty())
			return true;

		return false;
	}

	/*
	 * Dùng để kiểm tra admin có upload ảnh lên không
	 */
	private boolean isEmptyUploadFile(MultipartFile image) {
		return image == null || image.getOriginalFilename().isEmpty();
	}

	private String getUniqueUploadFileName(String fileName) {
		String[] splitFileName = fileName.split("\\.");
		return splitFileName[0] + System.currentTimeMillis() + "." + splitFileName[1];
	}

	@Transactional
	public Product add(Product p, MultipartFile productAvatar, MultipartFile[] productPictures)
			throws IllegalStateException, IOException {

		// kiểm tra xem admin có đẩy avatar lên không ???
		if (!isEmptyUploadFile(productAvatar)) { // có đẩy avatar lên.

			String fileName = getUniqueUploadFileName(productAvatar.getOriginalFilename());

			// tạo đường dẫn tới folder chứa avatar
			String pathToAvatar = "C:/upload/product/avatar/" + fileName;

			// lưu avatar vào đường dẫn trên
			productAvatar.transferTo(new File(pathToAvatar));

			p.setAvatar("product/avatar/" + fileName);
		}

		// có đẩy pictures(product_images) ???
		if (!isEmptyUploadFile(productPictures)) { // có đẩy pictures lên.

			// nếu admin đẩy lên thì duyệt tất cả file đẩy lên và lưu trên server
			for (MultipartFile pic : productPictures) {
				String fileName = getUniqueUploadFileName(pic.getOriginalFilename());

				// lưu ảnh admin đẩy lên vào server
				pic.transferTo(new File("C:/upload/product/pictures/" + fileName));

				// tạo mới 1 bản ghi product_images
				ProductImages pi = new ProductImages();
				pi.setPath("product/pictures/" + fileName);
				pi.setTitle(fileName);

				p.addProductImages(pi);
			}
		}

		// tạo seo: bổ sung thêm thời gian tính bằng miliseconds để tránh trùng seo
//		p.setSeo(new Slugify().slugify(p.getTitle() + "-" + System.currentTimeMillis()));

		// lưu vào database
		return super.saveOrUpdate(p);
	}

	@Transactional
	public Product update(Product p, MultipartFile productAvatar, MultipartFile[] productPictures)
			throws IllegalStateException, IOException {
		// Lấy thông tin cũ của product theo id
		Product productInDTB = super.getById(p.getId());

		// Có đẩy avatar lên không => Xóa avatar cũ và thêm avatar mới
		if (!isEmptyUploadFile(productAvatar)) {
			// xóa avatar trong folder lên
			new File("C:/upload/" + productInDTB.getAvatar()).delete();

			// Sử dụng avatar mới
			String fileName = getUniqueUploadFileName(productAvatar.getOriginalFilename());
			productAvatar.transferTo(new File("C:/upload/product/avatar/" + fileName));
			p.setAvatar("product/avatar/" + fileName);
		} else {
			// Sử dụng avatar cũ
			p.setAvatar(productInDTB.getAvatar());
		}

		// Có đẩy pictures lên không
		if (!isEmptyUploadFile(productPictures)) {
			// Xóa pictures cũ
			if (productInDTB.getProductImages() != null && productInDTB.getProductImages().size() > 0) {
				for (ProductImages opi : productInDTB.getProductImages()) {
					// Xóa avatar trong folder
					new File("C:/upload/" + opi.getPath()).delete();

					// Xóa dữ liệu trong DTB
					productImagesService.delete(opi);
				}
			}
			// Thêm pictures mới
			for (MultipartFile pic : productPictures) {
				String fileName = getUniqueUploadFileName(pic.getOriginalFilename());
				pic.transferTo(new File("C:/upload/product/pictures/" + fileName));

				ProductImages pi = new ProductImages();
				pi.setPath("product/pictures/" + fileName);
				pi.setTitle(fileName);
				p.addProductImages(pi);
			}
		}
		// Tạo seo
//		p.setSeo(new Slugify().slugify(p.getTitle() + "-" +System.currentTimeMillis() ));

		// Lưu vào DTB
		return super.saveOrUpdate(p);
	}

	public PagerData<Product> search(ProductSearchModel searchModel) {
		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_products p WHERE 1=1";

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

			// tìm kiếm theo title và description
			if (!StringUtils.isEmpty(searchModel.getKeyword())) {
				sql += " and (p.title like '%" + searchModel.getKeyword() + "%'" + " or p.detail_description like '%"
						+ searchModel.getKeyword() + "%'" + " or p.short_description like '%" + searchModel.getKeyword()
						+ "%')";
			}
		}

		// chi lay san pham chua xoa
//						sql += " and p.status=1 ";

		return getEntitiesByNativeSQL(sql, searchModel.getPage());
	}

	public PagerData<Product> search2(ProductSearchModel searchModel) {
		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_products p WHERE 1=1";

		if (searchModel != null) {

			// tìm kiếm theo category

			if (searchModel.getCategoriesId() != null && searchModel.getCategoriesId().size() == 1) {
				sql += " and category_id = " + searchModel.getCategoryId();
			}

			if (searchModel.getCategoriesId() != null && searchModel.getCategoriesId().size() > 1) {
				//size > 1 cần thêm "or"
				sql += " and (category_id = '" + searchModel.getCategoriesId().get(0) + "'";
				for (int i = 1; i < searchModel.getCategoriesId().size(); i++) {
					sql += " or category_id = '" + searchModel.getCategoriesId().get(i) + "')";
				}

			}
			if (searchModel.getMinPrice() != null) {
				sql += " and p.price >= '" + searchModel.getMinPrice() + "'";
			}
			if (searchModel.getMaxPrice() != null) {
				sql += " and p.price <= '" + searchModel.getMaxPrice() + "'";
			}

			// tìm theo seo
			/*
			 * if (!StringUtils.isEmpty(searchModel.seo)) { sql += " and p.seo = '" +
			 * searchModel.seo + "'"; }
			 */

			// tìm kiếm sản phẩm hot
//					if (searchModel.isHot != null) {
//						sql += " and p.is_hot = '" + searchModel.seo + "'";
//					}

			// tìm kiếm theo title và description
			if (!StringUtils.isEmpty(searchModel.getKeyword())) {
				sql += " and (p.title like '%" + searchModel.getKeyword() + "%'" + " or p.detail_description like '%"
						+ searchModel.getKeyword() + "%'" + " or p.short_description like '%" + searchModel.getKeyword()
						+ "%')";
			}
		}

		// chi lay san pham chua xoa
//						sql += " and p.status=1 ";

		return getEntitiesByNativeSQL2(sql, searchModel.getPage());
	}

	@Transactional
	public void delete(Product p) {
		p = this.getById(p.getId());
		p.setStatus(false);
		this.saveOrUpdate(p);
	}
}
