<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>BlankShop</title>
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
</head>

<body>

	<div class="wrapper">
		<header class="header-area sticky-bar">
			<div class="main-header-wrap">
				<div class="container">
					<div class="row">
						<div class="col-xl-2 col-lg-2">
							<div class="logo pt-40">
								<a href="/blankShop/frontEnd/indexPage"> <img
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
										<span class="icon-cart"> <i class="sli sli-bag"></i> <!-- <span class="count-style">2</span> -->
										</span>
										<!-- <span class="cart-price">
                                            $320.00
                                        </span> -->
									</button>
									<div class="shopping-cart-content">
										<div class="shopping-cart-top">
											<h4>購物車</h4>
											<a class="cart-close" href="#"><i class="sli sli-close"></i></a>
										</div>
										<ul>
											<li class="single-shopping-cart">目前購物車內無任何商品</li>
										</ul>
										<div class="shopping-cart-bottom">
											<div class="shopping-cart-total">
												<h4>
													總計 : <span class="shop-total">NT$ 0</span>
												</h4>
											</div>
											<div class="shopping-cart-btn btn-hover text-center">
												<a class="default-btn" href="#">結帳</a> <a
													class="default-btn" href="#">檢視購物車</a>
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
												<h4>會員帳號</h4>
												<ul>
													<li><a href="/blankShop/frontEnd/tranToRegister">註冊</a></li>
													<li><a href="#">登入</a></li>
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
								<a href="/blankShop/frontEnd/indexPage"> <img alt=""
									src="/blankShop/assets/img/logo/logo.png" width="100px">
								</a>
							</div>
						</div>
						<div class="col-6">
							<div class="header-right-wrap">
								<div class="cart-wrap">
									<button class="icon-cart-active">
										<span class="icon-cart"> <i class="sli sli-bag"></i> <!-- <span class="count-style">2</span> -->
										</span>
										<!-- <span class="cart-price">
                                            $320.00
                                        </span> -->
									</button>
									<div class="shopping-cart-content">
										<div class="shopping-cart-top">
											<h4>購物車</h4>
											<a class="cart-close" href="#"><i class="sli sli-close"></i></a>
										</div>
										<ul>
											<li class="single-shopping-cart">目前購物車內無任何商品</li>
										</ul>
										<div class="shopping-cart-bottom">
											<div class="shopping-cart-total">
												<h4>
													總計 : <span class="shop-total">NT$ 0</span>
												</h4>
											</div>
											<div class="shopping-cart-btn btn-hover text-center">
												<a class="default-btn" href="#">結帳</a> <a
													class="default-btn" href="#">檢視購物車</a>
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
								<li class="menu-item-has-children"><a href="index.html">全部商品</a>
									<ul class="dropdown">
										<li><a href="index.html">上衣</a></li>
										<li><a href="index-2.html">襯衫</a></li>
										<li><a href="index-3.html">褲裝</a></li>
										<li><a href="index-3.html">裙裝</a></li>
									</ul></li>
								<li><a href="shop.html">最新商品</a></li>
								<li><a href="shop.html">特價商品</a></li>
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
								<li><a href="#">登入</a></li>
								<li><a href="#">註冊</a></li>
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
						<li class="active">login</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="login-register-area pt-100 pb-100">
			<div class="container">
				<div class="row">
					<div class="col-lg-7 col-md-12 ml-auto mr-auto">
						<div class="login-register-wrapper">
							<div class="login-register-tab-list nav">
								<a class="active" href="#">
									<h4>login</h4>
								</a>
							</div>
							<div class="tab-content">
								<div id="lg1" class="tab-pane active">
									<div class="login-form-container">
										<div class="login-register-form">
											<form action="/blankShop/frontEnd/checkLogin" method="post">
												<h6 class="loginHeader">■ 使用會員帳號登入</h6>
												<hr class="loginHeaderLine">
												<span style="color: #E74C3C; font-size: 8px">${accrountErr.msg}</span>
												<br> <span style="color: #E74C3C; font-size: 8px">${recaptchaErr.msg}</span>
												<br> <br> <input type="hidden" id="recaptchaToken"
													value="" name="recaptchaToken"> <input type="text"
													name="email" id="email" placeholder="email" required
													onblur="fillOutPassword()"> <input type="password"
													name="password" id="password" placeholder="password"
													required>
												<div class="g-recaptcha"
													data-sitekey="6LciCrYaAAAAAOSugzyB-PF4jKeGTfRt15zyo_gZ"
													data-callback="saveToken"></div>
												<div class="button-box">
													<div class="login-toggle-btn">
														<input type="checkbox" name="rememberMe" id="rememberMe">
														<label>記住密碼</label> <a href="/blankShop/frontEnd/transToForgetPassword">忘記密碼？</a>
													</div>
													<button type="submit">登入</button>

												</div>
												<br> <br> <br>
												<h6 class="loginHeader">■ 使用Google帳號登入</h6>
												<hr class="loginHeaderLine">
												<br>
												<div class="g-signin2" data-onsuccess="onSignIn"></div>
											</form>
										</div>
									</div>
								</div>
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
							<a href="#">
								<li class="sli sli-social-facebook"></li>
							</a>
							<a href="#">
								<li class="sli sli-social-instagram"></li>
							</a>
							<a href="#">
								<li class="sli sli-social-youtube"></li>
							</a>
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
	<script src="/blankShop/assets/js/main.js"></script>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<script src="https://www.google.com/recaptcha/api.js" async defer></script>

	<script>
		function saveToken(token) {

			var responseJson;
			var tokenValue = document.getElementById('recaptchaToken');
			tokenValue.value = token;

		}

		function onSignIn(googleUser) {

			var id_token = googleUser.getAuthResponse().id_token;

			var xhr = new XMLHttpRequest();

			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					if (xhr.responseText == "success") {
						window.location
								.replace("/blankShop/frontEnd/welcomePage")
					}
				}
			}

			xhr.open('POST', '/blankShop/frontEnd/googleLoginController', true);
			xhr.setRequestHeader('Content-Type',
					'application/x-www-form-urlencoded');
			xhr.send('idtoken=' + id_token);

			console.log(response);

		}


		function getCookie(name) {
			var value = "; " + document.cookie;
			var parts = value.split("; " + name + "=");
			if (parts.length == 2)
				return parts.pop().split(";").shift();
			else
				return null;
		}

		function fillOutPassword() {
			

			if (document.cookie.indexOf('password') != -1) {
				var password = document.getElementById('password');
				password.value = getCookie('password');
			}

		}
	</script>

</body>

</html>