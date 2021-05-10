<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <html>

  <head>
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:400,400i,700,900&display=swap" rel="stylesheet">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="google-signin-client_id" content="528857856428-o80ljruk3qsht7gpqbmvnk49r9k5s8ca.apps.googleusercontent.com">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- <META HTTP-EQUIV="REFRESH" CONTENT="3;URL=http://localhost:8080/blankShop/frontEnd/welcome"> -->
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
  <style>
    .body {
      text-align: center;
      padding: 40px 0;
      background: #EBF0F5;
    }

    .h1 {
      color: #88B04B;
      font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
      font-weight: 900;
      font-size: 40px;
      margin-bottom: 10px;
    }

    .p {
      color: #404F5E;
      font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
      font-size: 20px;
      margin: 0;
    }

    .i {
      color: #9ABC66;
      font-size: 100px;
      line-height: 200px;
      margin-left: -15px;
    }

    .card {
      background: white;
      padding: 60px;
      border-radius: 4px;
      box-shadow: 0 2px 3px #C8D0D8;
      display: inline-block;
      margin: 0 auto;
    }
    button.big-button {
   padding: 1em 2em;
   border: 2px solid var(--colorShadeA);
  border-radius: 1em;
  background: var(--colorShadeE);
transform-style: preserve-3d;
   transition: all 175ms cubic-bezier(0, 0, 1, 1);
}
:root {
  
  --colorShadeA: rgb(106, 163, 137);
  --colorShadeB: rgb(121, 186, 156);
  --colorShadeC: rgb(150, 232, 195);
  --colorShadeD: rgb(187, 232, 211);
  --colorShadeE: rgb(205, 255, 232);
}
@import url("https://fonts.googleapis.com/css?family=Open+Sans:400,400i,700");
* {
  box-sizing: border-box;
}
*::before, *::after {
  box-sizing: border-box;
}
button {
  position: relative;
  display: inline-block;
  cursor: pointer;
  outline: none;
  border: 0;
  vertical-align: middle;
  text-decoration: none;
  font-size: 0.8rem;
    color:var(--colorShadeA);
  font-weight: 700;
  text-transform: uppercase;
  font-family: inherit;
}

button.big-button::before {
  position: absolute;
  content: '';
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: var(--colorShadeC);
  border-radius: inherit;
    box-shadow: 0 0 0 2px var(--colorShadeB), 0 0.75em 0 0 var(--colorShadeA);
 transform: translate3d(0, 0.75em, -1em);
     transition: all 175ms cubic-bezier(0, 0, 1, 1);
}


button.big-button:hover {
  background: var(--colorShadeD);
  transform: translate(0, 0.375em);
}

button.big-button:hover::before {
  transform: translate3d(0, 0.75em, -1em);
}

button.big-button:active {
            transform: translate(0em, 0.75em);
}

button.big-button:active::before {
  transform: translate3d(0, 0, -1em);
  
      box-shadow: 0 0 0 2px var(--colorShadeB), 0 0.25em 0 0 var(--colorShadeB);

}
  </style>

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
    <div class="body">
    <div class="card">
      <div style="border-radius:200px; height:200px; width:200px; background: #F8FAF5; margin:0 auto;">
        <i class="checkmark i">✓</i>
      </div>
      <h1 class="h1">Success</h1>
      <p class="p">付款成功<br /><br>感謝您的支持及購買!</p>
      <br>
      <button class="big-button" onclick="location.href='/blankShop/frontEnd/showmem'">回到歷史訂單</button>
    </div>
    <!-- style="width: 20px ;height: 40px;" -->
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
    <script>
      var cartItemsObj = JSON.parse(localStorage.getItem('cartItems'));
      
      for(var i =0;i<cartItemsObj.length;i++)
      {
        var data = { typeId:cartItemsObj[i].typeId, 
          price: cartItemsObj[i].price, amount:cartItemsObj[i].amount, paymentInfo:"${paymentId}", ezShip:"${description}"};

          $.ajax({
        url: "/blankShop/frontEnd/insertOrders",   //後端的URL
        type: "POST",   //用POST的方式
        dataType: "json",   //response的資料格式
        cache: false,   //是否暫存
        data: data, //傳送給後端的資料
        success: function (response) {
          console.log(response);  //成功後回傳的資料
          
        }
      });
      }
      //$("#1").attr("value", localStorage.getItem('totalPrice'));
      localStorage.clear();
    </script>

    	<!-- jQuery JS -->
	<script src="/blankShop/assets/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="/blankShop/js/frontEnd/ShopCart-Header.js"></script>
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
	<script src="/blankShop/assets/js/header.js"></script>


  
  </body>

  </html>