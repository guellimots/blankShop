<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>product</title>
<meta name="google-signin-client_id"
	content="528857856428-o80ljruk3qsht7gpqbmvnk49r9k5s8ca.apps.googleusercontent.com">
<meta name="description" content="">
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
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
								<a href="index.html"> <img
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
						<li><a href="/blankShop/frontEnd/welcomePage">Home</a></li>
						<li class="active">Product Details</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="product-details-area pt-100 pb-95">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-12">
						<div class="product-details-img">
							<div id="gallery" class="product-dec-slider-2 product-tab-left">
								<a  id="pdLink1"
									data-image="${imgList[0]}"
									data-zoom-image="${imgList[0]}">
									<img
									id="pdImg1"
									src="${imgList[0]}"
									alt="">
								</a>
								 <a id="pdLink2"
									data-image="${imgList[1]}"
									data-zoom-image="${imgList[1]}">
									<img
									id="pdImg2"
									src="${imgList[1]}"
									alt="">
								</a> 
								<a  id="pdLink3"
									data-image="${imgList[2]}"
									data-zoom-image="${imgList[2]}">
									<img
									id="pdImg3"
									src="${imgList[2]}"
									alt="">
								</a> 
								<a  id="pdLink4"
									data-image="${imgList[3]}"
									data-zoom-image="${imgList[3]}">
									<img
									id="pdImg4"
									src="${imgList[3]}"
									alt="">
								</a> 
								<a  id="pdLink5"
									data-image="${imgList[4]}"
									data-zoom-image="${imgList[4]}">
									<img
									id="pdImg5"
									src="${imgList[4]}"
									alt="">
								</a>
								<a  id="pdLink6"
									data-image="${imgList[5]}"
									data-zoom-image="${imgList[5]}">
									<img
									id="pdImg6"
									src="${imgList[5]}"
									alt="">
								</a>								
								<a  id="pdLink7"
									data-image="${imgList[6]}"
									data-zoom-image="${imgList[6]}">
									<img
									id="pdImg7"
									src="${imgList[6]}"
									alt="">
								</a>
								<a  id="pdLink8"
									data-image="${imgList[7]}"
									data-zoom-image="${imgList[7]}">
									<img
									id="pdImg8"
									src="${imgList[7]}"
									alt="">
								</a>
								<a  id="pdLink9"
									data-image="${imgList[8]}"
									data-zoom-image="${imgList[8]}">
									<img
									id="pdImg9"
									src="${imgList[8]}"
									alt="">
								</a>

							</div>
							<div class="zoompro-wrap product-zoom-right pl-20">
								<div class="zoompro-span">
									<img class="zoompro"
										src="${imgList[0]}"
										data-zoom-image="${imgList[0]}"
										alt="" />
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-12">
						<div class="product-details-content ml-30 responsive-mrg">
						    <input type="hidden" id="productID" value="${product.productID}"/>
							<input type="hidden" id="memberId" value="${sessionScope.memberId}"/>
							<h2>${product.productName}</h2>
							<div class="product-details-price">
								<span>${product.salePrice} </span> <span class="old">${product.productPrice}</span>
							</div>
							${product.productDiscription1}
							
							<div class="pro-details-size-color">
								<div class="pro-details-color-wrap">
									<span>顏色</span>
									<div class="pro-details-color-content" id="iconsContainer">
										<ul>
										<c:forEach items="${colorList}" var="item">
										 <c:choose>
										  <c:when test="${item=='#ffffff'}">
										    <li style="background-color:${item};border:1px solid #000000;"><input type="hidden" value="${item}"></li>
										  </c:when>
										  <c:otherwise>
										    <li style="background-color:${item};border:1px solid ${item};"><input type="hidden" value="${item}"></li>
										  </c:otherwise>
										 </c:choose>
										</c:forEach >
										</ul>
									</div>
								</div>
								<div class="pro-details-size">
									<span>尺寸</span>
									<div class="pro-details-size-content">
										<ul>
											<li><a href="javascript:;">s</a></li>
											<li><a href="javascript:;">m</a></li>
											<li><a href="javascript:;">l</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="pro-details-size-color">
								<div class="pro-details-color-wrap">
									<div class="pro-details-color-content" id="underlineContainer">
										<ul>
										<c:forEach items="${colorList}" var="item">
										<li></li>
										</c:forEach >
										</ul>
									</div>
								</div>
							</div>
							<div class="pro-details-quality">
								<div class="cart-plus-minus">
									<input id="quantity" class="cart-plus-minus-box" type="text" name="qtybutton"
										value="1">
								</div>
								<div class="pro-details-cart btn-hover" id="addToCart-btn">
									<a href="javascript:;">放入購物車</a>
								</div>
							</div>
							<div class="pro-details-meta">
								<span>分類 :</span>
								<ul>
									<li><a href="#">${product.genre}</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="description-review-area pb-95">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12">
						<div class="description-review-wrapper">
							<div class="description-review-topbar nav">
								<a class="active" data-toggle="tab" href="#des-details1">洗滌注意事項</a>
								<a data-toggle="tab" href="#des-details3">尺寸表</a> <a
									data-toggle="tab" href="#des-details2">評論 (3)</a>
							</div>
							<div class="tab-content description-review-bottom">
								<div id="des-details1" class="tab-pane active">
									<div class="product-description-wrapper">
									    ${product.productDiscription2}
							
									</div>
								</div>
								<div id="des-details3" class="tab-pane">

									<table class="table table-striped">

										以下單位均為公分(cm)
										<thead>
											<tr>
												<th scope="col">尺寸</th>
												<th scope="col">肩寬</th>
												<th scope="col">胸寬</th>
												<th scope="col">衣長</th>
												<th scope="col">袖長</th>
												<th scope="col">手臂</th>
												<th scope="col">下擺</th>
												<th scope="col">腰寬</th>
												<th scope="col">臀寬</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">S</th>
												<td scope="col">33</td>
												<td scope="col">38</td>
												<td scope="col">94</td>
												<td scope="col">39</td>
												<td scope="col">14</td>
												<td scope="col">124</td>
												<td scope="col">30</td>
												<td scope="col">50</td>
											</tr>
											<tr>
												<th scope="row">M</th>
												<td scope="col">35</td>
												<td scope="col">38</td>
												<td scope="col">94</td>
												<td scope="col">40</td>
												<td scope="col">14</td>
												<td scope="col">124</td>
												<td scope="col">30</td>
												<td scope="col">51</td>
											</tr>
											<tr>
												<th scope="row">L</th>
												<td scope="col">36</td>
												<td scope="col">40</td>
												<td scope="col">95</td>
												<td scope="col">41</td>
												<td scope="col">15</td>
												<td scope="col">125</td>
												<td scope="col">33</td>
												<td scope="col">53</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div id="des-details2" class="tab-pane">
									<div class="review-wrapper">
										<%-- <div class="single-review">
											<div class="review-img">
												<img
													src="/blankShop/assets/img/product-details/client-1.jpg"
													alt="">
											</div>
											<div class="review-content">
												<p>“In convallis nulla et magna congue convallis. Donec
													eu nunc vel justo maximus posuere. Sed viverra nunc erat, a
													efficitur nibh”</p>
												<div class="review-top-wrap">
													<div class="review-name">
														<h4>Stella McGee</h4>
													</div>
													<div>
														<i class="sli sli-close delete-msg-btn"> 刪除留言</i>
													</div>
												</div>
											</div>
										</div>
										<div class="single-review">
											<div class="review-img">
												<img
													src="/blankShop/assets/img/product-details/client-2.jpg"
													alt="">
											</div>
											<div class="review-content">
												<p>“In convallis nulla et magna congue convallis. Donec
													eu nunc vel justo maximus posuere. Sed viverra nunc erat, a
													efficitur nibh”</p>
												<div class="review-top-wrap">
													<div class="review-name">
														<h4>Stella McGee</h4>
													</div>
												</div>
											</div>
										</div>
										<div class="single-review">
											<div class="review-img">
												<img
													src="/blankShop/assets/img/product-details/client-3.jpg"
													alt="">
											</div>
											<div class="review-content">
												<p>“In convallis nulla et magna congue convallis. Donec
													eu nunc vel justo maximus posuere. Sed viverra nunc erat, a
													efficitur nibh”</p>
												<div class="review-top-wrap">
													<div class="review-name">
														<h4>Stella McGee</h4>
													</div>
												</div>
											</div>
										</div> --%>
									</div>
									<div class="ratting-form-wrapper">
										<p>
											評論送出將不會顯示您的email。 <span>(*)</span>為必填欄位
										</p>
										<div class="ratting-form">
											<form action="#" id="reviewForm">
												<div class="row">
													<div class="col-md-12">
														<div class="rating-form-style mb-20">
															<label>您的評論 <span>*</span></label>
															<textarea name="Your Review" id="review"></textarea>
														</div>
													</div>
													<div class="col-md-12">
														<div class="rating-form-style mb-20">
															<label>姓名 <span>*</span></label> <input type="text" id="name">
														</div>
													</div>
													<div class="col-md-12">
														<div class="rating-form-style mb-20">
															<label>Email <span>*</span></label> <input type="email" id="email">
														</div>
													</div>
													<div class="col-lg-12">
														<div class="form-submit">
															<input type="submit" value="送出">
														</div>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- <div class="col-lg-4 col-md-4">
                    <div class="pro-dec-banner">
                        <a href="#"><img src="/blankShop/assets/img/banner/banner-15.png" alt=""></a>
                    </div>
                </div> -->
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
	<script src="/blankShop/assets/js/main.js"></script>
	<script src="/blankShop/js/frontEnd/ShopCart-Header.js"></script>
	<script src="/blankShop/assets/js/header.js"></script>
	<script src="/blankShop/assets/js/review.js"></script>

	

	<script>



	    var productID=$("#productID").val();
		var size=null;
		var colorCode=null;
	

		$("#iconsContainer li").click(
				function() {
					colorCode=$(this).find('input:first-child').val();
					var changeImgData={productID:productID, colorCode:colorCode};
					var idx = $(this).index();
					$("#underlineContainer li").css("border", "none");
					$("#underlineContainer li").eq(idx).css("border-top","1px solid #000000");
					$.ajax({

						data:JSON.stringify(changeImgData),
					    url:'/blankShop/frontEnd/product/productImg',
					    contentType:"application/json",
					    type:'POST',
					    dataType:'json',
					    error: function (xhr, status, error) { 
				        console.log(error);},
						success:function(data){
							
							$('.zoompro').data("image",data['1']);
							$('.zoompro').data("zoom-image",data['1']);
							$('.zoompro').attr("src",data['1']);
							
							var imgsLink=document.querySelectorAll(".product-dec-slider-2.product-tab-left a");
							var imgs=document.querySelectorAll(".product-dec-slider-2.product-tab-left img");

							for (var i=0; i<9; i++){
								var dataIndex=i+1;
								var dataIndexStr=dataIndex.toString();
								document.getElementById("pdLink"+dataIndexStr).setAttribute('data-image',data[dataIndexStr]);
								document.getElementById("pdLink"+dataIndexStr).setAttribute('data-zoom-image',data[dataIndexStr]);
								document.getElementById("pdImg"+dataIndexStr).setAttribute('src',data[dataIndexStr]);
							}
							
						}
					});

		});

		$(".pro-details-size-content li").click(
				function() {
					var idx = $(this).index();
                    size=$(this).text();
					$(".pro-details-size-content a").css("background-color",
							"#f1f2f6");
					$(".pro-details-size-content a").css("color", "#000000");

					$(".pro-details-size-content a").eq(idx).css(
							"background-color", "#dda769");
					$(".pro-details-size-content a").eq(idx).css("color",
							"#ffffff");

				}

		);

		$("#addToCart-btn").click(

			function(){

                var quantity=$("#quantity").val();
				var checkObj ={productID:productID, size:size, colorCode:colorCode, quantity:quantity};

                if((size==null)||(colorCode==null)){
					Swal.fire({
						icon:'error',
						text:'請選取顏色、尺寸'
					});

				}else{
					$.ajax({
					data:JSON.stringify(checkObj),
					url:'/blankShop/frontEnd/product/checkStock',
					contentType:"application/json",
					type:'POST',
					dataType:'json',
					error: function (xhr, status, error) { 
				    console.log(error);},
					success:function(data){
						if (data.msg=="fail"){
							Swal.fire({
								icon:'error',
								title:'下單數量超過庫存量',
								text:'請勿下單超過'+data.stockNumber+'件'
							});
						}
						else{
							$.ajax({
								data:JSON.stringify(checkObj),
								url:'/blankShop/frontEnd/product/placeInCart',
								contentType:"application/json",
					            type:'POST',
					            dataType:'json',
					            error: function (xhr, status, error) { 
				                    console.log(error);},
							    success:function(result){

									if(localStorage.getItem('cartItems')==null){
										var cartItems=[];
										cartItems.push(result);
										localStorage.setItem('cartItems',JSON.stringify(cartItems));
										location.reload();
										
									}
									else{
										var cartItems=JSON.parse(localStorage.getItem('cartItems'));
										cartItems.push(result);
										localStorage.setItem('cartItems',JSON.stringify(cartItems));
										location.reload();
									}
								}
							})
						}

					  }    
				   });

				}

				
			}

		);

			
		
	</script>



</body>

</html>