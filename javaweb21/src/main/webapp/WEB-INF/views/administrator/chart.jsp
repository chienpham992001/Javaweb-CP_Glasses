<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<!-- amchart css -->
<link rel="stylesheet"
	href="https://www.amcharts.com/lib/3/plugins/export/export.css"
	type="text/css" media="all" />
<!-- others css -->
<link rel="stylesheet" href="${base}/css/typography.css">
<link rel="stylesheet" href="${base}/css/default-css.css">
<link rel="stylesheet" href="${base}/css/styles.css">
<link rel="stylesheet" href="${base}/css/responsive.css">
<!-- modernizr css -->
<script src="${base}/js/vendor/modernizr-2.8.3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
</head>

<body>
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<!-- preloader area start -->
	<div id="preloader">
		<div class="loader"></div>
	</div>
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
							<h4 class="page-title pull-left">Thống kê</h4>
							<ul class="breadcrumbs pull-left">
								<li><a href="${base }">Trang chủ</a></li>
								<li><span>Thống kê</span></li>
							</ul>
						</div>
					</div>
					<jsp:include page="/WEB-INF/views/administrator/layout/user_profile.jsp"></jsp:include>
				</div>
			</div>
			<!-- page title area end -->
			<div class="main-content-inner">
				<div class="row">
				<!-- Đơn hàng -->
					<div class="col-lg-6 mt-5">
						<div class="card h-full">
							<div class="card-body">
								<h4 class="header-title">Thống kê số lượng đơn hàng tháng này</h4>
								<canvas id="seolinechart8" height="233"></canvas>
							</div>
						</div>
					</div>
					
					<div class="col-lg-6 mt-5">
						<div class="card h-full">
							<div class="card-body">
								<h4 class="header-title">Thống kê số lượng người dùng</h4>
								<div id="highpiechart4"></div>
							</div>
						</div>
					</div>
					<!-- seo fact area start -->
					<div class="col-lg-6">
						
					</div>

					
					<!-- Advertising area end -->
					

				</div>
				<!-- testimonial area end -->
			</div>
		</div>
	</div>
	<!-- main content area end -->
	<!-- footer area start-->
	<footer>
		<div class="footer-area">
			<p>
				© Copyright 2018. All right reserved. Template by <a
					href="https://colorlib.com/wp/">Colorlib</a>.
			</p>
		</div>
	</footer>
	

	<jsp:include page="/WEB-INF/views/administrator/layout/js.jsp"></jsp:include>
	<script type="text/javascript">
		var ctx = document.getElementById("seolinechart8").getContext('2d');
	    var chart = new Chart(ctx, {
	        // The type of chart we want to create
	        type: 'doughnut',
	        // The data for our dataset
	        data: {
	            labels: ["Đã bán", "Đang giao", "Chờ xác nhận", "Hủy đơn"],
	            datasets: [{
	                backgroundColor: [
	                    "#12C498",
	                    "#8919FE",
	                    "#F8CB3F",
	                    "#E36D68"
	                ],
	                borderColor: '#fff',
	                data: [${saleOrdersSuccess}, ${saleOrdersDelivering}, ${saleOrdersWaiting}, ${saleOrdersCancel}],
	            }]
	        },
	        // Configuration options go here
	        options: {
	            legend: {
	                display: true
	            },
	            animation: {
	                easing: "easeInOutBack"
	            }
	        }
	    });
	
    
    //Chart người dùng
    if ($('#highpiechart4').length) {
    var pieColors = (function() {
        var colors = [],
            base = Highcharts.getOptions().colors[0],
            i;

        for (i = 0; i < 10; i += 1) {
            // Start out with a darkened base color (negative brighten), and end
            // up with a much brighter color
            colors.push(Highcharts.Color(base).brighten((i - 3) / 7).get());
        }
        return colors;
    }());

    // Build the chart
    Highcharts.chart('highpiechart4', {
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: ''
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                colors: pieColors,
                dataLabels: {
                    style: { "color": "contrast", "fontSize": "11px", "fontWeight": "bold", "textOutline": "" },
                    enabled: true,
                    format: '<b>{point.name}</b><br>{point.percentage:.1f} %',
                    distance: -50,
                    filter: {
                        property: 'percentage',
                        operator: '>',
                        value: 4
                    }
                }
            }
        },
        series: [{
            name: 'Người dùng',
            data: [
                { name: 'Khách hàng', y: ${customers} },
                { name: 'Người quản  trị', y: ${admins} }
            ]
        }]
    });
}
	</script>
</body>
</html>