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
				<div class="">
					<div class="form-wizard">
						
						<div class="container">
							<div class="row">
								<div class="list-item col-lg-9 content-cart-page">
									<table width="90%">
										<thead>
											<tr>
												<!-- <th>Mã sp</th> -->
												<th colspan="2">Sản phẩm</th>
												<th>Giá</th>
												<th>Số lượng</th>
												<th>Thành tiền</th>
												<th>Chức năng</th>
											</tr>
										</thead>
										<tbody>
											<!-- <tr class="cart_item " id="item2">

                                                    </tr> -->
											<c:set var="total" value="0"></c:set>
											<c:forEach items="${cart.cartItems}" var="sp">
												<tr class="cart_item">

													<c:set var="total_price"
														value="${sp.priceUnit*sp.quanlity}"></c:set>
													<td class="cart_item_img"><a
														href="product_detail.html"><img
															src="${base }/upload/${sp.avatar}" alt=""></a></td>
													<td class="cart_item_name">
														<div class="glass_name">
															<a href="product_detail.html">${sp.productName }</a>
														</div>
													</td>
													<td class="cart_item_price"><fmt:setLocale
															value="vi_VN" /> <strong><fmt:formatNumber
																value="${sp.priceUnit }" type="currency" /></strong></td>
													<td class="cart_item_quantity">
														<div class="quantity-icon-action">
															<i onclick="minusQuantity(${sp.productId})"
																class="fa-solid fa-minus"></i> <span
																class="quantity-number" id="quantity-number">${sp.quanlity }</span>

															<i onclick="plusQuantity(${sp.productId})"
																class="fa-solid fa-plus"></i>

														</div>
													</td>
													<td id="cart_item_total"><fmt:setLocale value="vi_VN" />
														<strong><fmt:formatNumber value="${total_price }"
																type="currency" /></strong></td>

													<c:set var="total" value="${total+ total_price}"></c:set>
													<td class="delete_cart_item"><i
														class="fa-solid fa-trash-can"
														onclick="deleteCartItem(${sp.productId})"> <a
															href="${base}/cart/checkout/deleteItem/"${sp.productId}"></a>
													</i></td>
												</tr>


											</c:forEach>
										</tbody>
									</table>

								</div>
								<div class="total-price col-lg-3">
									<p>
										<span>Tạm tính</span> <span class="cart-price"
											style="color: #ff871d;"> <fmt:setLocale value="vi_VN" />
											<strong><fmt:formatNumber value="${total }"
													type="currency" /></strong>
										</span>
									</p>
									<p>
										<span>Giảm giá</span> <span class="cart-price">0 VND</span>
									</p>
									<p>
										<span>Thành tiền</span> <span class="cart-price"
											style="color: #ff871d;"><fmt:setLocale value="vi_VN" />
											<strong><fmt:formatNumber value="${total }"
													type="currency" /></strong></span>
									</p>
								</div>
							</div>

						</div>

						<div class="container">
							<div class="col-8  mt-4">
								<h3>Thông tin người nhận</h3>

								<sf:form modelAttribute="saleOrder"
									action="${base}/cart/checkout" method="post">
									<div class="form-floating">
										<sf:input path="customerName" type="text" class="form-control"
											id="fullName-receiver" name="fullName-receiver"
											placeholder="Họ và tên"></sf:input>
										<sf:errors path="customerName" cssClass="alert alert-danger"
											element="div"></sf:errors>
										<label for="fullName-receiver">Tên người nhận</label>
									</div>

									<div class="form-floating">
										<sf:input path="customerPhone" type="text"
											class="form-control" id="phone-receiver"
											name="phone-receiver" placeholder="Số điện thoại"></sf:input>
										<sf:errors path="customerPhone" cssClass="alert alert-danger"
											element="div"></sf:errors>
										<label for="phone-receiver">Số điện thoại</label>
									</div>

									<div class="form-floating">
										<sf:input path="customerAddress" type="text"
											class="form-control" id="address-receiver"
											name="address-receiver" placeholder="Địa chỉ"></sf:input>
										<sf:errors path="customerAddress"
											cssClass="alert alert-danger" element="div"></sf:errors>
										<label for="address-receiver">Địa chỉ</label>
									</div>

									<div class="form-floating">
										<sf:textarea path="statusShipping" cols="100" rows="5"
											class="form-control" placeholder="Ghi chú" id="note-receiver"
											name="note-receiver"></sf:textarea>
										<label for="note-receiver">Ghi chú</label>
									</div>

									<div class="form-group clearfix">
										<a href="${base }/home"
											class="form-wizard-previous-btn float-left">Quay lại</a>
										<c:if test="${!isLogined}">
											<a href="${base }/login"
												class="form-wizard-next-btn float-right" onclick="alert('Vui lòng đăng nhập để mua hàng')">Thanh toán</a>
										</c:if>
										<c:if test="${isLogined}">
											<button type="submit"
												class="form-wizard-next-btn float-right">Thanh toán</button>
										</c:if>
									</div>
								</sf:form>
							
							</div>
						</div>
					</div>

				</div>
			</div>
		</section>
	</main>
	<!--Footer-->
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>

	<script type="text/javascript">
	
	function minusQuantity(productId) {
		document.getElementById("quantity_items").innerHTML = ${totalItems};
		var data = {
				id : productId,
		};

		jQuery.ajax({
			url: "${base}/cart/checkout/minusQuantity/"+data.id, 	   
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
	
		function plusQuantity(productId) {
			//var sl = document.getElementById("quantity-number");
			//sl.innerHTML = Number(sl.innerHTML)+1;
			
			document.getElementById("quantity_items").innerHTML = ${totalItems};
			var data = {
					id : productId,
			};
	
			jQuery.ajax({
				url: "${base}/cart/checkout/plusQuantity/"+data.id, 	   
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
	
		function deleteCartItem(productId) {
			var data = {
					id : productId,
			};
	
			jQuery.ajax({
				url: "${base}/cart/checkout/deleteItem/"+data.id, 	   
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
		
	</script>
	<script src="${base}/js/script.js"></script>
</body>
</html>