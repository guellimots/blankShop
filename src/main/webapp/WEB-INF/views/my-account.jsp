<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>會員資訊</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="google-signin-client_id" content="528857856428-o80ljruk3qsht7gpqbmvnk49r9k5s8ca.apps.googleusercontent.com">

<style>


</style>
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="/blankShop/assets/img/favicon.png">

<!-- CSS
	============================================ -->
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/blankShop/assets/css/bootstrap.min.css">
<!-- Icon Font CSS -->
<link rel="stylesheet" href="/blankShop/assets/css/icons.min.css">
<!-- Plugins CSS -->
<link rel="stylesheet" href="/blankShop/assets/css/plugins.css">
<!-- Main Style CSS -->
<link rel="stylesheet" href="/blankShop/assets/css/style.css">
<!-- Modernizer JS -->
<script src="/blankShop/assets/js/vendor/modernizr-2.8.3.min.js"></script>



<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- Datatable -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<script src="/blankShop/js/backEnd/jquery.dataTables.min.js"></script>

<body>
	<div class="wrapper">
		<header class="header-area sticky-bar">
		    <input type="hidden" id="urlIndex" value="${displayIndex}">
			<div class="main-header-wrap">
				<div class="container">
					<div class="row">
						<div class="col-xl-2 col-lg-2">
							<div class="logo pt-40">
								<a href="/blankShop/frontEnd/welcomePage"> <img
									src="/blankShop/assets/img/logo/logo.png" width="150px" alt="">
								</a>
							</div>
						</div>
						<div class="col-xl-7 col-lg-7 ">
							<div class="main-menu">
								<nav>
									<ul>
										<li></li>
										<li></li>
										<li class="angle-shape"><a href="/blankShop/frontEnd/products/setIndex/1">全部商品</a>
											<ul class="submenu">
												<li><a href="/blankShop/frontEnd/products/setIndex/2">上衣</a></li>
												<li><a href="/blankShop/frontEnd/products/setIndex/3">襯衫</a></li>
												<li><a href="/blankShop/frontEnd/products/setIndex/4">褲裝</a></li>
												<li><a href="/blankShop/frontEnd/products/setIndex/5">裙裝</a></li>
											</ul></li>
										<li><a href="/blankShop/frontEnd/products/setIndex/6">最新商品</a></li>
										<li><a href="/blankShop/frontEnd/products/setIndex/7">特價商品</a></li>
										<li></li>
										<li></li>

									</ul>
								</nav>
							</div>
						</div>
						<div class="col-xl-3 col-lg-3">
							<div class="header-right-wrap pt-40">
								<div class="cart-wrap">
									<button class="icon-cart-active">
										<span class="icon-cart"> <i class="sli sli-bag"></i> <span
												class="count-style" id="cartCount"></span>
										</span> $<span class="cart-price" id=crartTotalPrice></span>
									</button>
									<div class="shopping-cart-content" id="cartContent">
										<div class="shopping-cart-top">
											<h4>購物車</h4>
											<a class="cart-close" href="#"><i class="sli sli-close"></i></a>
										</div>
										<ul id="cart1" style="height: 350px;">
										</ul>
										<div class="shopping-cart-bottom">
											<div class="shopping-cart-total">
												<h4>
													總計 : $<span class="shop-total" id="subtotal"></span>
												</h4>
											</div>
											<div class="shopping-cart-btn btn-hover text-center">
												<a class="default-btn" href="/blankShop/frontEnd/viewcart">檢視購物車</a>
											</div>
										</div>
									   

									</div>
								</div>
								
								<div class="setting-wrap">
									<button class="setting-active">
										<i class="sli sli-settings"></i>
									</button>
									<div class="setting-content">
										<ul>
											<li>
												<h4>${name}，您好！</h4>
												<ul>
													<li><img id="memProfileImg" width="100px"
														src="${proImgSrc}"></li>
													<li></li>
												</ul>
												<h4>會員帳號</h4>
												<ul>
													<li><a href="/blankShop/frontEnd/showmem">會員中心</a></li>
													<li><a href="logOut" id="logout-btn">登出</a></li>
												</ul>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- main-search start -->
			</div>
			<div class="header-small-mobile">
				<div class="container">
					<div class="row align-items-center">
						<div class="col-6">
							<div class="mobile-logo">
								<a href="/blankShop/frontEnd/welcomePage"> <img alt=""
									src="/blankShop/assets/img/logo/logo.png" width="100px">
								</a>
							</div>
						</div>
						<div class="col-6">
							<div class="header-right-wrap">
								<div class="cart-wrap">
									<button class="icon-cart-active">
										<span class="icon-cart"> <i class="sli sli-bag"></i> <span
											class="count-style"></span>
										</span> <span class="cart-price"></span>
									</button>
									<div class="shopping-cart-content">
										<div class="shopping-cart-top">
											<h4>購物車</h4>
											<a class="cart-close" href="#"><i class="sli sli-close"></i></a>
										</div>
										<ul>
											<li class="single-shopping-cart">
												<div class="shopping-cart-img">
													<a href="#"><img alt=""
														src="/blankShop/assets/img/cart/cart-1.svg"></a>
												</div>
												<div class="shopping-cart-title">
													<h4>
														<a href="#">Product Name </a>
													</h4>
													<span>1 x 90.00</span>
												</div>
											</li>
											<li class="single-shopping-cart">
												<div class="shopping-cart-img">
													<a href="#"><img alt=""
														src="/blankShop/assets/img/cart/cart-2.svg"></a>
												</div>
												<div class="shopping-cart-title">
													<h4>
														<a href="#">Product Name</a>
													</h4>
													<span>1 x 90.00</span>
												</div>
											</li>
										</ul>
										<div class="shopping-cart-bottom">
											<div class="shopping-cart-total">
												<h4>
													總計 : <span class="shop-total">NT$ 260</span>
												</h4>
											</div>
											<div class="shopping-cart-btn btn-hover text-center">
												 <a	class="default-btn" href="cart-page.html">檢視購物車</a>
											</div>
										</div>
									</div>
								</div>
								<div class="mobile-off-canvas">
									<a class="mobile-aside-button" href="#"><i
										class="sli sli-menu"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>
		<div class="breadcrumb-area pt-35 pb-35 bg-gray">
			<div class="container">
				<div class="breadcrumb-content text-center">
					<ul>
						<li><a href="/blankShop/frontEnd/welcomePage">Home</a></li>
						<li class="active">My account</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- my account wrapper start -->
		<div class="my-account-wrapper pt-100 pb-100">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<!-- My Account Page Start -->
						<div class="myaccount-page-wrapper">
							<!-- My Account Tab Menu Start -->
							<div class="row">
								<div class="col-lg-2">
									<div class="myaccount-tab-menu nav" role="tablist">
										<a href="#account-info" data-toggle="tab"><i
											class="fa fa-user"></i>帳號資訊</a> <a href="#orders"
											data-toggle="tab"><i class="fa fa-cart-arrow-down"></i>訂單資訊</a>
										
									</div>
								</div>
								<!-- My Account Tab Menu End -->
								<!-- My Account Tab Content Start -->
								<div class="col-lg-10">
									<div class="tab-content" id="myaccountContent">

										<div class="tab-pane fade" id="orders" role="tabpanel">
											<div class="myaccount-content">
												<h3>歷史訂單</h3>
												<div class="myaccount-table table-responsive text-center">
													
													<table class="dataTable display cell-border hover"
														id="orderTable" >
														<thead class="thead-light">
															<tr>
																<th>訂單編號</th>
																<th>產品名稱</th>
																<th>金額</th>
																<th>數量</th>
																<th>運送地址</th>
																<th>訂單狀態</th>
																<th>建立日期</th>
															</tr>
														</thead>
													</table>
												</div>
											</div>
										</div>
										<!-- Single Tab Content End -->
										<div style="text-align: center;" id="previewDialog">
											
											<img id="img1" width="360" height="560"> 
										</div>
										<!-- Single Tab Content Start -->
										<div class="tab-pane fade show active" id="account-info"
											role="tabpanel">
											<div class="myaccount-content" >
												<h3>帳號資訊</h3>
												<div class="account-details-form">
													<form method="Post" action="editMember" id="send1"
														enctype='multipart/form-data'>
														<div class="row">
															<div class="col-lg-6">
																<div class="single-input-item">
																	<input type="hidden" name="id"
																		value="${Member.memberId}"> <label
																		for="first-name" class="required">姓名</label> <input
																		type="text" id="first-name" name="memberName"
																		value="${Member.memberName}" /> <label
																		for="display-name" class="required">連絡電話</label> <input
																		type="text" id="cellphone" name="cellNumber"
																		value="${Member.cellNumber}" />
																</div>
															</div>
															<div class="col-lg-6">
																<img id="previewArea" src="${strbase64}"
																	class="rounded float-left" style="width: 180px"
																	alt="..."> <label class="btn btn-info"> <input
																	id="upload_img" style="display: none;" type="file"
																	name="fileupload" onchange="showUpload(event)" /> <i
																	class="fa fa-photo"></i> 上傳圖片
																</label>
															</div>
														</div>
														<div class="single-input-item">
															<label for="email" class="required">Email</label> <input
																type="email" id="email" name="email"
																value="${Member.email}" />
														</div>
														<div class="single-input-item">
															<label for="email" class="required">生日</label> <input
																type="date" id="birthday" name="birthday"
																value="<fmt:formatDate value="${Member.birthday}" pattern="yyyy-MM-dd" />" />
														</div>
														<div class="single-input-item">
															<label for="address" class="required">地址</label> <input
																type="text" id="address" name="address"
																value="${Member.address}" />
														</div>
														<div class="row">
														<div class="single-input-item">
															<div class="col-12">
															<button id="btn1" type="submit" class="check-btn sqr-btn " >修改</button>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
															<button id="btn2" type="button" class="check-btn sqr-btn " >我是一鍵輸入</button>
															</div>
														
														</div>
													</div>	
													</form>
													<div class="single-input-item">
														<br>
														<h3>修改密碼</h3>
														<form action="editpassword" method="post" id=>
															<input type="hidden" name="id" value="${Member.memberId}">
															<div class="row">
																<div class="col-lg-6">
																	<div class="single-input-item">
																		<label for="new-pwd" class="required">新密碼</label> <input
																			type="text" id="pwd" name="new-pwd" />

																	</div>
																</div>
																<div class="col-lg-6">
																	<div class="single-input-item">
																		<label for="confirm-pwd" class="required">密碼確認</label>
																		<input type="text" id="checkPwd" name="confirm-pwd" />
																		<span id="checkPwdMsg" style="color: brown;"></span>
																	</div>
																</div>
															</div>
															<button type="submit" class="check-btn sqr-btn" id="changepassword">修改密碼</button>
														</form>
													</div>
												</div>
											</div>
										</div>
										<!-- Single Tab Content End -->
									</div>
								</div>
								<!-- My Account Tab Content End -->
							</div>
						</div>
						<!-- My Account Page End -->
					</div>
				</div>
			</div>
		</div>
		<!-- my account wrapper end -->
		<footer class="footer-area bg-paleturquoise">
			<div class="container">
				<div class="footer-top text-center pt-45 pb-45">
					<nav>
						<ul>
							<li>在社交平台上追蹤我們</li>
						</ul>
						<br>
						<ul>
							<a href="#"><li class="sli sli-social-facebook"></li></a>
							<a href="#"><li class="sli sli-social-instagram"></li></a>
							<a href="#"><li class="sli sli-social-youtube"></li></a>
							<!-- <li><a href="#"></a></li>
                        <li><a href="#">Accessories  </a></li> -->
						</ul>
					</nav>
				</div>
			</div>
			<div class="footer-bottom border-top-1 pt-20">
				<div class="container">
					<div class="row align-items-center">
						<div class="col-lg-4 col-md-5 col-12"></div>
						<div class="col-lg-4 col-md-4 col-12">
							<div class="copyright text-center pb-20">
								<p>© 2021 blank.com.tw</p>
							</div>
						</div>
						<div class="col-lg-4 col-md-3 col-12"></div>
					</div>
				</div>
			</div>
		</footer>
	</div>

	<!-- All JS is here
