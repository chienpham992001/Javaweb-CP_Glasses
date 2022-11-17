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
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Add new product | CP Glasses</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<link rel="shortcut icon" type="image/png"
	href="${base}/img/icon/favicon.ico">
<link rel="stylesheet" href="${base}/css/bootstrap.min.css">
<link rel="stylesheet" href="${base}/css/font-awesome.min.css">
<link rel="stylesheet" href="${base}/css/themify-icons.css">
<link rel="stylesheet" href="${base}/css/metisMenu.css">
<link rel="stylesheet" href="${base}/css/owl.carousel.min.css">
<link rel="stylesheet" href="${base}/css/slicknav.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<!-- amcharts css -->
<link rel="stylesheet"
	href="https://www.amcharts.com/lib/3/plugins/export/export.css"
	type="text/css" media="all" />
<!-- Start datatable css -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.18/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.jqueryui.min.css">
<!-- style css -->
<link rel="stylesheet" href="${base}/css/typography.css">
<link rel="stylesheet" href="${base}/css/default-css.css">
<link rel="stylesheet" href="${base}/css/styles.css">
<link rel="stylesheet" href="${base}/css/responsive.css">
<!-- modernizr css -->
<script src="${base}/js/vendor/modernizr-2.8.3.min.js"></script>

<!-- Sumernote -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>
<body>
	<!-- <div id="preloader">
		<div class="loader"></div>
	</div> -->
	<!-- preloader area end -->
	<!-- page container area start -->
	<div class="page-container">
		<!-- sidebar menu area start -->

		<jsp:include page="/WEB-INF/views/administrator/layout/menu.jsp"></jsp:include>
		<!-- sidebar menu area end -->
		<!-- main content area start -->
		<div class="main-content">
			<!-- header area start -->

			<jsp:include page="/WEB-INF/views/administrator/layout/header.jsp"></jsp:include>
			<!-- header area end -->
			<!-- page title area start -->
			<div class="page-title-area">
				<div class="row align-items-center">
					<div class="col-sm-6">
						<div class="breadcrumbs-area clearfix">
							<h4 class="page-title pull-left">Quản lý sản phẩm</h4>
							<ul class="breadcrumbs pull-left">
								<li><a href="${base}">Trang chủ</a></li>
								<li><span>Thêm mới sản phẩm</span></li>
							</ul>
						</div>
					</div>
					<jsp:include page="/WEB-INF/views/administrator/layout/user_profile.jsp"></jsp:include>
				</div>
			</div>
			<!-- page title area end -->
			<div class="main-content-inner form-input-data">

				<div class="row">
					<!-- Primary table start -->
					<div class="col-9 mt-3">
						<h3 class="text-center">Thêm mới sản phẩm</h3>

						<!--enctype : khi submit sẽ có file đính kèm gửi lên  -->
						<sf:form modelAttribute="product"
							action="${base}/admin/add_product" method="post"
							class="mt-3 align-items-center" enctype="multipart/form-data">
							
							<!-- <label class="mt-3">Mã kính</label> -->
							<sf:hidden path="id" class="form-control" name="id" />
							
							<label class="mt-3">Tên kính</label>
							<sf:input path="title" class="form-control" name="title" />
							<sf:errors path="title" cssClass="alert alert-danger" element="div"></sf:errors>	
							<!--Path chỉ nên mapping với các kiểu(int,string...) 
							nên k dùng Foreach để mapping với kiểu Object  -->
							<label class="mt-3">Thương hiệu</label>
							<sf:select path="categories.id" class="form-control"
								id="category">
								<sf:options items="${categories }" itemValue="id"
									itemLabel="name"></sf:options>

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
							<sf:input path="price" type="text" class="form-control"
								name="price" />
							<sf:errors path="price" cssClass="alert alert-danger" element="div"></sf:errors>
							
							<label class="mt-3">Giá khuyến mãi</label>
							<sf:input path="priceSale" type="text" class="form-control"
								name="priceSale" />
							
							<label class="mt-3">Số lượng</label>
							<sf:input path="quantity" type="number" class="form-control"
								name="quantity" />
							<sf:errors path="quantity" cssClass="alert alert-danger" element="div"></sf:errors>
							
							<label class="mt-3">Mô tả ngắn</label>
							<sf:input path="shortDes" type="text" class="form-control"
								name="shortDes"  />
							<sf:errors path="shortDes" cssClass="alert alert-danger" element="div"></sf:errors>
							
							<label class="mt-3">Mô tả chi tiết</label>
							<sf:textarea path="detail" name="description" id="summernote"
								rows="10" class="form-control"></sf:textarea>
							<sf:errors path="detail" cssClass="alert alert-danger" element="div"></sf:errors>
							<div class="mt-3">
								<label for="fileProductAvatar" class="form-label">Hỉnh
									ảnh</label> 
									<input class="form-control" type="file"
									id="fileProductAvatar" name="productAvatar">
							</div>

							<div class="input-group mb-3">
								<img alt="" style="width: 100px; height: 100px;"
									src="${base }/upload/${product.avatar}">
							</div>

							<div class="mb-3">
								<label for="fileProductPictures" class="form-label">Ảnh
									chi tiết</label> <input class="form-control" type="file"
									id="fileProductPictures" name="productPictures"
									multiple="multiple">
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
									<img alt="" style="width: 100px; height: 100px;"
										src="${base }/upload/${productImage.path}">
								</c:forEach>

							</div>


							<button type="submit" class="btn btn-small btn-primary mt-3">Thêm
								mới</button>
							<button type="reset"
								class="btn btn-small btn-secondary mt-3 ms-3">Hủy</button>

						</sf:form>

					</div>
					<!-- Primary table end -->
				</div>
			</div>
		</div>
		<!-- main content area end -->
		<!-- footer area start-->

		<jsp:include page="/WEB-INF/views/administrator/layout/footer.jsp"></jsp:include>
		<!-- footer area end-->
	</div>
	<!-- page container area end -->
	
	<script>
		$('#summernote').summernote({
			placeholder : 'Mô tả',
			tabsize : 2,
			height : 100
		});
	</script>
	<jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
</body>
</html>