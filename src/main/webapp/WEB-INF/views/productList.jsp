<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Product List</title>
<meta name="google-signin-client_id"
	content="528857856428-o80ljruk3qsht7gpqbmvnk49r9k5s8ca.apps.googleusercontent.com">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="/blankShop/assets/img/favicon.png">

<!-- CSS
	============================================ -->

<link rel='stylesheet' href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.5/pagination.css" />
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

<style>
.filter-btn {
	width: 60px;
	display: inline-block;
	background-color: #ffffff;
	border-radius: 5px;
	margin-top: 15px;
	border: 1px solid #dda769;
	color: #dda769;
	cursor: pointer;
}

.filter-btn:hover {
	background-color: #dda769;
	color: #ffffff;
}
</style>
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
											class="count-style"></span>
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



		<div class="breadcrumb-area pt-35 pb-35 bg-gray">
			<div class="container">
				<div class="breadcrumb-content text-center">
					<ul>
						<li><a href="index.html">Home</a></li>
						<li class="active">Shop list</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="shop-area pt-95 pb-100">
			<div class="container">
				<div class="row flex-row-reverse">
					<div class="col-lg-9">
						<div class="shop-top-bar">
							<div class="select-shoing-wrap">
								<div class="shop-select">
									<select id="orderSelectMenu">
										<option value="">選擇排序方式</option>
										<option value="orderByDate">日期新至舊排序</option>
										<option value="orderByPrice">價格低至高排序</option>
									</select>
								</div>
							</div>
							<div class="shop-tab nav">
								<a href="#shop-1" data-toggle="tab"> <i class="sli sli-grid"></i>
								</a> <a class="active" href="#shop-2" data-toggle="tab"> <i
									class="sli sli-menu"></i>
								</a>
							</div>
						</div>
						<div class="shop-bottom-area mt-35">
							<div class="tab-content jump">
								<div id="shop-1" class="tab-pane">
									<div class="row ht-products" id="dataContainer1">
									</div>
								</div>
								<div id="shop-2" class="tab-pane active">
								  <div id="dataContainer2">
								  </div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="sidebar-style mr-30 filterBox">
							<h4 class="pro-sidebar-title">關鍵字搜尋</h4>
							<hr>
							<div class="sidebar-widget">
								<div class="pro-sidebar-search mb-50 mt-25">
									<form class="pro-sidebar-search-form" id="searchForm" action="#">
										<input type="text" id="keyword" placeholder="搜尋全部商品...">
										<button type="submit">
											<i class="sli sli-magnifier"></i>
										</button>
									</form>	
								</div>
							</div>
							<br>
							<h4 class="pro-sidebar-title">頁面結果篩選</h4>
							<hr>
							    <form action="#" id="filterForm" method="post">
								<div class="sidebar-widget">
									<h4 class="pro-sidebar-title">商品種類</h4>
									<div class="sidebar-widget-list mt-30">
										<ul id="genreFilter">
											<li>
												<div class="sidebar-widget-list-left">
													<input type="checkbox" value="tops"><a href="javascript:;">上衣</a>
													<span class="checkmark"></span>
												</div>
											</li>
											<li>
												<div class="sidebar-widget-list-left">
													<input type="checkbox" value="shirts"><a href="javascript:;">襯衫</a>
													<span class="checkmark"></span>
												</div>
											</li>
											<li>
												<div class="sidebar-widget-list-left">
													<input type="checkbox" value="trousers"><a href="javascript:;">褲裝</a>
													<span class="checkmark"></span>
												</div>
											</li>
											<li>
												<div class="sidebar-widget-list-left">
													<input type="checkbox" value="dresses"><a href="javascript:;">裙裝</a>
													<span class="checkmark"></span>
												</div>
											</li>
										</ul>
									</div>
								</div>
								<div class="sidebar-widget mt-45">
									<h4 class="pro-sidebar-title">價格篩選</h4>
									<div class="price-filter mt-10">
										<div class="price-slider-amount" id="priceFilter">
											<input type="text" id="amount" name="price"
												placeholder="請選取價格範圍" />
										</div>
										<div id="slider-range"></div>
									</div>
								</div>
								<div class="sidebar-widget mt-50">
									<h4 class="pro-sidebar-title">商品用途</h4>
									<div class="sidebar-widget-list mt-20">
										<ul id="purposeFilter">
											<li>
												<div class="sidebar-widget-list-left">
													<input type="checkbox" value="leisure"> <a href="javascript:;">居家休閒</a>
													<span class="checkmark"></span>
												</div>
											</li>
											<li>
												<div class="sidebar-widget-list-left">
													<input type="checkbox" value="date"> <a href="javascript:;">約會必勝</a>
													<span class="checkmark"></span>
												</div>
											</li>
											<li>
												<div class="sidebar-widget-list-left">
													<input type="checkbox" value="workPlace"> <a href="javascript:;">職場穿搭</a>
													<span class="checkmark"></span>
												</div>
											</li>
										</ul>
									</div>
								</div>
								
								<br>

								<input id="filterSubmit-btn" class="filter-btn" type="submit" value="送出">&nbsp
								<input class="filter-btn" type="reset" value="清除">
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
	<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.5/pagination.min.js"></script>
	<script src="/blankShop/assets/js/main.js"></script>
	<script src="/blankShop/assets/js/header.js"></script>
	<script src="/blankShop/assets/js/filter.js"></script>
	<script src="/blankShop/js/frontEnd/ShopCart-Header.js"></script>
	
	<script>
	
	var searchForm=document.getElementById('searchForm');

	searchForm.addEventListener('submit', search);

	function search(event){

		event.preventDefault();

	    var keyword=document.getElementById('keyword').value;

	    $.ajax({
			url: '/blankShop/frontEnd/products/searchAll',                        
			type: 'POST',
	        data:{keyword:keyword},                    
			dataType:'json',
			error: function (xhr, status, error) { 
				console.log(error);
			},    
			success: function (data) {
				

				$('#shop-1').pagination({
					pageSize:9,
					dataSource: data,
					showNavigator: true,
					formatNavigator: '第<\%= currentPage %>頁，共<\%= totalPage %>頁，共<\%= totalNumber %>項結果',
					callback: function (data, pagination) {
			
								var html = "";
								$.each(data, function (index, item) {
					
									var pdName=item.productName;
									var pdPrice=item.productPrice;
									var pdSalePrice=item.salePrice;
					
									if(pdSalePrice=="0"){
										pdSalePrice=pdPrice;
										pdPrice="";
									}
					
									pdSalePrice="NT$ "+pdSalePrice;
									if(pdPrice!=""){
										pdPrice="NT$ "+pdPrice;
									}
					
					
									var pdGenre=item.genre;
									var pdLink="/blankShop/frontEnd/product/"+item.productID;
									var pdImg=item.productImgDir1;
					
									html += `
									<div class="col-xl-4 col-md-6 col-lg-6 col-sm-6">
										<div class="ht-product ht-product-action-on-hover ht-product-category-right-bottom mb-30">
																<div class="ht-product-inner">
																	<div class="ht-product-image-wrap">
																		<a href="\${pdLink}" class="ht-product-image"> <img src="\${pdImg}" alt="Universal Product Style"> </a>
																		<div class="ht-product-action">
																			<ul>
																				<li><a href="#" data-toggle="modal" data-target="#exampleModal"><i class="sli sli-magnifier"></i><span class="ht-product-action-tooltip">Quick View</span></a></li>
																			</ul>
																		</div>
																	</div>
																	<div class="ht-product-content">
																		<div class="ht-product-content-inner">
																			<div class="ht-product-categories"><a href="#">\${pdGenre}</a></div>
																			<h4 class="ht-product-title"><a href="\${pdLink}">\${pdName}</a></h4>
																			<div class="ht-product-price">
																				<span class="new">\${pdSalePrice}</span>
																				<span class="old">\${pdPrice}</span>
																			</div>
																		</div>
																		<div class="ht-product-action">
																			<ul>
																				<li><a href="#"><i class="sli sli-magnifier"></i><span class="ht-product-action-tooltip">Quick View</span></a></li>
																			</ul>
																		</div>
																	</div>
																</div>
										</div>
									</div>
									`;
								});
								
								$('#dataContainer1').html(html);
			
					}
				})


				$('#shop-2').pagination({
					pageSize:4,
					dataSource: data,
					showNavigator: true,
					formatNavigator: '第<\%= currentPage %>頁，共<\%= totalPage %>頁，共<\%= totalNumber %>項結果',
					callback: function (data, pagination) {

			
								var html = "";
								$.each(data, function (index, item) {
					
									var pdName=item.productName;
									var pdPrice=item.productPrice;
									var pdSalePrice=item.salePrice;
					
									if(pdSalePrice=="0"){
										pdSalePrice=pdPrice;
										pdPrice="";
									}
					
									pdSalePrice="NT$ "+pdSalePrice;
									if(pdPrice!=""){
										pdPrice="NT$ "+pdPrice;
									}
					
					
									var pdGenre=item.genre;
									var pdLink="/blankShop/frontEnd/product/"+item.productID;
									var pdImg=item.productImgDir1;
									var pdDis=item.productDiscription1;
					
									html += `
									<div
											class="shop-list-wrap shop-list-mrg2 shop-list-mrg-none mb-30">
											<div class="row">
												<div class="col-lg-4 col-md-4">
													<div class="product-list-img">
														<a href="\${pdLink}"> <img
															src="\${pdImg}"
															alt="Universal Product Style">
														</a>
														<div class="product-quickview">
															<a href="#" title="Quick View" data-toggle="modal"
																data-target="#exampleModal"><i
																class="sli sli-magnifier-add"></i></a>
														</div>
													</div>
												</div>
												<div class="col-lg-8 col-md-8 align-self-center">
													<div class="shop-list-content">
														<h3>
															<a href="\${pdLink}">\${pdName}</a>
														</h3>
														\${pdDis}
														<span>\${pdGenre}</span>
														<div class="shop-list-price-action-wrap">
															<div class="shop-list-price-ratting">
																<div class="ht-product-list-price">
																	<span class="new">\${pdSalePrice}</span> <span class="old">\${pdPrice}</span>
																</div>
															</div>
															<div class="ht-product-list-action">
																<a class="list-cart" title="Add To Cart" href="\${pdLink}"><i
																	class="sli sli-eye"></i>檢視商品</a>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									`;
								});
								
								$('#dataContainer2').html(html);
			
					}
				})


			}
		});

	}


	$("#orderSelectMenu").change(
		function(){
			
			if ($(this).val()=="orderByDate"){
		
		
        console.log($(this).val());
		$.ajax({
			url: '/blankShop/frontEnd/products/orderByDate',                        
			type: 'GET',                  
			dataType:'json',
			error: function (xhr, status, error) { 
				console.log(error);
			},    
			success: function (data) {
				

				$('#shop-1').pagination({
					pageSize:9,
					dataSource: data,
					showNavigator: true,
					formatNavigator: '第<\%= currentPage %>頁，共<\%= totalPage %>頁，共<\%= totalNumber %>項結果',
					callback: function (data, pagination) {
			
								var html = "";
								$.each(data, function (index, item) {
					
									var pdName=item.productName;
									var pdPrice=item.productPrice;
									var pdSalePrice=item.salePrice;
					
									if(pdSalePrice=="0"){
										pdSalePrice=pdPrice;
										pdPrice="";
									}
					
									pdSalePrice="NT$ "+pdSalePrice;
									if(pdPrice!=""){
										pdPrice="NT$ "+pdPrice;
									}
					
					
									var pdGenre=item.genre;
									var pdLink="/blankShop/frontEnd/product/"+item.productID;
									var pdImg=item.productImgDir1;
					
									html += `
									<div class="col-xl-4 col-md-6 col-lg-6 col-sm-6">
										<div class="ht-product ht-product-action-on-hover ht-product-category-right-bottom mb-30">
																<div class="ht-product-inner">
																	<div class="ht-product-image-wrap">
																		<a href="\${pdLink}" class="ht-product-image"> <img src="\${pdImg}" alt="Universal Product Style"> </a>
																		<div class="ht-product-action">
																			<ul>
																				<li><a href="#" data-toggle="modal" data-target="#exampleModal"><i class="sli sli-magnifier"></i><span class="ht-product-action-tooltip">Quick View</span></a></li>
																			</ul>
																		</div>
																	</div>
																	<div class="ht-product-content">
																		<div class="ht-product-content-inner">
																			<div class="ht-product-categories"><a href="#">\${pdGenre}</a></div>
																			<h4 class="ht-product-title"><a href="\${pdLink}">\${pdName}</a></h4>
																			<div class="ht-product-price">
																				<span class="new">\${pdSalePrice}</span>
																				<span class="old">\${pdPrice}</span>
																			</div>
																		</div>
																		<div class="ht-product-action">
																			<ul>
																				<li><a href="#"><i class="sli sli-magnifier"></i><span class="ht-product-action-tooltip">Quick View</span></a></li>
																			</ul>
																		</div>
																	</div>
																</div>
										</div>
									</div>
									`;
								});
								
								$('#dataContainer1').html(html);
			
					}
				})


				$('#shop-2').pagination({
					pageSize:4,
					dataSource: data,
					showNavigator: true,
					formatNavigator: '第<\%= currentPage %>頁，共<\%= totalPage %>頁，共<\%= totalNumber %>項結果',
					callback: function (data, pagination) {

			
								var html = "";
								$.each(data, function (index, item) {
					
									var pdName=item.productName;
									var pdPrice=item.productPrice;
									var pdSalePrice=item.salePrice;
					
									if(pdSalePrice=="0"){
										pdSalePrice=pdPrice;
										pdPrice="";
									}
					
									pdSalePrice="NT$ "+pdSalePrice;
									if(pdPrice!=""){
										pdPrice="NT$ "+pdPrice;
									}
					
					
									var pdGenre=item.genre;
									var pdLink="/blankShop/frontEnd/product/"+item.productID;
									var pdImg=item.productImgDir1;
									var pdDis=item.productDiscription1;
					
									html += `
									<div
											class="shop-list-wrap shop-list-mrg2 shop-list-mrg-none mb-30">
											<div class="row">
												<div class="col-lg-4 col-md-4">
													<div class="product-list-img">
														<a href="\${pdLink}"> <img
															src="\${pdImg}"
															alt="Universal Product Style">
														</a>
														<div class="product-quickview">
															<a href="#" title="Quick View" data-toggle="modal"
																data-target="#exampleModal"><i
																class="sli sli-magnifier-add"></i></a>
														</div>
													</div>
												</div>
												<div class="col-lg-8 col-md-8 align-self-center">
													<div class="shop-list-content">
														<h3>
															<a href="\${pdLink}">\${pdName}</a>
														</h3>
														\${pdDis}
														<span>\${pdGenre}</span>
														<div class="shop-list-price-action-wrap">
															<div class="shop-list-price-ratting">
																<div class="ht-product-list-price">
																	<span class="new">\${pdSalePrice}</span> <span class="old">\${pdPrice}</span>
																</div>
															</div>
															<div class="ht-product-list-action">
																<a class="list-cart" title="Add To Cart" href="\${pdLink}"><i
																	class="sli sli-eye"></i>檢視商品</a>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									`;
								});
								
								$('#dataContainer2').html(html);
			
					}
				})


			}
		});

			}

			if ($(this).val()=="orderByPrice"){

				console.log($(this).val());

					    $.ajax({
			url: '/blankShop/frontEnd/products/orderByPrice',                        
			type: 'GET',                    
			dataType:'json',
			error: function (xhr, status, error) { 
				console.log(error);
			},    
			success: function (data) {
				

				$('#shop-1').pagination({
					pageSize:9,
					dataSource: data,
					showNavigator: true,
					formatNavigator: '第<\%= currentPage %>頁，共<\%= totalPage %>頁，共<\%= totalNumber %>項結果',
					callback: function (data, pagination) {
			
								var html = "";
								$.each(data, function (index, item) {
					
									var pdName=item.productName;
									var pdPrice=item.productPrice;
									var pdSalePrice=item.salePrice;
					
									if(pdSalePrice=="0"){
										pdSalePrice=pdPrice;
										pdPrice="";
									}
					
									pdSalePrice="NT$ "+pdSalePrice;
									if(pdPrice!=""){
										pdPrice="NT$ "+pdPrice;
									}
					
					
									var pdGenre=item.genre;
									var pdLink="/blankShop/frontEnd/product/"+item.productID;
									var pdImg=item.productImgDir1;
					
									html += `
									<div class="col-xl-4 col-md-6 col-lg-6 col-sm-6">
										<div class="ht-product ht-product-action-on-hover ht-product-category-right-bottom mb-30">
																<div class="ht-product-inner">
																	<div class="ht-product-image-wrap">
																		<a href="\${pdLink}" class="ht-product-image"> <img src="\${pdImg}" alt="Universal Product Style"> </a>
																		<div class="ht-product-action">
																			<ul>
																				<li><a href="#" data-toggle="modal" data-target="#exampleModal"><i class="sli sli-magnifier"></i><span class="ht-product-action-tooltip">Quick View</span></a></li>
																			</ul>
																		</div>
																	</div>
																	<div class="ht-product-content">
																		<div class="ht-product-content-inner">
																			<div class="ht-product-categories"><a href="#">\${pdGenre}</a></div>
																			<h4 class="ht-product-title"><a href="\${pdLink}">\${pdName}</a></h4>
																			<div class="ht-product-price">
																				<span class="new">\${pdSalePrice}</span>
																				<span class="old">\${pdPrice}</span>
																			</div>
																		</div>
																		<div class="ht-product-action">
																			<ul>
																				<li><a href="#"><i class="sli sli-magnifier"></i><span class="ht-product-action-tooltip">Quick View</span></a></li>
																			</ul>
																		</div>
																	</div>
																</div>
										</div>
									</div>
									`;
								});
								
								$('#dataContainer1').html(html);
			
					}
				})


				$('#shop-2').pagination({
					pageSize:4,
					dataSource: data,
					showNavigator: true,
					formatNavigator: '第<\%= currentPage %>頁，共<\%= totalPage %>頁，共<\%= totalNumber %>項結果',
					callback: function (data, pagination) {

			
								var html = "";
								$.each(data, function (index, item) {
					
									var pdName=item.productName;
									var pdPrice=item.productPrice;
									var pdSalePrice=item.salePrice;
					
									if(pdSalePrice=="0"){
										pdSalePrice=pdPrice;
										pdPrice="";
									}
					
									pdSalePrice="NT$ "+pdSalePrice;
									if(pdPrice!=""){
										pdPrice="NT$ "+pdPrice;
									}
					
					
									var pdGenre=item.genre;
									var pdLink="/blankShop/frontEnd/product/"+item.productID;
									var pdImg=item.productImgDir1;
									var pdDis=item.productDiscription1;
					
									html += `
									<div
											class="shop-list-wrap shop-list-mrg2 shop-list-mrg-none mb-30">
											<div class="row">
												<div class="col-lg-4 col-md-4">
													<div class="product-list-img">
														<a href="\${pdLink}"> <img
															src="\${pdImg}"
															alt="Universal Product Style">
														</a>
														<div class="product-quickview">
															<a href="#" title="Quick View" data-toggle="modal"
																data-target="#exampleModal"><i
																class="sli sli-magnifier-add"></i></a>
														</div>
													</div>
												</div>
												<div class="col-lg-8 col-md-8 align-self-center">
													<div class="shop-list-content">
														<h3>
															<a href="\${pdLink}">\${pdName}</a>
														</h3>
														\${pdDis}
														<span>\${pdGenre}</span>
														<div class="shop-list-price-action-wrap">
															<div class="shop-list-price-ratting">
																<div class="ht-product-list-price">
																	<span class="new">\${pdSalePrice}</span> <span class="old">\${pdPrice}</span>
																</div>
															</div>
															<div class="ht-product-list-action">
																<a class="list-cart" title="Add To Cart" href="\${pdLink}"><i
																	class="sli sli-eye"></i>檢視商品</a>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									`;
								});
								
								$('#dataContainer2').html(html);
			
					}
				})


			}
		});

			}
		}
	)

	
	
	</script>

	


</body>

</html>