============================================ -->

	<script src="/blankShop/assets/js/header.js"></script>
    <script src="/blankShop/js/frontEnd/ShopCart-Header.js"></script>
	<!-- jQuery JS -->
	<!-- 	<script src="/blankShop/assets/js/vendor/jquery-1.12.4.min.js"></script> -->
	<!-- Popper JS -->
	<script src="/blankShop/assets/js/popper.min.js"></script>
	<!-- Bootstrap JS -->
	<script src="/blankShop/assets/js/bootstrap.min.js"></script>
	<!-- Plugins JS -->
	<script src="/blankShop/assets/js/plugins.js"></script>
	<!-- Ajax Mail -->
	<script src="/blankShop/assets/js/ajax-mail.js"></script>
	<!-- Main JS -->
	<script src="/blankShop/assets/js/main.js"></script>

	<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>

	<script type="text/javascript">
		
		//創建TABLE
		$(function() {
	
			$('#orderTable').DataTable({
				"searching": false,
				"destroy" : true,
				"sAjaxSource" : "/blankShop/frontEnd/orders",
				"sAjaxDataProp" : "",
				"rowId":"orderIdentity",
				"autowidth": true,
				"order" : [ [ 3, "desc" ] ],
				// "columnDefs": [
				// 			{ targets: 5,
				// 			render: function(data) {
				// 				return "<time datetime=>"+data+"</time>"
				// 				}
				// 			}   
				// 		],
				
				"aoColumns" : [ {
					"mData" : "orderId"
				}, {
					"mData" : "productname"
				}, {
					"mData" : "price"
				}, {
					"mData" : "amount"
				},{
					"mData" : "address"
				}, {
					"mData" : "orderStatus"
				}, {
					"mData" : "createDate", 
				}, ]
			});
	
		});
		
		//滑動預覽圖片
		var preSelectId;

		$('#orderTable').on('mouseenter', 'tbody tr td:nth-child(1)',
				function() {
					preSelectId = $(this).parent().attr("id")
						
					previewDialog.dialog("open");
					previewDialog.dialog( "option", "maxWidth", 460 );
					previewDialog.
					dialog( "option", "position", {my: "center", at: "right-20%", of: window } );
				})
		$('#orderTable').on('mouseleave', 'tbody  tr td:nth-child(1)',
				function() {
					preSelectId = null

					previewDialog.dialog("close");
					previewDialog.dialog("destory");
					$('#img1').attr("src", "")
					
				})
		//預覽的dialog

		var previewDialog, previewDiv
		previewDialog = $("#previewDialog").dialog(
				{
					autoOpen : false,
					height : 700,
					width : 400,
					modal : false,
					resizable : false,
					open : function() {

						$(".ui-dialog-titlebar-close").hide();
						console.log(preSelectId);
						$.ajax({
							
							url : "/blankShop/frontEnd/orders",
							type : "GET",
							dataType : "json",
							success : function(data) {
							for(let i = 0 ;i<data.length;i++){
								if(data[i].orderIdentity==preSelectId)
									$('#img1').attr("src", data[i].imgpath)
							}
								
							
							}

						})

					}

				});
	</script>

	<script>
		function showUpload(event) {
			var reader = new FileReader();
			reader.onload = function() {
				var previewArea = document.getElementById('previewArea');
				previewArea.src = reader.result;
			};
			reader.readAsDataURL(event.target.files[0]);

		}
		document.getElementById("checkPwd").addEventListener("focus", checkPwd);
		document.getElementById("checkPwd").addEventListener("blur", checkPwd);
		function checkPwd() {
			if (!$("#checkPwd").val()) {
				$("#checkPwdMsg").text("請輸入新密碼").show();
			} else if ($("#pwd").val() != $("#checkPwd").val()) {
				$("#checkPwdMsg").text("密碼不相符,請再次輸入").show();
				
			} else {
				$("#checkPwdMsg").text("密碼相符").show();
			}
		}
		// $('#btn1').click(function () {
		// 	
		// 	setTimeout(function(){window.location.reload(); },5000);
	
// 			swal({
//   title: "自动关闭弹窗！",
//   text: "2秒后自动关闭。",
//   showConfirmButton: fals
// });
//})
$('#btn1').mousedown(function() {
	var abc = "${alertmsg}"

			
			swal("修改成功","","success",{button:'確定', timer: 2000});
			setTimeout(function(){$('#send1').submit(); },2000);
})

  //一鍵輸入
  $("#btn2").click(function () {
                $("#address").val("106台北市大安區復興南路一段390號2樓");
                $("#cellphone").val("0987654321");
				$("#birthday").val("1994-02-17");
				
               
            });
	</script>
</body>

</html>