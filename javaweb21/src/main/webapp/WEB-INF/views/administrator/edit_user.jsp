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
<title>Add new user | CP Glasses</title>
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
							<h4 class="page-title pull-left">Quản lý người dùng</h4>
							<ul class="breadcrumbs pull-left">
								<li><a href="${base}">Trang chủ</a></li>
								<li><span>Thêm người dùng</span></li>
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
						<h3 class="text-center">Thêm người dùng</h3>

						<!--enctype : khi submit sẽ có file đính kèm gửi lên  -->
						<sf:form modelAttribute="user"
							action="${base}/admin/edit_user" method="post"
							class="mt-3 align-items-center">
							
							<!-- <label class="mt-3">Mã người dùng</label> -->
							<sf:hidden path="id" class="form-control" name="id" />
							
							<label class="mt-3">Họ và tên</label>
							<sf:input path="fullname" type="text" class="form-control"
								name="fullname" />
								
							<label class="mt-3">Tài khoản</label>
							<sf:input path="username" class="form-control" name="username" />

							<label class="mt-3">Mật khẩu</label>
							<sf:input path="password" type="text" class="form-control"
								name="password" />
							
							<label class="mt-3">Số điện thoại</label>
							<sf:input path="phone" type="text" class="form-control"
								name="phone" />
							
							<!-- <label class="mt-3">Vai trò</label> -->
							<%-- <sf:select path="roles" class="form-control"
								id="roles">
								<sf:options items="${roles }" itemValue="id"
									itemLabel="name"></sf:options>

							</sf:select> --%>
							
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