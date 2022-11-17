<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div class="modal-header">
		<h5 class="modal-title">Thông tin sản phẩm - ${product.title}</h5>
		<button type="button" class="close" data-dismiss="modal">
			<span>&times;</span>
		</button>
	</div>
	<div class="modal-body">
		<sf:form modelAttribute="product"
			action="${base}manage_products/${product.id}" method="get"
			class="mt-3 align-items-center" enctype="multipart/form-data">

			<label class="mt-3">Mã kính</label>
			<sf:input path="id" class="form-control" name="productId"
				readonly="readonly" />
			<div class="mt-3">
				<label for="fileProductAvatar" class="form-label">Hỉnh ảnh</label>
			</div>

			<div class="input-group mb-3">
				<img alt="" style="width: 100px; height: 100px;"
					src="${base }/upload/${product.avatar}">
			</div>

			<!--Path chỉ nên mapping với các kiểu(int,string...) 
							nên k dùng Foreach để mapping với kiểu Object  -->
			<label class="mt-3">Thương hiệu</label>
			<sf:select path="categories.id" class="form-control" id="category">
				<sf:options items="${categories }" itemValue="id" itemLabel="name"></sf:options>

			</sf:select>

			<%-- <label class="mt-3">Màu sắc</label>
													<sf:select path="color" name="color" class="form-control">
														<sf:option value="">Chọn màu sắc</sf:option>
														<sf:option value="Xanh">Xanh</sf:option>
														<sf:option value="Nâu">Nâu</sf:option>
														<sf:option value="Xám">Xám</sf:option>
														<sf:option value="Trắng">Trắng</sf:option>
														<sf:option value="Hồng">Hồng</sf:option>
														<sf:option value="Vàng">Vàng</sf:option>
													</sf:select> --%>
			<label class="mt-3">Giá bán</label>
			<sf:input path="price" type="text" class="form-control" name="price" />
			<label class="mt-3">Giá khuyến mãi</label>
			<sf:input path="priceSale" type="text" class="form-control"
				name="price" />
			<label class="mt-3">Số lượng</label>
			<sf:input path="quantity" type="number" class="form-control"
				name="quantity" min="1" />
			<label class="mt-3">Mô tả ngắn</label>
			<sf:input path="shortDes" type="text" class="form-control"
				name="quantity" min="1" />
			<label class="mt-3">Mô tả chi tiết</label>
			<sf:textarea path="detail" name="description" id="summernote"
				rows="3" class="form-control"></sf:textarea>



			<div class="mt-3">
				<label for="fileProductPictures" class="form-label">Ảnh chi
					tiết</label>
			</div>

			<!-- <label class="mt-3">Ảnh chi tiết</label>
							<div class="input-group mb-3">
								<div class="custom-file">
									<input type="file" class="custom-file-input"
										id="fileProductPictures" name="productPictures"
										multiple="multiple"> 
										<label class="custom-file-label" for="fileProductPictures">Tải hình ảnh lên</label>
								</div>
							</div> -->
			<div class="input-group">
				<c:forEach items="${product.productImages }" var="productImage">
					<img alt=""
						style="width: 100px; height: 100px; margin-right: 15px;"
						src="${base }/upload/${productImage.path}">
				</c:forEach>

			</div>


			<%-- <div class="container content-page-detail">
				<div class="glass-img-detail">
					<img alt="" src="${base }/upload/${product.avatar}">
				</div>
				<div class="detail-info">
					<h5 class="product-title ">Mã kính : ${product.id}</h5>
					<h5 class="product-price">
						Thương hiệu : <span>${product.price} VNĐ</span>
					</h5>
					<h5 class="product-price">
						Giá : <span>${product.price} VNĐ</span>
					</h5>
					<h5 class="pd_summary">Mô tả</h5>
					<p id="summernote">${product.detail}</p>
					<h5>
						Số lượng : <span class="quantity-icon-action">${product.quantity}
						</span>
					</h5>
				</div>
			</div> --%>

			<!-- <button type="submit" class="btn btn-small btn-primary mt-3">Sửa</button>
		<button type="reset" data-dismiss="modal"
			class="btn btn-small btn-secondary mt-3 ms-3">Hủy</button> -->

		</sf:form>
	</div>



	<script>
		var x = document.getElementById("summernote").value;
		var s1 = 0;
		for (let i = 1; i < x.length / 2; i++) {
			if (x[i] == ">" && x[i + 1] != "<")
				s1 = i;
		}
		var s2 = 0;
		for (let i = 0; i < x.length; i++) {
			if (x[i] == "<" && x[i + 1] == "/") {
				s2 = i;
				break;
			}
		}

		var x = document.getElementById("summernote").innerHTML = x.slice(
				s1 + 1, s2);
	</script>
</body>
</html>