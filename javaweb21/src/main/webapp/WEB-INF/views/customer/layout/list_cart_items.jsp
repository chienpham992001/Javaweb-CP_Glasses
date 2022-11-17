<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="row cart-detail">
	<div class="col-lg-4 col-sm-4 col-4 cart-detail-img">
		<img src="${base }/upload/${sp.avatar}">
	</div>
	<div class="col-lg-8 col-sm-8 col-8 cart-detail-product">
		<p>${sp.productName }</p>
		<span class="price "> <fmt:setLocale value="vi_VN" /> <strong>
				<fmt:formatNumber value="${sp.priceUnit }" type="currency" />
		</strong>
		</span> <span class="count"> SL: ${sp.quanlity }</span>
	</div>
</div>