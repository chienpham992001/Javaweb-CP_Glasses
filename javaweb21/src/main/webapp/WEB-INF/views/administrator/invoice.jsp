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
							<h4 class="page-title pull-left">Quản lý sản phẩm</h4>
							<ul class="breadcrumbs pull-left">
								<li><a href="index.html">Trang chủ</a></li>
								<li><span>Đơn hàng</span></li>
							</ul>
						</div>
					</div>
					<jsp:include
						page="/WEB-INF/views/administrator/layout/user_profile.jsp"></jsp:include>
				</div>
			</div>
			<!-- page title area end -->
			<div class="main-content-inner">
				<div class="row">
					<div class="col-lg-12 mt-5">
						<div class="card">
							<div class="card-body">
								<div class="invoice-area">
									<div class="invoice-head">
										<div class="row">
											<div class="iv-left col-6">
												<span>Hóa đơn</span>
											</div>
										</div>
									</div>
									<form class="form" style="margin:0 auto; max-width: none; width: 900px;">
										<div class="container">
											<div class="row ">
												<div class="col-md-6">
													<div class="invoice-address">
														<h3>Hóa đơn mua hàng</h3>
														<h5>#${saleorder.code }</h5>
														<h5>Họ và tên : ${saleorder.customerName }</h5>
														<h6>SĐT : ${saleorder.customerPhone }</h6>
														<h6>Email : ${saleorder.user.username }</h6>
														<h6>Địa chỉ : ${saleorder.customerAddress}</h6>
													</div>
												</div>
												<div class="col-md-6 text-md-right">
													<ul class="invoice-date">
														<li><b>Ngày mua</b> : ${saleorder.createdDate }</li>
													</ul>
												</div>
											</div>
											<div class="invoice-table table-responsive mt-5">
												<table class="table table-bordered table-hover ">
													<thead>
														<tr class="text-capitalize">
															<th class="text-center">STT</th>
															<th class="">Tên sản phẩm</th>
															<th>Đơn giá</th>
															<th >Số lượng</th>
															<th style="min-width: 100px">Thành tiền</th>
														</tr>
													</thead>
													<tbody>
														<c:set var="stt" value="1"></c:set>
														<c:set var="total" value="0"></c:set>

														<c:forEach items="${saleorderproducts }" var="hd">
															<tr>
																<td class="text-center">${stt}</td>
																<td >${hd.product.title }</td>
																<td><fmt:setLocale value="vi_VN" scope="session" />
																	<fmt:formatNumber
																		value="${hd.product.price}"
																		type="currency"></fmt:formatNumber></td>
																<td>${hd.quanlity }</td>
																<td><fmt:setLocale value="vi_VN" scope="session" />
																	<fmt:formatNumber
																		value="${hd.product.price * hd.quanlity}"
																		type="currency"></fmt:formatNumber></td>

																<c:set var="total"
																	value="${total + hd.product.price * hd.quanlity}"></c:set>
															</tr>
															<c:set var="stt" value="${stt+1}"></c:set>
														</c:forEach>

													</tbody>
													<tfoot>
														<tr>
															<td colspan="4" class="text-right">Tổng tiền :</td>
															<td><fmt:setLocale value="vi_VN" scope="session" />
																<fmt:formatNumber value="${total}" type="currency"></fmt:formatNumber></td>
														</tr>
													</tfoot>
												</table>
											</div>
										</div>
									</form>
								</div>
								<div class="invoice-buttons">
									<div class="text-left">


										<c:if
											test="${saleorder.statusShipping !='Hủy đơn' && saleorder.statusShipping !='Giao thành công'}">
											<c:choose>
												<c:when test="${saleorder.statusShipping =='Đang giao'}">
													<button type="button" class="btn btn-success"
														onclick="successSaleOrder(${saleorder.id })">Xác
														nhận thanh toán</button>
												</c:when>
												<c:otherwise>
													<button type="button" class="btn btn-success"
														onclick="confirmSaleOrder(${saleorder.id })">Xác
														nhận gửi hàng</button>
												</c:otherwise>
											</c:choose>
											<button type="button" class="btn btn-danger"
												onclick="cancelSaleOrder(${saleorder.id })">Hủy đơn</button>
										</c:if>

									</div>
									<div class="text-right">
										<a href="#" id="create_pdf" class="invoice-btn">In hóa đơn</a>
										<a href="#" class="invoice-btn">Gửi hóa đơn</a>
									</div>
								</div>

							</div>
						</div>
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

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.5/jspdf.min.js"></script>
	<script>  
    (function () {  
        var  
         form = $('.form'),  
         cache_width = form.width(),  
         a4 = [630, 841.89]; // for a4 size paper width and height  
  
        $('#create_pdf').on('click', function () {  
            $('body').scrollTop(0);  
            createPDF();  
        });  
        //create pdf  
        function createPDF() {  
            getCanvas().then(function (canvas) {  
                var  
                 img = canvas.toDataURL("image/png"),  
                 doc = new jsPDF({  
                     unit: 'px',  
                     format: 'a4'  
                 });  
                doc.addImage(img, 'JPEG', 20, 20);  
                doc.save('Hóa Đơn '+${saleorder.code }+'.pdf');  
                form.width(cache_width);  
            });  
        }  
  
        // create canvas object  
        function getCanvas() {  
            form.width((a4[0] * 1.33333) - 80).css('max-width', 'none');  
            return html2canvas(form, {  
                imageTimeout: 2000,  
                removeContainer: true  
            });  
        }  
  
    }());  
