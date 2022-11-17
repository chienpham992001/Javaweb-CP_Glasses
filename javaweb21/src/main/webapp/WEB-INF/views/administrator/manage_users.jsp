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
<!-- amcharts css -->
<link rel="stylesheet"
	href="https://www.amcharts.com/lib/3/plugins/export/export.css"
	type="text/css" media="all" />
<!-- Start datatable css -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.18/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
<link rel="stylesheet"
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
<!--Simple page  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.4/simplePagination.css"
	integrity="sha512-emkhkASXU1wKqnSDVZiYpSKjYEPP8RRG2lgIxDFVI4f/twjijBnDItdaRh7j+VRKFs4YzrAcV17JeFqX+3NVig=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<!-- preloader area start -->
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
								<li><a href="index.html">Trang chủ</a></li>
								<li><span>Người dùng</span></li>
							</ul>
						</div>
					</div>
					<jsp:include page="/WEB-INF/views/administrator/layout/user_profile.jsp"></jsp:include>
				</div>
			</div>
			<!-- page title area end -->
			<div class="main-content-inner">
				<div class="row">
					<!-- Primary table start -->
					<div class="col-12 mt-3">
						<div class="card">
							<div class="card-body">
								<h1 class="header-title">Người dùng</h1>

								<!-- tìm kiếm sản phẩm trên danh sách -->
								<form action="${base}/admin/manage_users" method="get">
									<div
										class="d-flex flex-row mb-3 search-form justify-content-between">
										<a href="/admin/addOrEdit_user">
											<button type="button" class="btn btn-rounded btn-primary ">Thêm
												người dùng</button>
										</a>
										<div class="d-flex flex-row ">
											<input hidden="hidden" id="page" name="page"
												class="form-control">

											<!-- tìm kiếm theo tên sản phẩm -->
											<input type="text" id="keyword" name="keyword"
												class="form-control" placeholder="Search"
												style="margin-right: 5px;" value="${searchModel.keyword }">

											<select class="form-control" name="keyoption" id="keyoption"
												style="margin-right: 5px;">
												<option value="">All</option>
												<option value="16">Admin</option>
												<option value="17">Khách hàng</option>
											</select>

											<button type="submit" id="btnSearch" name="btnSearch"
												value="Search" class="btn btn-danger">Seach</button>
										</div>

									</div>
									<div class="table-responsive">
										<table class="table text-center">
											<thead class="text-uppercase bg-primary">
												<tr class="text-white">
													<th>STT</th>
													<th>Mã người dùng</th>
													<th>Họ và tên</th>
													<th>Tên tài khoản</th>
													<!-- <th>Mật khẩu</th> -->
													<th>Số điện thoại</th>
													<th>Chức vụ</th>
													<th>Hoạt động</th>
												</tr>
											</thead>

											<tbody style="line-height: 100px !important;">
												<c:set var="stt" value="1"></c:set>
												<c:forEach items="${users.data}" var="users"
													varStatus="loop">
													<tr>
														<td>${stt}</td>
														<td>${users.id}</td>
														<td>${users.fullname}</td>
														<td>${users.username}</td>
														<%-- <td>${users.password}</td> --%>
														<td>${users.phone}</td>
														<c:forEach items="${users.roles }" var="role">
															<c:choose>
																<c:when test="${role.name == 'ADMIN'}">
																	<td><span class="true_status">${role.name}</span></td>
																	<td><a
																		href="${base }/admin/edit_user?id=${users.id}&roleId=${role.id}"><i
																			class="bi bi-pencil-square "></i></a>
																			<a href="${base }/admin/change_role?id=${users.id}&roleId=${role.id}"><i class="bi bi-arrow-clockwise"></i></a>  </i>
																	</a></td>
																</c:when>

																<c:otherwise>
																	<td><span class="wait_status">${role.name}</span>
																	</td>
																	<td>
																	<a href="${base }/admin/edit_user?id=${users.id}&roleId=${role.id}"><i
																			class="bi bi-pencil-square "></i></a>
																	<a href="${base }/admin/change_role?id=${users.id}&roleId=${role.id}"><i class="bi bi-arrow-clockwise"></i></a> 
																	
																	</td>

																</c:otherwise>
															</c:choose>

														</c:forEach>
														<%-- <td>
															 <a
															href="${base }/admin/addOrEdit_user?id=${users.id}&role=${role.id}"><i
																class="bi bi-pencil-square "></i></a> <a> <i
																class="bi bi-trash" role="button"
																onclick="deleteProduct(${users.id})"></i>
														</a>
														</td> --%>
														<c:set var="stt" value="${stt+1}"></c:set>
													</tr>

												</c:forEach>

											</tbody>
										</table>

										<!--Phân trang-->

									</div>
								</form>
								<div class="row">
									<div class="col-12 d-flex justify-content-center">
										<div id="paging"></div>
									</div>
								</div>

								<!--Modal thông báo  -->
								<div class="modal fade" id="exampleModalCenter">
									<div class="modal-dialog modal-dialog-centered" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title">Thông báo</h5>
												<button type="button" class="close" data-dismiss="modal">
													<span>&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<p>Bạn có chắc chắn muốn xóa sản phẩm khỏi hệ thống</p>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">Hủy</button>
												<button type="button" class="btn btn-primary">Xóa</button>
											</div>
										</div>
									</div>
								</div>

								<!--Modal sửa thông tin sản phẩm  -->
								<div class="modal fade bd-example-modal-lg " id="modalEdit">
									<div class="modal-dialog modal-lg modal-dialog-centered">
										<div class="modal-content"></div>
									</div>
								</div>
							</div>
						</div>
						<!-- Primary table end -->
					</div>
				</div>
			</div>
			<!-- main content area end -->
			<!-- footer area start-->
		</div>
		<jsp:include page="/WEB-INF/views/administrator/layout/footer.jsp"></jsp:include>
		<!-- footer area end-->
	</div>
	<!-- page container area end -->

	<!-- sidebar menu area end -->
	<script>
		$(".view_product_button").on(
				"click",
				function(e) {
					e.preventDefault();
					var href = $('.view_product_button').prop('href');
			        //alert(href);
					$("#modalEdit").modal("show").find(".modal-content").load(href);
				});
	</script>

	<script type="text/javascript">
	function deleteProduct(productId) {
			var data = {
					id : productId,
			};

			jQuery.ajax({
				url: "${base}/admin/manage_products/delete", 	   	   
				type: "post",					 
				contentType: "application/json",   
				data: JSON.stringify(data), 

				dataType: "json", 				   
				success: function(jsonResult) {
					location.reload();
				},
				error: function(jqXhr, textStatus, errorMessage) { 
					alert("error");
				}
			});
		}
	
	
	
		$(document).ready(function() {
			
			
			$("#paging").pagination({
				currentPage:${users.currentPage}, //trang hiện tại
				items : ${users.totalItems},
				itemsOnPage : ${users.sizeOfPage},
				cssStyle : 'compact-theme',
				onPageClick: function(pageNumber,event){
					$('#page').val(pageNumber);
					$('#btnSearch').trigger('click');
				}
			});
		});
	</script>
	<jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>

</body>
</html>