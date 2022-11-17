<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="sidebar-menu">
	<div class="sidebar-header">
		<div class="logo">
			<a href="http://localhost:8080/admin"><img
				src="${base}/img/logo/logoAminPage.png" alt="logo"></a>
		</div>
	</div>
	<div class="main-menu">
		<div class="menu-inner">
			<nav>
				<ul class="metismenu" id="menu">
					<li><a href="/admin"
						aria-expanded="true"><i class="bi bi-speedometer2"></i><span>dashboard</span></a>

					</li>
					<li><a href="/admin/manage_saleOrder" aria-expanded="true"><i
							class="bi bi-receipt"></i> <span>Đơn hàng</span></a></li>
					<li><a href="javascript:void(0)" aria-expanded="true"><i
							class="bi bi-eyeglasses"></i> <span>Sản phẩm</span></a>
						<ul class="collapse">
							<li><a href="http://localhost:8080/admin/manage_products">Quản
									lý sản phẩm</a></li>
							<li><a href="http://localhost:8080/admin/add_product">Thêm
									sản phẩm</a></li>
						</ul></li>
					<li><a href="javascript:void(0)" aria-expanded="true"> <i
							class="bi bi-card-list"></i><span>Thương hiệu kính</span></a>
						<ul class="collapse">
							<li><a href="/admin/manage_categories">Quản lý thương
									hiệu</a></li>
							<li><a href="/admin/addOrEdit_category">Thêm thương hiệu</a></li>
						</ul></li>
					
					<li><a href="javascript:void(0)" aria-expanded="true"><i
							class="bi bi-people"></i> <span>Người dùng</span></a>
						<ul class="collapse">
							<li><a href="/admin/manage_users">Quản lý người dùng</a></li>
							<li><a href="/admin/addOrEdit_user">Thêm người dùng</a></li>
						</ul></li>
					<li><a href="/admin/manage_contacts" aria-expanded="true"><i
							class="bi bi-person-video2"></i> <span>Ý kiến khách hàng</span></a></li>
							
					<li><a href="/admin/chart" aria-expanded="true"><i
							class="bi bi-person-video2"></i> <span>Thống kê</span></a></li>

				</ul>
			</nav>
		</div>
	</div>
</div>