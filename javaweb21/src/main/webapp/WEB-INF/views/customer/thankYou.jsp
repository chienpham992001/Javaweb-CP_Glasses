<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- taglib SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giỏ hàng - CP Glasses</title>

<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/customer/layout/css_js_head.jsp"></jsp:include>
<style>
.img_thankYou{
	width: 50%;
}
</style>
</head>
<body>
	<!--Header-->
	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
	<main>
		<div class="page_banner">
			<div class="page_title">
				<h1>Giỏ hàng</h1>
				<ol class="bread_crumb">
					<li><a href="">Trang chủ</a></li>
					<li><a href="">Giỏ hàng</a></li>
				</ol>
			</div>
		</div>
		<section class="wizard-section">
			<div class="row no-gutters">
				<div class="form-wizard">

					<div class="container ">
						<div class=" row text-center">
							<center><img class="img_thankYou" src="${base }/img/logo/thank_you.png" alt=""></center>
							<h2>Cảm ơn bạn khi đã lựa chọn và tin tưởng sản phẩm của CP
								Glasses</h2>
							<h4>Chúc bạn có một ngày vui vẻ</h4>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	<!--Footer-->
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>




	<script src="${base}/js/script.js"></script>
</body>
</html>