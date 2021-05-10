<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!doctype html>
    <html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
            integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/forget-password.css">
        <title>Forget password</title>
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="/blankShop//blankShop/assets/img/favicon.png">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <!-- CSS============================================ -->



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
        <Style>
            @import url(https://fonts.googleapis.com/css?family=Poppins);

            body {
                font-family: "Poppins", sans-serif;
            }

            .light-blue-gradient {
                background: linear-gradient(120deg, #fffffe 0%, #ffffff 100%);
            }
        </Style>
    </head>

    <body>
        <div class="wrapper">
            <header class="header-area sticky-bar">
                <div class="main-header-wrap">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-2 col-lg-2">
                                <div class="logo pt-40">
                                    <a href="index.html"> <img src="/blankShop/assets/img/logo/logo.png" width="150px"
                                            alt="">
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
                                                </ul>
                                            </li>
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
                                            <span class="icon-cart"> <i class="sli sli-bag"></i>
                                                <!-- <span class="count-style">2</span> -->
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
                                                    <a class="default-btn" href="checkout.html">結帳</a> <a
                                                        class="default-btn" href="cart-page.html">檢視購物車</a>
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
                                                        <li><a href="loginPage">登入</a></li>
                                                        <li><a href="tranToRegister">註冊</a></li>
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
                                    <a href="index.html"> <img alt="" src="/blankShop/assets/img/logo/logo.png"
                                            width="100px">
                                    </a>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="header-right-wrap">
                                    <div class="cart-wrap">
                                        <button class="icon-cart-active">
                                            <span class="icon-cart"> <i class="sli sli-bag"></i>
                                                <!-- <span class="count-style">2</span> -->
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
                                                    <a class="default-btn" href="#">結帳</a> <a class="default-btn"
                                                        href="#">檢視購物車</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mobile-off-canvas">
                                        <a class="mobile-aside-button" href="#"><i class="sli sli-menu"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>

            <div class="login-register-area pt-100 pb-100">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-8 col-md-12 ml-auto mr-auto">
                            <div class="tab-content">
                                <div class="tab-pane active">
                                    <div class="login-register-wrapper">
                                        <div class="login-register-form">
                                            <h3>忘記密碼了嗎?</h3>
                                            <form action="sendEmail" method="Post">
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Email address:</label>
                                                    <input type="email" class="form-control" id="exampleInputEmail1"
                                                        name="email" aria-describedby="emailHelp"
                                                        placeholder="Enter email">
                                                    <small id="emailHelp"
                                                        class="form-text text-muted">請輸入您的e-mail，並到您的信箱點選連結重設您的密碼。</small>
                                                </div>
                                                
                                                    <button type="submit" id="resetpassword"
                                                        class="btn btn-secondary" >送出</button>
                                                    <button type="button" id="btn1" class="btn btn-secondary">我是一鍵輸入</button>
                                               
                                            </form>
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
        <script>
            $("#resetpassword").click(function () {
                swal("請至您的信箱重設密碼", "", "success", { button: '確定' });
            })
            $("#btn1").click(function(){
                $("#exampleInputEmail1").val("blankshopcompany@gmail.com");
            })
           
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