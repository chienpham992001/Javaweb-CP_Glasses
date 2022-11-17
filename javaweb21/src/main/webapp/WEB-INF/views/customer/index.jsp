<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>

<title>CP Glasses | Home Page</title>
<jsp:include page="/WEB-INF/views/customer/layout/css_js_head.jsp"></jsp:include>
</head>

<body>
	<!--Header-->
	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
	<main>
		<div class=" banner">
			<!-- Carousel -->
			<div id="demo" class="carousel slide" data-bs-ride="carousel">
				<!-- Indicators/dots -->
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#demo" data-bs-slide-to="0"
						class="active"></button>
					<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
					<button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
					<button type="button" data-bs-target="#demo" data-bs-slide-to="3"></button>
				</div>
				<!-- The slideshow/carousel -->
				<div class="carousel-inner">
					<div class="carousel-item active">
						<div class="banner_detail">
							<div class="banner_title">
								<h1>Kính râm thời trang</h1>
								<h3>
									Khám phá bộ sưu tập theo phong cách của biểu tượng thời trang
									Caroline <br> Issa trong chiến dịch mùa mới của chúng tôi.
								</h3>
							</div>
							<a href="/products"><button class="buy">Mua Ngay</button></a>
						</div>
						<img src="${base}/img/banner/banner4.jpg" alt="Los Angeles"
							class="d-block">
					</div>
					<div class="carousel-item">
						<div class="banner_detail">
							<div class="banner_title">
								<h1>Kính râm thời trang</h1>
								<h3>
									Khám phá bộ sưu tập theo phong cách của biểu tượng thời trang
									Caroline <br> Issa trong chiến dịch mùa mới của chúng tôi.
								</h3>
							</div>
							<a href=""><button class="buy">Mua Ngay</button></a>
						</div>
						<img src="${base}/img/banner/banner01.jpg" alt="Chicago"
							class="d-block">
					</div>
					<div class="carousel-item">
						<div class="banner_detail">
							<div class="banner_title">
								<h1>Kính râm thời trang</h1>
								<h3>
									Khám phá bộ sưu tập theo phong cách của biểu tượng thời trang
									Caroline <br> Issa trong chiến dịch mùa mới của chúng tôi.
								</h3>
							</div>
							<a href=""><button class="buy">Mua Ngay</button></a>
						</div>
						<img src="${base}/img/banner/banner03.jpg" alt="New York"
							class="d-block">
					</div>

					<div class="carousel-item">
						<div class="banner_detail">
							<div class="banner_title">
								<h1>Kính râm thời trang</h1>
								<h3>
									Khám phá bộ sưu tập theo phong cách của biểu tượng thời trang
									Caroline <br> Issa trong chiến dịch mùa mới của chúng tôi.
								</h3>
							</div>
							<a href=""><button class="buy">Mua Ngay</button></a>
						</div>
						<img src="${base}/img/banner/banner2.jpg" alt="New York"
							class="d-block">
					</div>
				</div>

				<!-- Left and right controls/icons -->
				<button class="carousel-control-prev" type="button"
					data-bs-target="#demo" data-bs-slide="prev">
					<span class="carousel-control-prev-icon"></span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#demo" data-bs-slide="next">
					<span class="carousel-control-next-icon"></span>
				</button>
			</div>
		</div>
		<!-- <ol class="bread_crumb">
        <li><a href="">Home</a></li>
        <li><a href="">Quần áo</a></li>
        <li>Quần Jean</li>
      </ol> -->

		<div class="container content"></div>

		<div class="container">
			<div class="title">
				<h2>Sản Phẩm Phổ Biến</h2>
			</div>
			<div class="row justify-content-between">
				<div class="left_popular col-lg-4 col-12">
					<img src="${base}/img/model/model1.png" alt="">
				</div>
				<div class="right_popular col-lg-8">
					<div class="row">

						<c:forEach items="${products}" var="product" varStatus="loop">
							<div class="glass col-lg-4 col-6">
								<div class="product_img">
									<img class="glass_image" src="${base}/upload/${product.avatar}" alt="">
									<div class="glass_icon_action">
										<button class="btn-search">
											<i class="fa fa-search"></i>
										</button>
										<i class="fa fa-heart"></i> <i class="fa fa-shopping-cart"
											onclick="AddToCart('${base}',${product.id},1)"></i>
									</div>
								</div>
								<div class="glass_name">
									<a href="${base}product_detail?id=${product.id}">${product.title}</a>
								</div>

								<div class="price">
									<fmt:setLocale value="vi_VN" scope="session" />
									<fmt:formatNumber value="${product.price}" type="currency"></fmt:formatNumber>
								</div>

							</div>


						</c:forEach>

					</div>
				</div>
			</div>
		</div>
		</div>
		</div>

		<div class="container ">
			<div class="row">
				<div class="benefit col-lg-3 col-6">
					<div class="benefit-box ">
						<div class="benefit-icon">
							<i class="fa-solid fa-truck-fast"></i>
						</div>
						<div class="benefit-content">Giao hàng nhanh, tiết kiệm</div>
					</div>
				</div>
				<div class="benefit col-lg-3 col-6">
					<div class="benefit-box ">
						<div class="benefit-icon">
							<i class="fa-solid fa-arrow-rotate-left"></i>
						</div>
						<div class="benefit-content">Đổi trả trong vòng 7 ngày đầu</div>
					</div>
				</div>
				<div class="benefit col-lg-3 col-6">
					<div class="benefit-box ">
						<div class="benefit-icon">
							<i class="fa-solid fa-medal"></i>
						</div>
						<div class="benefit-content">Bảo hành trong vòng 6 tháng</div>
					</div>
				</div>
				<div class="benefit col-lg-3 col-6">
					<div class="benefit-box">
						<div class="benefit-icon">
							<i class="fa-solid fa-glasses"></i>
						</div>
						<div class="benefit-content">Chất lượng đảm bảo 100%</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container category">
			<div class="title">
				<h2>Danh Mục Sản Phẩm</h2>
			</div>
			<div class="row">
				<div class="left_category col-lg-8 ">
					<div class="row">
						<div class="category_box col-lg-4">
							<img src="${base}/img/category/gong-kinh-ram.jpg" alt="">
							<div class="overlay">
								<div class="text">
									<a href="">Kính Râm</a>
								</div>
								<a href=""><button class="buy">Mua Ngay</button></a>
							</div>
						</div>
						<div class="category_box col-lg-7">
							<img src="${base}/img/category/kinh-ram.jpg" alt="">
							<div class="overlay">
								<div class="text">
									<a href="">Kính Chính Hãng</a>
								</div>
								<a href=""><button class="buy">Mua Ngay</button></a>
							</div>
						</div>
						<div class="category_box col-lg-7">
							<img src="${base}/img/category/kinh-can.jpg" alt="">
							<div class="overlay">
								<div class="text">
									<a href="">Kính Cận</a>
								</div>
								<a href=""><button class="buy">Mua Ngay</button></a>
							</div>
						</div>
						<div class="category_box col-lg-4">
							<img src="${base}/img/category/kinh-ap-trong.jpg" alt="">
							<div class="overlay">
								<div class="text">
									<a href="">Kính Áp Tròng</a>
								</div>
								<a href=""><button class="buy">Mua Ngay</button></a>
							</div>
						</div>
					</div>
				</div>
				<div class="right_category col-lg-4">
					<div class="category_box ">
						<img src="${base}/img/category/sale.jpg" alt="">
						<div class="overlay">
							<div class="text">
								<a href="">Sale</a>
							</div>
							<a href=""><button class="buy">Mua Ngay</button></a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="brand-slider h-100">
				<div class="row align-items-center h-100">
					<div class="container rounded">
						<div class="title">
							<h2>Các thương hiệu nổi bật</h2>
						</div>
						<div class="slider">
							<div class="logos">
								<img src="${base}/img/brands/gucci.jpg" alt=""> <img
									src="${base}/img/brands/balenciaga.jpg" alt=""> <img
									src="${base}/img/brands/chanel.jpg" alt=""> <img
									src="${base}/img/brands/dior.jpg" alt=""> <img
									src="${base}/img/brands/lv.jpg" alt=""> <img
									src="${base}/img/brands/ysl.jpg" alt="">
							</div>
							<div class="logos">
								<img src="${base}/img/brands/gucci.jpg" alt=""> <img
									src="${base}/img/brands/balenciaga.jpg" alt=""> <img
									src="${base}/img/brands/chanel.jpg" alt=""> <img
									src="${base}/img/brands/dior.jpg" alt=""> <img
									src="${base}/img/brands/lv.jpg" alt=""> <img
									src="${base}/img/brands/ysl.jpg" alt="">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<!--Footer-->
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>

	<div id="myModal" class="modal quickview_product">
		<!-- Nội dung form đăng nhập -->
		<div class="modal-content">
			<form action="#">
				<span class="close">&times;</span>
				<div class="container content-page-detail">
					<div class="glass-img-detail">
						<img src="${base}/img/glasses/glass1.jpg" alt="">
					</div>
					<div class="detail-info">
						<h3 class="product-title ">Kính râm Linemai K304</h3>
						<div class="product-price">850.000 VND</div>
						<div class="pd_summary">Sản xuất bởi những vật liệu cao cấp
							với gọng kính được bo tròn tinh tế và trang nhã...</div>
						<div class="quantity">
							<h5>Số lượng</h5>
							<div class="quantity-icon-action">
								<i onclick="minusQuantity()" class="fa-solid fa-minus"></i> <span
									class="quantity-number" id="quantity-number">1</span> <i
									onclick="plusQuantity()" class="fa-solid fa-plus"></i>
							</div>
						</div>
						<script>
							
						</script>
						<div class="btn-action">
							<button class="add_to_cart">Thêm vào giỏ hàng</button>
							<button class="buy_now">Mua ngay</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="modal fade bd-example-modal-lg " id="modal_subcribe">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="close closemodal" data-dismiss="modal">
						<span>&times;</span>
					</button>
					<img src="${base }/img/logo/logo.png" alt="">
					<h2>ĐĂNG KÝ THÀNH VIÊN CỦA CP GLASSES</h2>
					<p>Nhận được các ưu đãi sớm nhất của CP Glasses khi đăng ký
						ngày hôm nay</p>
					<form>
						<input type="text" id="email_subcriber" class="email_subcribe"
							placeholder="Email của bạn">
						<button type="button" class="btn" onclick="callAjaxSubcriber()">Đăng
							ký</button>
					</form>
					<script type="text/javascript">
						function callAjaxSubcriber() {
							if(document.getElementById('email_subcriber').value!=""){

								  $("#modal_subcribe").modal('hide');
								var requestBody = {
										email : jQuery("#email_subcriber").val()
									};

									jQuery.ajax({
										url : "${base}/home",
										method : "post",
										contentType : "application/json",
										data : JSON.stringify(requestBody),

										dataType : "json",
										success : function(jsonResult) {
											alert(jsonResult.statusCode + " - "
													+ jsonResult.statusMessage);
										},
										error : function(jqXhr, textStatus,
												errorMessage) {
											alert("error");
										}
									});
							  }
						}
					</script>
				</div>
				<div class="modal-footer">
					<div class="closemodal">Không, cảm ơn</div>
				</div>
			</div>
		</div>
	</div>

	<!-- <div data-id="tu_1">ABCD</div> -->
	<script src="${base}/js/script.js"></script>
</body>


</html>