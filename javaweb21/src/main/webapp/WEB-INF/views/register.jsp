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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<title>Đăng ký | CP Glasses</title>

<jsp:include page="/WEB-INF/views/customer/layout/css_js_head.jsp"></jsp:include>
</head>
<body class="lg-rg">
	<div class="container">
		<div class="row">
			<div class="card-lg-rg ">
				<div class=" card-img-left col-lg-5">
					<img src="${base}/img/banner/banner_register.jpg" alt="">
				</div>
				<div class="card-body col-lg-7 col-12">
					<h3>Đăng ký</h3>
					<form>
						<div class="form-floating">
							<input type="text" class="form-control"
								id="floatingInputFullName" placeholder="Họ và tên"
								name="fullname" required > <label
								for="floatingInputFullName">Họ và tên</label>
						</div>
						<div class="form-floating">
							<input type="email" class="form-control" id="floatingInputEmail"
								name="username" placeholder="name@example.com" required > <label
								for="floatingInputEmail">Email</label>
						</div>
						<div class="form-floating">
							<input type="password" class="form-control" id="floatingPassword"
								name="password" placeholder="Password" required> <label
								for="floatingPassword">Mật khẩu</label>
						</div>
						<div class="form-floating">
							<input type="text" class="form-control" id="floatingPhone"
								name="phone" placeholder="Số điện thoại" maxlength="11" required> 
								<label for="floatingPhone">Số điện thoại</label>
						</div>
						<!-- <div class="form-floating">
							<input type="password" class="form-control"
								id="floatingPasswordConfirm" placeholder="Confirm Password">
							<label for="floatingPasswordConfirm">Nhập lại mật khẩu</label>
						</div> -->
						<div class="d-grid">
							<button type ="button" class="btn-register btn-login " onclick="callAjaxRegister()">Đăng
								ký</button>
						</div>
						<a class="rotate-login" href="${base }login">
							<center>Đã có tài khoản? Đăng nhập</center>
						</a>
						<hr>
						<div class="d-grid">
							<button class=" btn-google btn-login ">
								<i class="fab fa-google me-2"></i> Đăng nhập với Google
							</button>
						</div>
						<div class="d-grid">
							<button class="btn-facebook btn-login " >
								<i class="fab fa-facebook-f me-2"></i> Đăng nhập với Facebook
							</button>
						</div>
					</form>
					
					<script type="text/javascript">
							
								function callAjaxRegister() {

	                   			var requestBody = {
	                   					fullname: jQuery("#floatingInputFullName").val(),
	                   					username: jQuery("#floatingInputEmail").val(),
	                   					phone: jQuery("#floatingPhone").val(),  
	                   					password: jQuery("#floatingPassword").val(),
	                   			};
	
	                   			
	                   			jQuery.ajax({
	                   				url: "${base}/register", 	   	   
	                   				method: "post",					 
	                   				contentType: "application/json",   
	                   				data: JSON.stringify(requestBody), 
	
	                   				dataType: "json", 				   
	                   				success: function(jsonResult) {   
	                   					alert(jsonResult.statusMessage);
	                   					window.location="${base}/login";
	                   				},
	                   				error: function(jqXhr, textStatus, errorMessage) { 
	                   					alert("error");
	                   				}
	                   			});
	                   		}
							</script>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
</html>