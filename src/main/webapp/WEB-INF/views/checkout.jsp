<%@ page contentType="text/html;charset=utf-8" language="java" import="java.io.*,java.util.*,java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    // === 接收電子地圖回傳值 ===
    String s_processID = request.getParameter("processID")==null?"":request.getParameter("processID");
    String s_stCate = request.getParameter("stCate")==null?"":request.getParameter("stCate");
    String s_stCode = request.getParameter("stCode")==null?"":request.getParameter("stCode");
    String s_stName = request.getParameter("stName")==null?"":request.getParameter("stName");
    String s_stAddr = request.getParameter("stAddr")==null?"":request.getParameter("stAddr");
    String s_stTel = request.getParameter("stTel")==null?"":request.getParameter("stTel");
    String s_webPara = request.getParameter("webPara")==null?"":request.getParameter("webPara");

    s_stName = new String(s_stName.getBytes("ISO8859_1"),"UTF-8");
    s_stAddr = new String(s_stAddr.getBytes("ISO8859_1"),"UTF-8");
%>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Parlo - eCommerce Bootstrap 4 Template</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="assets/img/favicon.png">

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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
	<div class="wrapper">
		<header class="header-area sticky-bar">
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
										<li class="angle-shape"><a href="index.html">全部商品</a>
											<ul class="submenu">
												<li><a href="index.html">上衣</a></li>
												<li><a href="index-2.html">襯衫</a></li>
												<li><a href="index-3.html">褲裝</a></li>
												<li><a href="index.html">裙裝</a></li>
											</ul></li>
										<li><a href="shop.html">最新商品</a></li>
										<li><a href="contact-us.html">特價商品</a></li>
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
											class="count-style">2</span>
										</span> <span class="cart-price"> NT$ 320 </span>
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
													<div class="item-close">
														<a href="#"><i class="sli sli-close"></i></a>
													</div>
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
													<div class="item-close">
														<a href="#"><i class="sli sli-close"></i></a>
													</div>
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
												<a class="default-btn" href="/blankShop/frontEnd/viewcart">檢視購物車</a>
											</div>
										</div>
									</div>
								</div>
								<div></div>
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
													<li><a href="/blankShop/frontEnd/logOut" id="logout-btn">登出</a></li>
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
								<a href="index.html"> <img alt=""
									src="/blankShop/assets/img/logo/logo.png" width="100px">
								</a>
							</div>
						</div>
						<div class="col-6">
							<div class="header-right-wrap">
								<div class="cart-wrap">
									<button class="icon-cart-active">
										<span class="icon-cart"> <i class="sli sli-bag"></i> <span
											class="count-style">2</span>
										</span> <span class="cart-price"> NT$ 320 </span>
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
						<li class="active">Checkout</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- compare main wrapper start -->
		<div class="my-account-wrapper pt-100 pb-100">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<!-- My Account Page Start -->
						<div class="myaccount-page-wrapper">
							<!-- My Account Tab Menu Start -->
							<div class="row">
								
								<div class="col-lg-2">
									<h3>運送方式</h3>
									<hr>
									<div class="myaccount-tab-menu nav" role="tablist">
										<a href="#account-info" data-toggle="tab"><i
											class="fa fa-user"></i>一般宅配</a> <a href="#orders"
											data-toggle="tab"><i class="fa fa-cart-arrow-down"></i>超商取貨</a>
										
									</div>
								</div>
								<!-- My Account Tab Menu End -->
								<!-- My Account Tab Content Start -->
								<div class="col-lg-10">
									<div class="tab-content" id="myaccountContent">
										<div class="tab-pane fade show active" id="orders" role="tabpanel">
											<div class="myaccount-content">
												<h3><span><form method="post" name="simulation_from" action="https://map.ezship.com.tw/ezship_map_web.jsp">
													<table width="100%" border="0" cellspacing="0" cellpadding="0" style="border-collapse: collapse">
													  <tr>
														<td align="center">
														  <input name="Submit2" type="submit" value="請選擇配送門市"></center>
														  <input type="hidden" name="suID"  value="buyer@myweb.com.tw"> <!-- 賣家登入ezShip的帳號，需開通網站串接服務 -->
														  <input type="hidden" name="processID" value="155922"> <!-- 處理序號或訂單編號，由購物網站自行提供的編號 -->
														  <input type="hidden" name="stCate" value="<%=s_stCate%>"> <!-- 取件門市通路代號。可帶空值 -->
														  <input type="hidden" name="stCode" value="<%=s_stCode%>"> <!-- 取件門市代號。可帶空值 -->
														  <input type="hidden" name="rtURL"  value="http://localhost:8080/blankShop/frontEnd/ezShip"><!-- 回傳網址路徑及程式名稱。請輸入完整網站路徑網址。如  -->
														  <input type="hidden" name="webPara" value="${memberId}"> <!-- 網站所需額外判別資料。由開通網站自行提供，ezShip 將原值回傳。可帶空值 -->
														</td>
													  </tr>
													</table>
												  </form></span></h3>
												  <div class="d-flex justify-content-center">		
												  <div class="justify-content-center">
												  <img src="/blankShop/img/frontEnd/FamilyMart.jpg" style="width: 120px;">
												  <img src="/blankShop/img/frontEnd/Hi-Life.jpg" style="width: 120px;">
												  <img src="/blankShop/img/frontEnd/ok.jpg" style="width: 120px;">
												</div>
											</div>
												  <hr>
													
														<div class="row">
															<div class="col-lg-12">
																<div class="col-lg-6">
																	<div class="billing-info mb-20">
																		<label>收件人<abbr class="required" title="required">*</abbr></label>
																		<input type="text" placeholder="name" name="memberName" value="${Member.memberName}"/>
																	</div>
																</div>
																<div class="col-lg-6">
																	<div class="billing-info mb-20">
																		<label>連絡電話 <abbr class="required" title="required">*</abbr></label>
																		<input type="text" name="cellNumber" value="${Member.cellNumber}">
																	</div>
																</div>
																<div class="col-lg-6 ">
																	<div class="billing-info mb-20">
																		<label>Email <abbr class="required" title="required">*</abbr></label>
																		<input type="text" name="email" value="${Member.email}">
																	</div>
																</div>
																<div class="col-lg-6">
																	<div class="billing-info mb-20">
																		<label>門市名稱<abbr class="required" title="required">*</abbr></label>
																		<input class="billing-address" id="ezName" name="stName" value="${stName}"
																			type="text" readonly="readonly">
																	</div>
																</div>
																<div class="col-lg-6">
																	<div class="billing-info mb-20">
																		<label>門市地址<abbr class="required" title="required">*</abbr></label>
																		<input class="billing-address" id="ezAdd"  name="stAddr" value="${stAddr}"
																			type="text" readonly="readonly">
							
																	</div>
																</div>
																<div class="col-lg-6">
																	<div class="billing-info mb-20">
																		<label>門市電話<abbr class="required" title="required">*</abbr></label>
																		<input class="billing-address"  name="stTel" value="${stTel}"
																			type="text" readonly="readonly">
							
																	</div>
																</div>
							
															</div>				
														</div>
											</div>
										</div>
										<!-- Single Tab Content End -->
										
										<!-- Single Tab Content Start -->
										<div class="tab-pane fade" id="account-info"
											role="tabpanel">
											<div class="myaccount-content" >
												<h3>宅配</h3>
												<div class="row">
													<div class="col-lg-8">
														<div class="col-lg-12">
															<div class="billing-info mb-20">
																<label>姓名<abbr class="required" title="required">*</abbr></label>
																<input type="text" placeholder="name" name="memberName" value="${Member.memberName}"/>
															</div>
														</div>
														<div class="col-lg-12">
															<div class="billing-info mb-20">
																<label>運送地址<abbr class="required" title="required">*</abbr></label>
																<input class="billing-address" placeholder="address" name="address" value="${Member.address}"
																	type="text">
					
															</div>
														</div>
					
														<div class="col-lg-12 col-md-12">
															<div class="billing-info mb-20">
																<label>連絡電話 <abbr class="required" title="required">*</abbr></label>
																<input type="text" name="cellNumber" value="${Member.cellNumber}">
															</div>
														</div>
														<div class="col-lg-12 col-md-12">
															<div class="billing-info mb-20">
																<label>Email <abbr class="required" title="required">*</abbr></label>
																<input type="text" name="email" value="${Member.email}">
															</div>
														</div>
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
				<hr>
				<div class="checkout-wrap pt-30">
					<div class="">
						<h3>付款方式</h3>
						<img src="http://localhost:8080/blankShop/img/frontEnd/paypal.jpg" style="width: 200px;"><br>

						<div class="payment-method">
							<form action="pay" method="POST">
								<input type="hidden" id="getprice" name="totalPrice">
								<input type="hidden" name="stName" value="${stName}"> 
								<input type="hidden" name="stAddr" value="${stAddr}"> 
								<div class="Place-order mt-40">
									<button type=submit class="btn btn-secondary btn-lg">前往PayPal結帳</button>
								</div>
							</form>
						</div>
					</div>
					
				</div>
				
			</div>
		</div>
		
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
	<!-- compare main wrapper end -->
	
	<script>

	
		$("#getprice").attr("value",localStorage.getItem('totalPrice'));
		localStorage.setItem("ezShip","${stAddr}"+"-"+"${stName}");
	</script>

	



	<!-- All JS is here
============================================ -->

	<!-- jQuery JS -->
	<script src="/blankShop/assets/js/vendor/jquery-1.12.4.min.js"></script>
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
</body>

</html>