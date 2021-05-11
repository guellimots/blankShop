<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>BlankShop</title>
<meta name="description" content="">
<meta name="google-signin-client_id"
	content="528857856428-o80ljruk3qsht7gpqbmvnk49r9k5s8ca.apps.googleusercontent.com">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.0/handlebars.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/list.js/1.1.1/list.min.js"></script>
<!--    libs for stomp and sockjs-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<!--    end libs for stomp and sockjs-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet"
      type="text/css">
<link href="/blankShop/css/backEnd/Userstyle.css" rel="stylesheet">





<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>


</head>

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
													<li><a href="#" id="logout-btn">登出</a></li>
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
		<div class="mobile-off-canvas-active">
			<a class="mobile-aside-close"><i class="sli sli-close"></i></a>
			<div class="header-mobile-aside-wrap">
				<div class="mobile-search">
					<form class="search-form" action="#">
						<input type="text" placeholder="Search entire store…">
						<button class="button-search">
							<i class="sli sli-magnifier"></i>
						</button>
					</form>
				</div>
				<div class="mobile-menu-wrap">
					<!-- mobile menu start -->
					<div class="mobile-navigation">
						<!-- mobile menu navigation start -->
						<nav>
							<ul class="mobile-menu">
								<li class="menu-item-has-children"><a href="/blankShop/frontEnd/products/setIndex/1">全部商品</a>
									<ul class="dropdown">
										<li><a href="/blankShop/frontEnd/products/setIndex/2">上衣</a></li>
										<li><a href="/blankShop/frontEnd/products/setIndex/3">襯衫</a></li>
										<li><a href="/blankShop/frontEnd/products/setIndex/4">褲裝</a></li>
										<li><a href="/blankShop/frontEnd/products/setIndex/5">裙裝</a></li>
									</ul></li>
								<li><a href="/blankShop/frontEnd/products/setIndex/6">最新商品</a></li>
								<li><a href="/blankShop/frontEnd/products/setIndex/7">特價商品</a></li>
							</ul>
						</nav>
						<!-- mobile menu navigation end -->
					</div>
					<!-- mobile menu end -->
				</div>
				<div class="mobile-curr-lang-wrap">
					<div class="single-mobile-curr-lang">
						<a class="mobile-language-active" href="#">會員帳號<i
							class="sli sli-arrow-down"></i></a>
						<div class="lang-curr-dropdown lang-dropdown-active">
							<ul>
								<li><a href="/blankShop/frontEnd/logOut">登出</a></li>
								<li><a href="/blankShop/frontEnd/showmem">會員中心</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="mobile-social-wrap">
					<a class="facebook" href="#"><i class="sli sli-social-facebook"></i></a>
					<a class="instagram" href="#"><i
						class="sli sli-social-instagram"></i></a> <a class="google" href="#"><i
						class="sli sli-social-youtube"></i></a>
				</div>
			</div>
		</div>

		<br> <br>

		<div class="section-title text-center pb-60">
			<h2>最新商品 / New Arrivals</h2>
		</div>


		<!-- slides start -->


		<div class="slider-area section-padding-1">
			<div class="slider-active-2 owl-carousel nav-style-2 dot-style-1">
				<div class="single-slider slider-height-2 bg-aliceblue" id="ad1">
					<div class="container">
						<div class="row">
							<div class="col-xl-12 col-lg-12 col-md-12 col-12 col-sm-12">
								<div class="slider-content pt-180 slider-animated-1">
									<p class="animated"></p>
									<div class="slider-btn btn-hover">
										<a class="animated" href="shop.html">Shop Now <i
											class="sli sli-basket-loaded"></i></a>
									</div>
									<p class="animated"></p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="single-slider slider-height-2 bg-aliceblue" id="ad2">
					<div class="container">
						<div class="row">
							<div class="col-xl-12 col-lg-12 col-md-12 col-12 col-sm-12">
								<div class="slider-content pt-180 slider-animated-1">
									<p class="animated"></p>
									<div class="slider-btn btn-hover">
										<a class="animated" href="shop.html">Shop Now <i
											class="sli sli-basket-loaded"></i></a>
									</div>
									<p class="animated"></p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="single-slider slider-height-2 bg-aliceblue" id="ad3">
					<div class="container">
						<div class="row">
							<div class="col-xl-12 col-lg-12 col-md-12 col-12 col-sm-12">
								<div class="slider-content pt-180 slider-animated-1">
									<p class="animated"></p>
									<div class="slider-btn btn-hover">
										<a class="animated" href="shop.html">Shop Now <i
											class="sli sli-basket-loaded"></i></a>
									</div>
									<p class="animated"></p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="single-slider slider-height-2 bg-aliceblue" id="ad4">
					<div class="container">
						<div class="row">
							<div class="col-xl-12 col-lg-12 col-md-12 col-12 col-sm-12">
								<div class="slider-content pt-180 slider-animated-1">
									<p class="animated"></p>
									<div class="slider-btn btn-hover">
										<a class="animated" href="shop.html">Shop Now <i
											class="sli sli-basket-loaded"></i></a>
									</div>
									<p class="animated"></p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="single-slider slider-height-2 bg-aliceblue" id="ad5">
					<div class="container">
						<div class="row">
							<div class="col-xl-12 col-lg-12 col-md-12 col-12 col-sm-12">
								<div class="slider-content pt-180 slider-animated-1">
									<p class="animated"></p>
									<div class="slider-btn btn-hover">
										<a class="animated" href="shop.html">Shop Now <i
											class="sli sli-basket-loaded"></i></a>
									</div>
									<p class="animated"></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- slides end -->

		<div class="product-area pt-95 pb-70">
			<div class="container">
				<div class="section-title text-center pb-60">
					<h2>熱銷商品 / Best Sellers</h2>
				</div>
				<div class="arrivals-wrap scroll-zoom">

					<div class="ht-products product-slider-active owl-carousel">

						<!--Product Start-->
						<div
							class="ht-product ht-product-action-on-hover ht-product-category-right-bottom mb-30">
							<div class="ht-product-inner">
								<div class="ht-product-image-wrap">
									<a href="/blankShop/frontEnd/product/${bestSellers[0].productID}" class="ht-product-image"> <img
										src="${bestSellers[0].productImgDir1}"
										alt="Universal Product Style">
									</a>
									<div class="ht-product-action">
										<ul>
											<li><a href="#" data-toggle="modal"
												data-target="#exampleModal"><i class="sli sli-magnifier"></i><span
													class="ht-product-action-tooltip">Quick View</span></a></li>
										</ul>
									</div>
								</div>
								<div class="ht-product-content">
									<div class="ht-product-content-inner">
										<h4 class="ht-product-title">
											<a href="#">${bestSellers[0].productName}</a>
										</h4>
										<div class="ht-product-price">
											<span class="new">NT$ ${bestSellers[0].salePrice}</span> <span class="old">${bestSellers[0].productPrice}</span>
										</div>
									</div>
									<div class="ht-product-action">
										<ul>
											<li><a href="#"><i class="sli sli-magnifier"></i><span
													class="ht-product-action-tooltip">Quick View</span></a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<!--Product End-->
						<!--Product Start-->
						<div
							class="ht-product ht-product-action-on-hover ht-product-category-right-bottom mb-30">
							<div class="ht-product-inner">
								<div class="ht-product-image-wrap">
									<a href="/blankShop/frontEnd/product/${bestSellers[1].productID}" class="ht-product-image"> <img
										src="${bestSellers[1].productImgDir1}"
										alt="Universal Product Style">
									</a>
									<div class="ht-product-action">
										<ul>
											<li><a href="#" data-toggle="modal"
												data-target="#exampleModal"><i class="sli sli-magnifier"></i><span
													class="ht-product-action-tooltip">Quick View</span></a></li>
										</ul>
									</div>
								</div>
								<div class="ht-product-content">
									<div class="ht-product-content-inner">
										<h4 class="ht-product-title">
											<a href="#">${bestSellers[1].productName}</a>
										</h4>
										<div class="ht-product-price">
											<span class="new">$NT ${bestSellers[1].salePrice}</span> <span class="old">${bestSellers[1].productPrice}</span>
										</div>
									</div>
									<div class="ht-product-action">
										<ul>
											<li><a href="#"><i class="sli sli-magnifier"></i><span
													class="ht-product-action-tooltip">Quick View</span></a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<!--Product End-->
						<!--Product Start-->
						<div
							class="ht-product ht-product-action-on-hover ht-product-category-right-bottom mb-30">
							<div class="ht-product-inner">
								<div class="ht-product-image-wrap">
									<a href="/blankShop/frontEnd/product/${bestSellers[2].productID}" class="ht-product-image"> <img
										src="${bestSellers[2].productImgDir1}"
										alt="Universal Product Style">
									</a>
									<div class="ht-product-action">
										<ul>
											<li><a href="#" data-toggle="modal"
												data-target="#exampleModal"><i class="sli sli-magnifier"></i><span
													class="ht-product-action-tooltip">Quick View</span></a></li>
										</ul>
									</div>
								</div>
								<div class="ht-product-content">
									<div class="ht-product-content-inner">
										<h4 class="ht-product-title">
											<a href="#">${bestSellers[2].productName}</a>
										</h4>
										<div class="ht-product-price">
											<span class="new">NT$ ${bestSellers[2].salePrice}</span> <span class="old">${bestSellers[2].productPrice}</span>
										</div>
									</div>
									<div class="ht-product-action">
										<ul>
											<li><a href="#"><i class="sli sli-magnifier"></i><span
													class="ht-product-action-tooltip">Quick View</span></a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<!--Product End-->
						<!--Product Start-->
						<div
							class="ht-product ht-product-action-on-hover ht-product-category-right-bottom mb-30">
							<div class="ht-product-inner">
								<div class="ht-product-image-wrap">
									<a href="/blankShop/frontEnd/product/${bestSellers[3].productID}" class="ht-product-image"> <img
										src="${bestSellers[3].productImgDir1}"
										alt="Universal Product Style">
									</a>
									<div class="ht-product-action">
										<ul>
											<li><a href="#" data-toggle="modal"
												data-target="#exampleModal"><i class="sli sli-magnifier"></i><span
													class="ht-product-action-tooltip">Quick View</span></a></li>
										</ul>
									</div>
								</div>
								<div class="ht-product-content">
									<div class="ht-product-content-inner">
										<h4 class="ht-product-title">
											<a href="#">${bestSellers[3].productName}</a>
										</h4>
										<div class="ht-product-price">
											<span class="new">NT$ ${bestSellers[3].salePrice}</span> <span class="old">${bestSellers[3].productPrice}</span>
										</div>
									</div>
									<div class="ht-product-action">
										<ul>
											<li><a href="#"><i class="sli sli-magnifier"></i><span
													class="ht-product-action-tooltip">Quick View</span></a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<!--Product End-->
						<!--Product Start-->
						<div
							class="ht-product ht-product-action-on-hover ht-product-category-right-bottom mb-30">
							<div class="ht-product-inner">
								<div class="ht-product-image-wrap">
									<a href="/blankShop/frontEnd/product/${bestSellers[4].productID}" class="ht-product-image"> <img
										src="${bestSellers[4].productImgDir1}"
										alt="Universal Product Style">
									</a>
									<div class="ht-product-action">
										<ul>
											<li><a href="#" data-toggle="modal"
												data-target="#exampleModal"><i class="sli sli-magnifier"></i><span
													class="ht-product-action-tooltip">Quick View</span></a></li>
										</ul>
									</div>
								</div>
								<div class="ht-product-content">
									<div class="ht-product-content-inner">
										<h4 class="ht-product-title">
											<a href="#">${bestSellers[4].productName}</a>
										</h4>
										<div class="ht-product-price">
											<span class="new">NT$ ${bestSellers[4].salePrice}</span> <span class="old">${bestSellers[4].productPrice}</span>
										</div>
									</div>
									<div class="ht-product-action">
										<ul>
											<li><a href="#"><i class="sli sli-magnifier"></i><span
													class="ht-product-action-tooltip">Quick View</span></a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<!--Product End-->
					</div>

				</div>

			</div>
		</div>

		<div class="feature-area">
			<div class="container">
				<div class="row">
					<div class="col-xl-4 col-lg-4 col-md-4">
						<div class="single-feature mb-40">
							<div class="feature-icon">
								<img src="/blankShop/assets/img/icon-img/free-shipping.png"
									alt="">
							</div>
							<div class="feature-content">
								<h4>免運費</h4>
								<p>本館全部商品免運</p>
							</div>
						</div>
					</div>
					<div class="col-xl-5 col-lg-4 col-md-4">
						<div class="single-feature mb-40 pl-50">
							<div class="feature-icon">
								<img id="chatTo" src="/blankShop/assets/img/icon-img/support.png" alt="">
							</div>
							<div class="feature-content">
								<h4>線上客服</h4>
								<p>24x7 客服不中斷</p>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-lg-4 col-md-4">
						<div class="single-feature mb-40">
							<div class="feature-icon">
								<img src="/blankShop/assets/img/icon-img/security.png" alt="">
							</div>
							<div class="feature-content">
								<h4>安全付款</h4>
								<p>使用PayPal 個資有保障</p>
							</div>
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

		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">x</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-md-5 col-sm-12 col-xs-12">
								<div class="tab-content quickview-big-img">
									<div id="pro-1" class="tab-pane fade show active">
										<img src="/blankShop/assets/img/product/quickview-l1.svg"
											alt="">
									</div>
									<div id="pro-2" class="tab-pane fade">
										<img src="/blankShop/assets/img/product/quickview-l2.svg"
											alt="">
									</div>
									<div id="pro-3" class="tab-pane fade">
										<img src="/blankShop/assets/img/product/quickview-l3.svg"
											alt="">
									</div>
									<div id="pro-4" class="tab-pane fade">
										<img src="/blankShop/assets/img/product/quickview-l2.svg"
											alt="">
									</div>
								</div>
								<!-- Thumbnail Large Image End -->
								<!-- Thumbnail Image End -->
								<div class="quickview-wrap mt-15">
									<div
										class="quickview-slide-active owl-carousel nav nav-style-2"
										role="tablist">
										<a class="active" data-toggle="tab" href="#pro-1"><img
											src="/blankShop/assets/img/product/quickview-s1.svg" alt=""></a>
										<a data-toggle="tab" href="#pro-2"><img
											src="/blankShop/assets/img/product/quickview-s2.svg" alt=""></a>
										<a data-toggle="tab" href="#pro-3"><img
											src="/blankShop/assets/img/product/quickview-s3.svg" alt=""></a>
										<a data-toggle="tab" href="#pro-4"><img
											src="/blankShop/assets/img/product/quickview-s2.svg" alt=""></a>
									</div>
								</div>
							</div>
							<div class="col-md-7 col-sm-12 col-xs-12">
								<div class="product-details-content quickview-content">
									<h2>Products Name Here</h2>
									<div class="product-details-price">
										<span>$18.00 </span> <span class="old">$20.00 </span>
									</div>
									<div class="pro-details-rating-wrap">
										<div class="pro-details-rating">
											<i class="sli sli-star yellow"></i> <i
												class="sli sli-star yellow"></i> <i
												class="sli sli-star yellow"></i> <i class="sli sli-star"></i>
											<i class="sli sli-star"></i>
										</div>
										<span>3 Reviews</span>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisic elit
										eiusm tempor incidid ut labore et dolore magna aliqua. Ut enim
										ad minim venialo quis nostrud exercitation ullamco</p>
									<div class="pro-details-list">
										<ul>
											<li>- 0.5 mm Dail</li>
											<li>- Inspired vector icons</li>
											<li>- Very modern style</li>
										</ul>
									</div>
									<div class="pro-details-size-color">
										<div class="pro-details-color-wrap">
											<span>Color</span>
											<div class="pro-details-color-content">
												<ul>
													<li class="blue"></li>
													<li class="maroon active"></li>
													<li class="gray"></li>
													<li class="green"></li>
													<li class="yellow"></li>
													<li class="white"></li>
												</ul>
											</div>
										</div>
										<div class="pro-details-size">
											<span>Size</span>
											<div class="pro-details-size-content">
												<ul>
													<li><a href="#">s</a></li>
													<li><a href="#">m</a></li>
													<li><a href="#">l</a></li>
													<li><a href="#">xl</a></li>
													<li><a href="#">xxl</a></li>
												</ul>
											</div>
										</div>
									</div>
									<div class="pro-details-quality">
										<div class="cart-plus-minus">
											<input class="cart-plus-minus-box" type="text"
												name="qtybutton" value="2">
										</div>
										<div class="pro-details-cart">
											<a href="#">Add To Cart</a>
										</div>
										<div class="pro-details-wishlist">
											<a title="Add To Wishlist" href="#"><i
												class="sli sli-heart"></i></a>
										</div>
										<div class="pro-details-compare">
											<a title="Add To Compare" href="#"><i
												class="sli sli-refresh"></i></a>
										</div>
									</div>
									<div class="pro-details-meta">
										<span>Categories :</span>
										<ul>
											<li><a href="#">Minimal,</a></li>
											<li><a href="#">Furniture,</a></li>
											<li><a href="#">Fashion</a></li>
										</ul>
									</div>
									<div class="pro-details-meta">
										<span>Tag :</span>
										<ul>
											<li><a href="#">Fashion, </a></li>
											<li><a href="#">Furniture,</a></li>
											<li><a href="#">Electronic</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal end -->
	</div>

    <input id="userName" placeholder="search" type="hidden" value="${name}"/>
    <input id="memberId" placeholder="search" type="hidden" value="${memberId}"/>
    <div id="message-dialog">
 
    <div class="chat">
        <!-- <div class="chat-header clearfix">
    
               <h1>即時客服</h1>
     
        </div>  -->
        <div class="chat-history">
            <ul>

            </ul>

        </div> <!-- end chat-history -->

        <div class="chat-message clearfix">
            <textarea id="message-to-send" name="message-to-send" placeholder="" rows="3"></textarea>

          

            <button id="sendBtn">送出</button>

        </div> <!-- end chat-message -->
