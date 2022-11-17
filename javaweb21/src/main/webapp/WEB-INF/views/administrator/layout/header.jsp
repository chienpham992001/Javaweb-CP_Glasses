<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="header-area">
	<div class="row align-items-center">
		<!-- nav and search button -->
		<div class="col-md-6 col-sm-8 clearfix">
			<div class="nav-btn pull-left">
				<span></span> <span></span> <span></span>
			</div>
			<div class="search-box pull-left">
				<form action="#">
					<input type="text" name="search" placeholder="Search..." required>
					<i class="bi bi-search"></i>
				</form>
			</div>
		</div>
		<!-- profile info & task notification -->
		<div class="col-md-6 col-sm-4 clearfix">
			<ul class="notification-area pull-right">
				<li id="full-view"><i class="bi bi-arrows-fullscreen"></i></li>
				<li id="full-view-exit"><i class="bi bi-arrows-fullscreen"></i></li>

				<li class="settings-btn"><i class="bi bi-gear"></i></li>
			</ul>
		</div>
	</div>
</div>
