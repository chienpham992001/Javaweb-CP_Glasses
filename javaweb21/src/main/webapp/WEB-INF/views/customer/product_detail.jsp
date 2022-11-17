<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<title>Chi tiết sản phẩm</title>

<jsp:include page="/WEB-INF/views/customer/layout/css_js_head.jsp"></jsp:include>
</head>
<body>
	<!--Header-->
	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
	<main>
		<div class="page_banner">
			<div class="page_title">
				<h1>Chi tiết sản phẩm</h1>
				<ol class="bread_crumb">
					<li><a href="">Trang chủ</a></li>
					<li><a href="">Sản phẩm</a></li>
				</ol>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="glass-img-detail col-lg-7 col-12">
					<img src="${base}/upload/${product.avatar}" alt="">
				</div>
				<div class="detail-info col-lg-4 col-12 mt-5">
					<h3 class="product-title ">${product.title }</h3>

					<div class="product-price">
						<fmt:setLocale value="vi_VN" scope="session" />
						<fmt:formatNumber value="${product.price}" type="currency"></fmt:formatNumber>
					</div>
					<div class="glass-details">
						Loại : <span>Kính râm</span>
					</div>
					<div class="glass-details">
						Hãng : <span>${product.categories.name }</span>
					</div>
					<!-- <div class="glass-details">
						Màu sắc : <span>Đen</span>
					</div> -->

					<div class="pd_summary">${product.shortDes }</div>
					<div class="special-offer">
						<h5 class="offer-title">Ưu đãi đặc biệt</h5>
						<ul>
							<li>Có sẵn</li>
							<li>Giao hàng, vận chuyển miễn phí</li>
							<li>Giảm Giá 30% với mã: Deal30</li>
						</ul>
					</div>

					<div class="btn-action">
						<button class="add_to_cart"
							onclick="AddToCart('${base}',${product.id},1)">Thêm vào
							giỏ hàng</button>
						<button class="buy_now">Mua ngay</button>
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

		<div class="container mt-4">
			<div class="tabs">
				<div class="tab-2">
					<label for="tab2-1">Đánh giá sản phẩm</label> <input id="tab2-1"
						name="tabs-two" type="radio" checked="checked">
					<div>
						<div class="row">
							<div class="col-md-12">
								<div class="card">
									<div class="comment-widgets m-b-20">
										<c:forEach items="${productReviews }" var="review">
											<div class="d-flex flex-row comment-row">
												<div class="p-2">
													<span class="round"><img
														src="https://i.imgur.com/cAdLHeY.jpg" alt="user"
														width="50"></span>
												</div>
												<div class="comment-text w-100">
													<h5>${review.user.username }</h5>
													<div class="comment-footer">
														<span class="action-icons"> 
														<c:forEach begin="1" end="${review.rate }">
        														<span class="fa fa-star vote"></span>
														</c:forEach>
														<c:forEach begin="${review.rate+1 }" end="5">
        														<span class="fa fa-star"></span>
														</c:forEach> 
														
														</span>
														<div class="date">${review.createdDate }</div>
													</div>
													<p class="m-b-5 m-t-10">${review.feedback }</p>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
				<div class="tab-2">
					<label for="tab2-2">Thông tin thêm</label> <input id="tab2-2"
						name="tabs-two" type="radio">
					<div>
						<div class="row">
							<div class="addition-info-image col-lg-6 col-12">
								<img src="${base }/img/model/detail_info.jpg" alt="">
							</div>

							<div class="more_info col-lg-6 col-12">
								<div class="addition-info-content">Thương hiệu ${product.categories.name} –
									biểu tượng quyền lực của thời trang</div>
								<div class="description">${product.categories.description}</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>
	</main>
	<!--Footer-->
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>

	<script src="${base}/js/script.js"></script>
</body>
</html>