<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>

<title>CP Glasses | Contact</title>

<jsp:include page="/WEB-INF/views/customer/layout/css_js_head.jsp"></jsp:include>
</head>

<body>

	<!--Header-->
	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>

	<main>
		<div class="page_banner">
			<div class="page_title">
				<h1>Liên hệ</h1>
				<ol class="bread_crumb">
					<li><a href="">Trang chủ</a></li>
					<li><a href="">Liên hệ</a></li>
				</ol>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="contact_info">
						<h2>Thông tin liên hệ</h2>
						<p>
							Nếu có thắc mắc, hoặc gặp vấn đề nào đó, hãy liên hệ ngay với
							chúng tôi để được các nhân viên tư vấn hỗ trợ và tư vấn. <br>
							Để biết thêm về các chính sách của chúng tôi, bạn có thể tham
							khảo <br> <span><a href="">Điều khoản và Điều
									kiện của chúng tôi.</a></span>
						</p>
						<div class="info_find">
							<div class="icon-box-wrapper">
								<i class="bi bi-geo-alt"></i>
								<div class="icon-box-content">
									<h3>Địa chỉ</h3>
									<p>164 Tôn Đức Thắng – Đống Đa HN</p>
									<p>38 Nguyễn Khang – Cầu Giấy HN</p>
									<p>298 Nguyễn Trãi – Hà Đông HN</p>
								</div>
							</div>
							<div class="icon-box-wrapper">
								<i class="bi bi-telephone"></i>
								<div class="icon-box-content">
									<h3>Điện thoại</h3>
									<p>+84 968209396</p>
								</div>
							</div>
							<div class="icon-box-wrapper">
								<i class="bi bi-facebook"></i>
								<div class="icon-box-content">
									<h3>FaceBook</h3>
									<a href="">www.facebook.com/kinhmatCP</a>
								</div>
							</div>
							<div class="icon-box-wrapper">
								<i class="bi bi-envelope"></i>
								<div class="icon-box-content">
									<h3>Email</h3>
									<a href="mailto:cp_glasses@gmail.com">cp_glasses@gmail.com</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="contact_info">
						<h2>Gửi Ý Kiến Cho Chúng Tôi</h2>
						<div class="box-email">

							<!-- Cách 1 : Đơn giản -->
							<!-- Khi click vào button submit thì sẽ tạo các request với Controller dưới dạng POST -->
							<!-- Nếu method = get thì giá trị của input được đẩy theo query Param-->
							<%-- <form action="${base}/contact" method="post">
								<div class="form-floating">
									<input type="text" class="form-control" name="fullname"
										id="floatingInputUsername" placeholder="Họ và tên" required
										autofocus> <label for="floatingInputUsername">Họ
										và tên</label>
								</div>

								<div class="form-floating">
									<input type="text" class="form-control" name="subject"
										id="floatingInputTitle" placeholder="Tiêu đề"> <label
										for="floatingInputTitle">Tiêu đề</label>
								</div>

								<div class="form-floating">
									<textarea id="" cols="100" rows="10" class="form-control"
										placeholder="Ý kiến của bạn" name="message"
										id="floatingContent"></textarea>
									<label for="floatingContent">Ý kiến của bạn</label>
								</div>
								<div class="d-grid">
									<button class="btn-send" type="submit">Gửi</button>
								</div>
							</form> --%>

							<!-- Cách 2 : Sử dụng spring-form -->
							<!-- Bước 1: Import thư viện taglib spring-form -->
							<!-- Bước 2: Tạo data mapping, trong trường hợp này là class Contact -->
							<!-- Bước 3: Sử dụng các thẻ Spring-form để tạo form -->
							<!-- modelAttribute: chỉ cho spring-form biết data nào cần binding (tên data là 
							contact vì ở controller đẩy xuống với  tên là contact -->
							<!-- path: trỏ tới property của data binding -->
						
							<sf:form modelAttribute="contact" action="${base}/contact"
								method="post" enctype="multipart/form-data">
								<div class="form-floating">
									<sf:input path="fullname" type="text" class="form-control"
										name="fullname" id="fullname"
										placeholder="Họ và tên"/>
									<label for="fullname">Họ và tên</label>
								</div>

								<div class="form-floating">
									<sf:input path="subject" type="text" class="form-control"
										name="subject" id="floatingInputTitle" placeholder="Tiêu đề" />
									<label for="floatingInputTitle">Tiêu đề</label>
								</div>

								<div class="form-floating">
									<sf:textarea path="message" cols="100" rows="10" name="message"
										class="form-control" placeholder="Ý kiến của bạn"
										id="floatingContent"></sf:textarea>
									<label  for="floatingContent">Ý kiến của bạn</label>
								</div>
								<div class="d-grid">
									<button class="btn-send" type="submit">Gửi</button>
								</div>
							</sf:form>

							<!--Cách 3: Sử dụng Ajax  -->
							<!-- <form>
								<div class="form-floating">
									<input type="text" class="form-control" name="fullname"
										id="floatingInputUsername" placeholder="Họ và tên" required
										autofocus> <label for="floatingInputUsername">Họ
										và tên</label>
								</div>

								<div class="form-floating">
									<input type="text" class="form-control" name="subject"
										id="floatingInputTitle" placeholder="Tiêu đề"> <label
										for="floatingInputTitle">Tiêu đề</label>
								</div>

								<div class="form-floating">
									<textarea id="" cols="100" rows="10" class="form-control"
										placeholder="Ý kiến của bạn" name="message"
										id="floatingMessage"></textarea>
									<label for="floatingMessage">Ý kiến của bạn</label>
								</div> -->
							<!--Không sử dụng type:submit  -->
							<!-- <div class="d-grid">
									<button type="button" class="btn-send" onclick="callAjax()">Gửi</button>
								</div>
							</form> -->

							<!-- <script type="text/javascript">
							
								function callAjax() {
	                   			 <!-- tạo javascript object để binding với data bên phía controller   -->
							<!-- var requestBody = {
	                   					fullname: jQuery("#floatingInputUsername").val(),// lay theo id
	                   					subject: jQuery("#floatingInputTitle").val(),  // lay theo id
	                   			}; -->

							<!-- // $ === jQuery
	                   			// json == javascript object -->
							<%-- jQuery.ajax({
	                   				url: "${base}/contact", 	   	   <!-- //->request mapping định nghĩa bên controller -->
	                   				type: "post",					   <!-- //-> method type của Request Mapping	 -->
	                   				contentType: "application/json",   <!-- //-> nội dung gửi lên dạng json <=> javascript object -->
	                   				data: JSON.stringify(requestBody), <!-- //-> chuyển 1 javascript object thành string json -->
	
	                   				dataType: "json", 				   <!-- // kiểu dữ liệu trả về từ Controller -->
	                   				success: function(jsonResult) {    <!-- // gọi ajax thành công -->
	                   					alert(jsonResult.statusCode + " - " + jsonResult.statusMessage);
	                   				},
	                   				error: function(jqXhr, textStatus, errorMessage) { <!-- // gọi ajax thất bại -->
	                   					alert("error");
	                   				}
	                   			});
	                   		}
							</script> --> --%>
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