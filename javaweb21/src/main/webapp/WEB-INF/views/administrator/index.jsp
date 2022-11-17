<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>

<title>Management Page - CP Glasses</title>
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
<!-- amchart css -->
<link rel="stylesheet"
	href="https://www.amcharts.com/lib/3/plugins/export/export.css"
	type="text/css" media="all" />
<!-- others css -->
<link rel="stylesheet" href="${base}/css/typography.css">
<link rel="stylesheet" href="${base}/css/default-css.css">
<link rel="stylesheet" href="${base}/css/styles.css">
<link rel="stylesheet" href="${base}/css/responsive.css">
<!-- modernizr css -->
<script src="${base}/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<!-- preloader area start -->
	<div id="preloader">
		<div class="loader"></div>
	</div>
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
							<h4 class="page-title pull-left">Dashboard</h4>
							<ul class="breadcrumbs pull-left">
								<li><a href="${base }">Trang chủ</a></li>
								<li><span>Dashboard</span></li>
							</ul>
						</div>
					</div>
					<jsp:include
						page="/WEB-INF/views/administrator/layout/user_profile.jsp"></jsp:include>
				</div>
			</div>
			<!-- page title area end -->
			<div class="main-content-inner">
				<div class="row">
					<!-- seo fact area start -->
					<div class="col-lg-8">
						<div class="row">
							<div class="col-md-6 mt-5 mb-3">
								<div class="card">
									<div class="seo-fact sbg1">
										<div
											class="p-4 d-flex justify-content-between align-items-center">
											<div class="seofct-icon">
												<i class="bi bi-eyeglasses"></i> Sản phẩm
											</div>
											<h2>${productQuanlity}</h2>
										</div>
										<canvas id="seolinechart1" height="50"></canvas>
									</div>
								</div>
							</div>
							<div class="col-md-6 mt-md-5 mb-3">
								<div class="card">
									<div class="seo-fact sbg2">
										<div
											class="p-4 d-flex justify-content-between align-items-center">
											<div class="seofct-icon">
												<i class="bi bi-badge-tm"></i>Thương hiệu
											</div>
											<h2>${categoryQuanlity }</h2>
										</div>
										<canvas id="seolinechart2" height="50"></canvas>
									</div>
								</div>
							</div>
							<div class="col-md-6 mt-md-5 mb-3">
								<div class="card">
									<div class="seo-fact sbg3">
										<div
											class="p-4 d-flex justify-content-between align-items-center">
											<div class="seofct-icon">
												<i class="bi bi-people"></i>Người dùng
											</div>
											<h2>${usersQuanlity }</h2>
										</div>
										<canvas id="seolinechart2" height="50"></canvas>
									</div>
								</div>
							</div>
							<div class="col-md-6 mt-md-5 mb-3">
								<div class="card">
									<div class="seo-fact sbg4">
										<div
											class="p-4 d-flex justify-content-between align-items-center">
											<div class="seofct-icon">
												<i class="bi bi-receipt"></i>Đơn hàng
											</div>
											<h2>${saleOrdersQuanlity }</h2>
										</div>
										<canvas id="seolinechart2" height="50"></canvas>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Advertising area start -->
					<div class="col-lg-4 mt-5">
						<div class="card h-full">
							<div class="card-body">
								<h4 class="header-title">Advertising & Marketing</h4>
								<div id="highpiechart6"></div>
							</div>
						</div>
					</div>
					<!-- Advertising area end -->
					<!-- sales area start -->
					<div class="col-xl-9 col-ml-8 col-lg-8 mt-5">
						<div class="card">
							<div class="card-body">
								<h4 class="header-title">Sales</h4>
								<div id="salesanalytic"></div>
							</div>
						</div>
					</div>
					<!-- sales area end -->

				</div>
				<!-- testimonial area end -->
			</div>
		</div>
	</div>
	<!-- main content area end -->
	<!-- footer area start-->
	<footer>
		<div class="footer-area">
			<p>
				© Copyright 2018. All right reserved. Template by <a
					href="https://colorlib.com/wp/">Colorlib</a>.
			</p>
		</div>
	</footer>
	<!-- footer area end-->

	<!-- page container area end -->


	<jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
</body>
</html>