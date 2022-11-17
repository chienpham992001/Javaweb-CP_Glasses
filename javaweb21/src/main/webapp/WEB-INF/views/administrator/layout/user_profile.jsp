<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col-sm-6 clearfix">
	<div class="user-profile pull-right">
		<img class="avatar user-thumb" src="${base}/img/author/avatar.png"
			alt="avatar">
		<h4 class="user-name dropdown-toggle" data-toggle="dropdown">
			${userLogined.fullname } <i class="bi bi-caret-down-fill"></i>
		</h4>
		<div class="dropdown-menu">
			<a class="dropdown-item" href="#">Tin nhắn</a> <a
				class="dropdown-item" href="#">Cài đặt</a> <a class="dropdown-item"
				href="/logout">Đăng xuất</a>
		</div>
	</div>
</div>