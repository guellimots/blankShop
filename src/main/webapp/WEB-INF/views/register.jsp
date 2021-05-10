<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>會員註冊</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <!-- CSS
	============================================ -->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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

        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    </head>

<body>
    <div class="wrapper">
        <header class="header-area sticky-bar">
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
													<li><a href="/blankShop/frontEnd/loginPage">登入</a></li>
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
                            <li><a href="/blankShop/frontEnd/index">Home</a></li>
                            <li class="active">註冊</li>
                        </ul>
                    </div>
                </div>

            </div>
            <div class="login-register-area pt-100 pb-100">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-md-12 ml-auto mr-auto">
                            <div class="login-register-wrapper">
                                <div class="login-register-tab-list nav">
                                    <a data-toggle="tab" href="#lg2">
                                        <h4>註冊</h4>
                                    </a>
                                </div>
                                <div class="tab-content">
                                    <div id="lg2" class="tab-pane active">
                                        <div class="login-form-container">
                                            <div class="login-register-form">
                                                <form action="register" method="post" id="send1">
                                                    <input class="col-6" id="user-email" name="user-email"
                                                        placeholder="Email" type="text" onblur=checkEmail()>
                                                    <span id="verifyEmailResult"></span>
                                                    <span style="color:red">${errormsg.msg}</span>
                                                    <P>1.不可空白 2. 須符合email格式</P>
                                                    <input class="col-6" type="text" id="user-name" name="user-name"
                                                        placeholder="name" onblur=checkName()><span
                                                        id="verifyNameResult"></span>
                                                    <P>1.不可空白 2.至少兩個字以上 3.必須全部為中文字</P>
                                                    <input class="col-6" id="password" type="password"
                                                        name="user-password" placeholder="Password"
                                                        onblur=checkPassword()> <span id="verifyPasswordResult"></span>
                                                    <P>1.不可空白 2.至少6個字且必須包含英文字母、數字、特殊字元(!@#$%^&*)</P>
                                                    

                                                    <div class="button-box">
                                                        <button id="btn1" type="submit">註冊</button>

                                                        <button type="reset">清除</button>

                                                        <button type="button" id="oneClickInput">一鍵輸入</button>

                                                    </div>

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
        <!-- All JS is here -->
        <script>
             
            function checkName() {

                let nameValue = document.getElementById("user-name").value;
                let resultSpan = document.getElementById("verifyNameResult");

                if (nameValue == "") {
                    resultSpan.style.color = "brown";
                    resultSpan.innerHTML = "\u2716 姓名不可為空白";
                }
                else if (nameValue.length >= 2) {
                    let flag = true;
                    for (let i = 0; i < nameValue.length; i++) {
                        let charUni = nameValue.charCodeAt(i);
                        if ((charUni < 0x4E00) || (charUni > 0x9FFF)) {
                            resultSpan.style.color = "brown";
                            resultSpan.innerHTML = "\u2716 姓名須皆為中文字";
                            flag = false;
                            break;
                        }
                    }

                    if (flag) {
                        resultSpan.style.color = "green";
                        resultSpan.innerHTML = "\u25EF 格式正確";
                    }
                }
                else {
                    let charUni = nameValue.charCodeAt(0);
                    if (((charUni < 0x4E00) || (charUni > 0x9FFF))) {
                        resultSpan.style.color = "brown";
                        resultSpan.innerHTML = "\u2716 姓名須至少為兩個字且須為中文字";
                    }
                    else {
                        resultSpan.style.color = "brown";
                        resultSpan.innerHTML = "\u2716 姓名須至少為兩個字";
                    }
                }
            }

            function checkPassword() {

                let re = /^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)(?=.*[!@#$%^&*]+.*).{6,}$/;

                let passwordValue = document.getElementById("password").value;
                let resultSpan = document.getElementById("verifyPasswordResult");

                if (passwordValue == "") {
                    resultSpan.style.color = "brown";
                    resultSpan.innerHTML = "\u2716 密碼不可為空白";
                }
                else if (passwordValue.length >= 6) {
                    if (re.test(passwordValue)) {
                        resultSpan.style.color = "green";
                        resultSpan.innerHTML = "\u25EF 格式正確";
                    }
                    else {
                        resultSpan.style.color = "brown";
                        resultSpan.innerHTML = "\u2716 格式錯誤";
                    }

                }
                else {
                    resultSpan.style.color = "brown";
                    resultSpan.innerHTML = "\u2716 密碼長度須至少為6";
                }

            }
            function checkEmail() {

                let theEmail = document.getElementById("user-email").value;
                let resultSpan = document.getElementById("verifyEmailResult");
                //建立RegExp物件語法 2
                let re = /^.+@.+\..{2,3}$/;
                //建立RegExp物件語法 1
                if (theEmail == "") {
                    resultSpan.style.color = "brown";
                    resultSpan.innerHTML = "\u2716 email不可為空白";
                }

                if (re.test(theEmail)) {
                    resultSpan.style.color = "green";
                    resultSpan.innerHTML = "\u25EF 格式正確";
                }
                else {
                    resultSpan.style.color = "brown";
                    resultSpan.innerHTML = "\u2716 不符合email格式";
                }

            }
            //一鍵輸入
            $("#oneClickInput").click(function () {
                $("#user-name").val("王小明");
                $("#password").val("123qwe!");
                $("#user-email").val("blankshopcompany@gmail.com");

            });
            
            // $('#btn1').mousedown(function () {
              
				
                    
                if ("fail" == "${alertmsg}"){
                    
                    swal("帳號已經註冊過", "", "error", { button: '確定', timer: 2000 });
                   // setTimeout(function () { $('#send1').submit(); }, 2000);

                }
                if ("good"=="${alertmsg}")
                    {
                    swal("註冊成功", "", "success", { button: '確定', timer: 2000 });
                    setTimeout(function () { 
						$('#send1').submit(); 
						window.location.href='/blankShop/frontEnd/loginPage';
					}, 2000);
					
					//url("/frontEnd/loginPage")
              
                }
				

            // })
        </script>

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