<examplechat1>
    </div> <!-- end chat -->
<button id="examplechat1">哈囉鍵</button>
<button id="examplechat2">範例對話1</button>
<button id="examplechat3">範例對話2</button>
    </div>




<!-- 通訊對話框 -->

<script id="message-template" type="text/x-handlebars-template">
    <li class="clearfix">
        <div class="message-data align-right">
            <span class="message-data-time">{{time}}, Today</span> &nbsp; &nbsp;
            <span class="message-data-name">You</span> <i class="fa fa-circle me"></i>
        </div>
        <div class="message other-message float-right">
            {{messageOutput}}
        </div>
    </li>
</script>

<script id="message-response-template" type="text/x-handlebars-template">
    <li>
        <div class="message-data">
            <span class="message-data-name"><i class="fa fa-circle online"></i> {{userName}}</span>
            <span class="message-data-time">{{time}}, Today</span>
        </div>
        <div class="message my-message">
            {{response}}
        </div>
    </li>
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
    <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
	<!-- Main JS -->
	<script src="/blankShop/assets/js/main.js"></script>
	<script src="/blankShop/js/frontEnd/ShopCart-Header.js"></script>
	<script src="/blankShop/assets/js/header.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>    
    <script src="/blankShop/js/backEnd/memberChat/clientcustom.js"></script>
    <script src="/blankShop/js/backEnd/memberChat/clientchat.js"></script>
    
    <script>
        
        // window.onload = function() {
    
            $(function(){
                $("#chatTo").attr("class","");
                registration();
                selectUser("admin");

				$("#examplechat1").click(chatHi)
				$("#examplechat2").click(chatEx1)
				$("#examplechat3").click(chatEx2)
    
    
            })

			function chatHi(){
				$("#message-to-send").val("您好")

			}
			function chatEx1(){
				$("#message-to-send").val("想取消剛剛購買的燈芯絨襯衫")
			}

				
			function chatEx2(){
				$("#message-to-send").val("請問可以取消標語印花T恤的訂單嗎?")
			}

				
    

                     var chatroom
    
                    chatroom = $("#message-dialog").dialog({
                    autoOpen: false,
                    height: 820,
                    width: 480,
                    modal: false,
                    resizable:true,
                    title: "即時客服",
                    position: { my: "right bottom", at: "right bottom", of: window  },
                   
                    close: function () {
    
                        
                        chatroom.dialog("close");
    
                    }
                    });    
    
    
    
                    $('#chatTo').button().on("click", function () {
                        
                        $("#message-dialog").css("visibility","visible")
        
    
                        chatroom.dialog("open");
                        chatroom.dialog( "option", "maxWidth", 900 );
    
                    }
                
                    
                
                    
    
                    )
    
    
    
    
                    //   };
    </script>

</body>
</html>