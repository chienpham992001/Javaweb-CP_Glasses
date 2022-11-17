//Scroll
var mybutton = document.getElementById("myBtn");
window.onscroll = function() { scrollFunction() };

function scrollFunction() {
	if (document.body.scrollTop > 80 || document.documentElement.scrollTop > 80) {
		mybutton.style.display = "block";
	} else {
		//mybutton.style.display = "none";
	}
}
//Cộng trừ số lượng


//Modal quickview
var modal = document.getElementById('myModal');

// Lấy phần button mở Modal
var btn = document.getElementsByClassName("btn-search");

// Lấy phần span đóng Modal
var span = document.getElementsByClassName("close")[0];

// Khi button được click thi mở Modal
for (var i = 0; i < btn.length; i++) {
	btn[i].onclick = function() {
		modal.style.display = "block";
	}
}
// Khi span được click thì đ
//span.onclick = function() {
//	modal.style.display = "none";
//}
/* */
// Khi click ngoài Modal thì đóng Modal
window.onclick = function(event) {
	if (event.target == modal) {
		modal.style.display = "none";
	}
}
//$(window).load(function() {
//	$('#modal_subcribe').modal('show');

//});
$(".closemodal").click(function() {
	$("#modal_subcribe").modal('hide');
});

//Thêm sản phẩm vào giỏ hàng với productId và số lượng mua sp
function AddToCart(baseUrl, productId, quanlity) {
	let data = {
		productId: productId,
		quanlity: quanlity,
	};

	jQuery.ajax({
		url:baseUrl+ "/ajax/addToCart", //action
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),

		dataType: "json",
		success: function(jsonResult) {
			//alert(jsonResult.totalItems);
			$('#quantity_items').html(jsonResult.totalItems);
			location.reload();
			//jsonResult.preventDefault();
			//location.load("header.jsp");
		},
		error: function(jqXhr, textStatus, errorMessage) {
		//	alert("error");
		}
	});
}
					
