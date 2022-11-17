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
		<div class="page_banner">
			<div class="page_title">
				<h1>Sản phẩm</h1>
				<ol class="bread_crumb">
					<li><a href="">Trang chủ</a></li>
					<li><a href="">Sản phẩm</a></li>
				</ol>
			</div>
		</div>
		<div class="container-fluid content">

			<form action="${base}/products" method="get">
				<div class="row ">
					<div class="slide_bar col-lg-3">
						<div class="filter_category">
							<div class="slide_bar_title ">
								<h4>
									Danh mục sản phẩm <span></span>
								</h4>
							</div>
							<div class="list_catgory">
								<ul>
									<c:if test="${categoriesSearch !=null}">
									<c:set var="i" value="0"></c:set>
									<c:forEach items="${categories}" var="category">
										<label class="range_price color">${category.name } <c:forEach
												items="${categoriesSearch}" var="check_ma">
												<input id="check_category${i}" type="checkbox"
													name="categoryId" value="${category.id }">
												<c:if test="${check_ma == category.id }">
													<script type="text/javascript">
												$("#check_category"+${i}).prop( "checked", true );
												</script>
												</c:if>
												<%-- <c:choose>
														<c:when test="${check_ma.id== category.id}">
															<input type="checkbox" name="categoryId" checked="checked"
																value="${category.id }">
														</c:when>
														<c:otherwise>
															<input type="checkbox" name="categoryId"
																value="${category.id }">
														</c:otherwise>
													</c:choose> --%>

											</c:forEach> <span class="checkmark "></span>
										</label>
										<c:set var="i" value="${i+1 }"></c:set>


									</c:forEach>


									</c:if>
									<c:if test="${categoriesSearch == null}">
										<c:set var="i" value="0"></c:set>
										<c:forEach items="${categories}" var="category">
											<label class="range_price color">${category.name } <input
												id="category_check${i}" type="checkbox" name="categoryId"
												value="${category.id }"> <span class="checkmark "></span>
											</label>
											<c:set var="i" value="${i+1 }"></c:set>
										</c:forEach>
									</c:if>

								</ul>
							</div>
						</div>
						<div class="filter_price">
							<div class="slide_bar_title ">
								<h4>
									Giá <span></span>
								</h4>
							</div>

							<h6>Giá tối thiểu</h6>
							<div class="range-slider">
								<input id="minPrice" class="range-slider__range" type="range"
									name="minPrice" value="0" min="0" max="5000000"> <span
									id="minPrice_value" class="range-slider__value">0</span>
							</div>
							<h6>Giá tối đa</h6>
							<div class="range-slider">
								<input id="maxPrice" class="range-slider__range" type="range"
									name="maxPrice" value="10000000" min="5000000" max="10000000">
								<span id="maxPrice_value" class="range-slider__value">0</span>
							</div>

						</div>
						<!-- <div class="filter_color">
							<div class="slide_bar_title ">
								<h4>
									Màu sắc<span></span>
								</h4>
							</div>
							<div class="list_color">
								<label class="color">Nâu <input type="checkbox">
									<span class="checkmark"
									style="background-color: rgb(165, 84, 84);"></span>
								</label> <label class="color">Xanh <input type="checkbox">
									<span class="checkmark"
									style="background-color: rgb(80, 176, 80);"></span>
								</label> <label class="color">Xám <input type="checkbox">
									<span class="checkmark"
									style="background-color: rgb(180, 180, 180);"></span>
								</label> <label class="color">Trắng <input type="checkbox">
									<span class="checkmark white" style="background-color: white;"></span>
								</label> <label class="color">Hồng <input type="checkbox">
									<span class="checkmark" style="background-color: pink;"></span>
								</label> <label class="color">Vàng <input type="checkbox">
									<span class="checkmark"
									style="background-color: rgb(255, 255, 71);"></span>
								</label>
							</div>
							
						</div> -->
						<input hidden="hidden" id="page" name="page" class="form-control">
						<button type="submit" id="btnSearch" name="btnSearch"
							value="Search" class="btn btn-danger">Áp dụng</button>
						<div class="slide_bar_banner">
							<img src="${base}/img/banner/sale_banner.jpg" alt="">
						</div>
					</div>
					<div class="content_page col-lg-9">
						<div class="content_banner">
							<img src="${base}/img/banner/page_banner2.jpg" alt="">
						</div>
						<div class="row mt-5">
							<c:forEach items="${products.data}" var="product">
								<div class="glass col-md-4 col-lg-3  col-6">
									<div class="product_img">
										<img class="glass_image"
											src="${base}/upload/${product.avatar}" alt="">
										<div class="glass_icon_action">
											<i class="fa fa-search btn-search"></i> <i
												class="fa fa-heart"></i> <i class="fa fa-shopping-cart"
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
						<div class="row ">
							<div class="col-12 d-flex justify-content-center mt-3">
								<div id="paging"></div>
							</div>
						</div>
					</div>
				</div>
			</form>


		</div>
	</main>

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

	<script type="text/javascript">
	$(document).ready(function() {
		$('#minPrice').val(${searchModel.minPrice});
		$('#maxPrice').val(${searchModel.maxPrice});
		$('#minPrice_value').text(${searchModel.minPrice});
		$('#maxPrice_value').text(${searchModel.maxPrice});
		
		$("#paging").pagination({
			currentPage:${products.currentPage}, //trang hiện tại
			items : ${products.totalItems},
			itemsOnPage : ${products.sizeOfPage},
			cssStyle : 'compact-theme',
			onPageClick: function(pageNumber,event){
				$('#page').val(pageNumber);
				$('#btnSearch').trigger('click');
			}
		});
	});
    var rangeSlider = function () {
        var slider = $('.range-slider'),
            range = $('.range-slider__range'),
            value = $('.range-slider__value');

        slider.each(function () {

            value.each(function () {
                var value = $(this).prev().attr('value');
                $(this).html(value);
            });

            range.on('input', function () {
                $(this).next(value).html(this.value);
            });
        });
    };

    rangeSlider();
	</script>
	<!--Footer-->
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>

	<script src="${base}/js/script.js"></script>


</body>

</html>