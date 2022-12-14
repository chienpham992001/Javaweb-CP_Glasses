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
							<h4 class="page-title pull-left">Qu???n l?? ????n h??ng</h4>
							<ul class="breadcrumbs pull-left">
								<li><a href="index.html">Trang ch???</a></li>
								<li><span>????n h??ng</span></li>
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
								<h1 class="header-title">????n h??ng</h1>

								<!-- t??m ki???m s???n ph???m tr??n danh s??ch -->
								<form action="${base}/admin/manage_saleOrder" method="get">
									<div
										class="d-flex flex-row mb-3 search-form justify-content-between">
										<a href="${base }add_product"> <!-- <button type="button" class="btn btn-rounded btn-primary ">Th??m
												s???n ph???m</button> -->
										</a>
										<div class="d-flex flex-row ">
											<input hidden="hidden" id="page" name="page"
												class="form-control">

											<!-- t??m ki???m theo t??n s???n ph???m -->
											<input type="text" id="keyword" name="keyword"
												class="form-control" placeholder="Search"
												style="margin-right: 5px;" value="${searchModel.keyword }">

											<select class="form-control" name="keyoption" id="keyoption"
												style="margin-right: 5px;">
												<option value="">All</option>
												<option value="Ch??? x??c nh???n">Ch??? x??c nh???n</option>
												<option value="??ang giao">??ang giao</option>
												<option value="Giao th??nh c??ng">Giao th??nh c??ng</option>
												<option value="H???y ????n">H???y ????n</option>
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
													<th>M?? h??a ????n</th>
													<th>M?? kh??ch h??ng</th>
													<th>T??n kh??ch h??ng</th>
													<th>S??? ??i???n tho???i</th>
													<th>?????a ch???</th>
													<th>Ghi ch??</th>
													<th>Tr???ng th??i</th>
													<th class="not_sort">Ho???t ?????ng</th>
												</tr>
											</thead>

											<tbody style="line-height: 100px !important;">
												<c:set var="stt" value="1"></c:set>
												<c:forEach items="${saleorders.data}" var="saleorder"
													varStatus="loop">
													<tr>
														<td>${stt}</td>
														<td>${saleorder.code}</td>

														<td>${saleorder.user.id}</td>
														<td>${saleorder.customerName}</td>
														<td>${saleorder.customerPhone}</td>
														<td>${saleorder.customerAddress}</td>
														<td>${saleorder.customerNote}</td>
														<td><c:choose>
																<c:when
																	test="${saleorder.statusShipping =='Ch??? x??c nh???n'}">
																	<span class="wait_status">${saleorder.statusShipping}</span>
																</c:when>
																<c:when
																	test="${saleorder.statusShipping =='Giao th??nh c??ng'}">
																	<span class="true_status">${saleorder.statusShipping}</span>
																</c:when>
																<c:when test="${saleorder.statusShipping =='??ang giao'}">
																	<span class="true2_status">${saleorder.statusShipping}</span>
																</c:when>
																<c:otherwise>
																	<span class="false_status">${saleorder.statusShipping}</span>
																</c:otherwise>
															</c:choose></td>
														<td><a
															href="${base }/admin/manage_saleOrder/${saleorder.id}"><i
																class="bi bi-eye "></i></a> <%-- <a
															href="${base }/admin/add_product/${saleorder.id}"><i
																class="bi bi-pencil-square "></i></a> <a> <i
																class="bi bi-trash" role="button"
																onclick="deleteProduct(${saleorder.id})"></i>
														</a> --%></td>
														<c:set var="stt" value="${stt+1}"></c:set>
													</tr>

												</c:forEach>

											</tbody>
										</table>

										<!--Ph??n trang-->

									</div>
								</form>
								<div class="row">
									<div class="col-12 d-flex justify-content-center">
										<div id="paging"></div>
									</div>
								</div>

								<!--Modal th??ng b??o  -->
								<div class="modal fade" id="exampleModalCenter">
									<div class="modal-dialog modal-dialog-centered" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title">Th??ng b??o</h5>
												<button type="button" class="close" data-dismiss="modal">
													<span>&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<p>B???n c?? ch???c ch???n mu???n x??a s???n ph???m kh???i h??? th???ng</p>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">H???y</button>
												<button type="button" class="btn btn-primary">X??a</button>
											</div>
										</div>
									</div>
								</div>

								<!--Modal s???a th??ng tin s???n ph???m  -->
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

			$('#keyoption').val('${searchModel.keyoption }');
			
			$("#paging").pagination({
				currentPage:${saleorders.currentPage}, //trang hi???n t???i
				items : ${saleorders.totalItems},
				itemsOnPage : ${saleorders.sizeOfPage},
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