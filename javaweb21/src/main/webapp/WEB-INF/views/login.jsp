<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Đăng nhập | CP Glasses</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="../css/style.css">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,400;0,500;0,600;0,700;1,200&display=swap"
	rel="stylesheet">
</head>

<body class="lg-rg">
	<div class="container">
		<div class="row">
			<div class="card-lg-rg">
				<div class=" card-img-left col-lg-5">
					<img src="${base }/img/banner/banner_login.jpg" alt="">
				</div>
				<div class="card-body col-lg-7 col-12">
					<h3>Đăng nhập</h3>
					<form method="POST" action="${base }/login_processing_url"
						class="form-signin">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<c:if test="${not empty param.login_error}">
							<div class="alert alert-danger" role="alert">Login attempt
								was not successful, try again!!!</div>
						</c:if>
						<div class="form-floating">
							<input type="text" name="username" class="form-control"
								id="floatingInputEmail" placeholder="name@example.com">
							<label for="floatingInputEmail">Tài khoản</label>
						</div>

						<div class="form-floating">
							<input type="password" name="password" class="form-control"
								id="floatingPassword" placeholder="Password"> <label
								for="floatingPassword">Mật khẩu</label>
						</div>
						<div class="form-floating">
							<input type="checkbox" name="remember-me" /> Remember me
						</div>
						<div class="d-grid">
							<button class="btn-register btn-login " type="submit">Đăng
								nhập</button>
						</div>
						<a class="rotate-login" href=""> Quên mật khẩu </a> <br> <a
							class="rotate-login" href="${base }/register"> Đăng ký tài
							khoản mới </a>

						<hr>

						<div class="d-grid">
							<button class=" btn-google btn-login " type="submit">
								<i class="fab fa-google me-2"></i> Đăng nhập với Google
							</button>
						</div>

						<div class="d-grid">
							<button class="btn-facebook btn-login " type="submit">
								<i class="fab fa-facebook-f me-2"></i> Đăng nhập với Facebook
							</button>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>