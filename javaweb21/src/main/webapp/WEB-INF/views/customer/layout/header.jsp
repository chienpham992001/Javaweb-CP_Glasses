<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
	<a href=""> <img class="logo" src="${base}/img/logo/logo.png"
		alt="">
	</a>

	<div class="menu">
		<div class="rong"></div>
		<ul>
			<li><a href="/home">Trang chủ</a></li>
			<li><a href="/products">Sản phẩm</a></li>
			<li class="active" id="products"><a href="">Thương hiệu</a>
				<ul class="menu_con">
					<c:forEach items="${categories}" var="category">
						<li><a href="/products?categoryId=${category.id }">${category.name }</a></li>
					</c:forEach>
				</ul></li>
			<li><a href="">Kiến thức</a></li>
			<li><a href="/contact">Liên hệ</a></li>

			<!-- GET: Thường dùng cho tìm kiếm...:đẩy value lên URL  ; POST: dùng cho đăng nhập, đăng ký: bảo mật -->
		</ul>
		<div class="search">
			<form action="${base}/products" method="GET">
				<input class="key_word" type="text" placeholder="Tìm kiếm" id="keyword" name="keyword"  >
				<button type="submit" class="search_function">
					<i class="fa fa-search"></i>
				</button>
			</form>
		</div>
	</div>
	<div class="right_function">
		<div>
			<!-- <button type="button" class="btn">
          <i class="bi bi-person" aria-hidden="true"></i>
        </button> -->
			<div class="user-profile pull-right">
				<%-- <img class="avatar user-thumb"
								src="${base}/img/author/avatar.png" alt="avatar"> --%>
				<button type="button" class="user-name dropdown-toggle btn"
					data-toggle="dropdown">
					<i class="bi bi-person" aria-hidden="true"></i>
				</button>
				<div class="dropdown-menu">
					<c:if test="${isLogined}">
						<a class="dropdown-item"
							href="/user/user_profile?id=${userLogined.id }">Thông tin cá
							nhân</a>
						<a class="dropdown-item" href="/logout">Đăng xuất</a>
					</c:if>
					<c:if test="${!isLogined}">
						<a class="dropdown-item" href="/login">Đăng nhập</a>
						<a class="dropdown-item" href="/register">Đăng ký</a>
					</c:if>


				</div>
			</div>
		</div>
		<!-- <a href="#"><i class="bi bi-person"></i></a> -->
		<!-- <a href="cart.html"><i class="fa fa-shopping-cart"></i></a> -->

		<div class="dropdown">
			<button type="button" class="btn" data-toggle="dropdown">
				<i class="bi bi-cart" aria-hidden="true"></i>
			</button>
			<span id="quantity_items"> <c:if
					test="${totalItems==null || cart==null}">
					0
				</c:if> <c:if test="${totalItems!=null}">
					${totalItems}
				</c:if>

			</span>
			<div class="dropdown-menu" id="dropdown-cart-items">
				<c:forEach items="${cart.cartItems}" var="sp">
					<div class="row cart-detail">
						<div class="col-lg-4 col-sm-4 col-4 cart-detail-img">
							<img src="${base }/upload/${sp.avatar}">
						</div>
						<div class="col-lg-8 col-sm-8 col-8 cart-detail-product">
							<p>${sp.productName }</p>
							<span class="price "> <fmt:setLocale value="vi_VN" /> <strong>
									<fmt:formatNumber value="${sp.priceUnit*sp.quanlity}"
										type="currency" />
							</strong>
							</span> <span class="count"> SL: ${sp.quanlity }</span>
						</div>
					</div>
				</c:forEach>


				<div class="row total-header-section">
					<!-- <p style="font-weight: 600;">
						Tổng tiền: <span style="color: #ff871d;">5.400.000 VNĐ</span>
					</p> -->
				</div>

				<div class="link-to-cart">
					<a href="${base }/cart/checkout">Xem giỏ hàng</a>
				</div>
			</div>
		</div>
	</div>

	<script src="${base}/js/script.js"></script>
</header>