</script>
	<script>  
    /* 
 * jQuery helper plugin for examples and tests 
 */  
    (function ($) {  
        $.fn.html2canvas = function (options) {  
            var date = new Date(),  
            $message = null,  
            timeoutTimer = false,  
            timer = date.getTime();  
            html2canvas.logging = options && options.logging;  
            html2canvas.Preload(this[0], $.extend({  
                complete: function (images) {  
                    var queue = html2canvas.Parse(this[0], images, options),  
                    $canvas = $(html2canvas.Renderer(queue, options)),  
                    finishTime = new Date();  
  
                    $canvas.css({ position: 'absolute', left: 0, top: 0 }).appendTo(document.body);  
                    $canvas.siblings().toggle();  
  
                    $(window).click(function () {  
                        if (!$canvas.is(':visible')) {  
                            $canvas.toggle().siblings().toggle();  
                            throwMessage("Canvas Render visible");  
                        } else {  
                            $canvas.siblings().toggle();  
                            $canvas.toggle();  
                            throwMessage("Canvas Render hidden");  
                        }  
                    });  
                    throwMessage('Screenshot created in ' + ((finishTime.getTime() - timer) / 1000) + " seconds<br />", 4000);  
                }  
            }, options));  
  
            function throwMessage(msg, duration) {  
                window.clearTimeout(timeoutTimer);  
                timeoutTimer = window.setTimeout(function () {  
                    $message.fadeOut(function () {  
                        $message.remove();  
                    });  
                }, duration || 2000);  
                if ($message)  
                    $message.remove();  
                $message = $('<div ></div>').html(msg).css({  
                    margin: 0,  
                    padding: 10,  
                    background: "#000",  
                    opacity: 0.7,  
                    position: "fixed",  
                    top: 10,  
                    right: 10,  
                    fontFamily: 'Tahoma',  
                    color: '#fff',  
                    fontSize: 12,  
                    borderRadius: 12,  
                    width: 'auto',  
                    height: 'auto',  
                    textAlign: 'center',  
                    textDecoration: 'none'  
                }).hide().fadeIn().appendTo('body');  
            }  
        };  
    })(jQuery);  
  
</script>

	<script type="text/javascript">
	function successSaleOrder(saleOrderId) {
		var data = {
				id : saleOrderId,
		};

		jQuery.ajax({
			url: "${base}/admin/manage_saleOrder/success", 	   	   
			type: "post",					 
			contentType: "application/json",   
			data: JSON.stringify(data), 

			dataType: "json", 				   
			success: function(jsonResult) {
				history.back();
			},
			error: function(jqXhr, textStatus, errorMessage) { 
				alert("error");
			}
		});
	}
	function confirmSaleOrder(saleOrderId) {
			var data = {
					id : saleOrderId,
			};

			jQuery.ajax({
				url: "${base}/admin/manage_saleOrder/confirm", 	   	   
				type: "post",					 
				contentType: "application/json",   
				data: JSON.stringify(data), 

				dataType: "json", 				   
				success: function(jsonResult) {
					alert(jsonResult.message);
					history.back();
				},
				error: function(jqXhr, textStatus, errorMessage) { 
					alert("error");
				}
			});
		}
	function cancelSaleOrder(saleOrderId) {
		var data = {
				id : saleOrderId,
		};

		jQuery.ajax({
			url: "${base}/admin/manage_saleOrder/cancel", 	   	   
			type: "post",					 
			contentType: "application/json",   
			data: JSON.stringify(data), 

			dataType: "json", 				   
			success: function(jsonResult) {
				history.back();
			},
			error: function(jqXhr, textStatus, errorMessage) { 
				alert("error");
			}
		});
	}
	
	
		
	</script>


	<jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>

</body>
</html>