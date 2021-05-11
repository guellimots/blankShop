<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!doctype html>
    <html class="no-js" lang="zxx">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Parlo - eCommerce Bootstrap 4 Template</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="google-signin-client_id" content="528857856428-o80ljruk3qsht7gpqbmvnk49r9k5s8ca.apps.googleusercontent.com">    
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="/blankShop/assets/img/favicon.png">

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

        <style>
            .coupon {
                border-radius: 12px;
                box-shadow: 5px 8px 10px #d6d5d533
            }


            .code:hover {
                background: green;
                color: #fff;
                cursor: pointer
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
                                                     <a	class="default-btn" href="#">檢視購物車</a>
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
                            <li>
                                <a href="/blankShop/frontEnd/welcomePage">Home</a>
                            </li>
                            <li class="active">Cart page </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="your-order-area">
                <div class="container-fluid">
                    <h3 class="cart-page-title">購物車</h3>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                            <form action="#">
                                <div class="table-content table-responsive cart-table-content">
                                    <table style="width: 1650px;">
                                        <thead>
                                            <tr>
                                                <th>產品圖片</th>
                                                <th>產品名稱</th>
                                                <th>尺寸</th>
                                                <th>顏色</th>
                                                <th>價格</th>
                                                <th>數量</th>
                                                <th>總價</th>
                                                <th>修改</th>
                                            </tr>
                                        </thead>
                                        <tbody id="cartpage">
                                        </tbody>


                                    </table>
                                </div>
                                
                                <div class="d-flex justify-content-between">
                                    <div class="">
                                        <div class="cart-shiping-update-wrapper">
                                            <div class="cart-shiping-update">
                                                <a href="/blankShop/frontEnd/welcomePage">繼續購物</a>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-3">
                                        <div class="grand-totall" style="margin-top: 8px;">

                                            <h4 class="grand-totall-title">總金額 <span id="summary"></span><span>$</span>
                                            </h4>
                                            <a href="checkout" id="checkout">前往結帳</a>
                                        </div>
                                    </div>
                                </div>
                            </form>

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
        //   localStorage.setItem('cartItems', '[{"memberId":1001,"email":"xxxx@gmail.com","productImg":"/blankShop/img/product/54-1.jpg","typeId":1,"productName":"燈芯絨襯衫","size":"S","color":"#ffffff","price":100,"amount":3},{"productImg":"/blankShop/img/product/49-1.jpg","typeId":2,"productName":"襯衫","size":"M","color":"#daada7","price":300,"amount":1},{"productImg":"/blankShop/img/product/34-1.jpg","typeId":3,"productName":"燈芯","size":"S","color":"#daada7","price":200,"amount":3}]')

            var cartItemsObj = JSON.parse(localStorage.getItem('cartItems'));
            console.log(cartItemsObj)
            var theTbody = document.getElementById("cartpage");
            var summaryAmout = 0;


            for (var i = 0; i < cartItemsObj.length; i++) {

                //tr
                var theHead = document.createElement("tr");
                theHead.setAttribute("id", "tr" + i);
                //產品圖片
                var productImg = document.createElement("td");
                var productImgView = document.createElement("img");
                productImgView.setAttribute("src", cartItemsObj[i].productImg);
                productImgView.style.width = "160px"
                theHead.appendChild(productImgView);

                //產品名稱
                var productName = document.createElement("td");
                theHead.appendChild(productName);
                productName.innerHTML = cartItemsObj[i].productName;
                //尺寸
                var size = document.createElement("td");
                size.innerHTML = cartItemsObj[i].size;
                theHead.appendChild(size);
                //顏色
                var colortd = document.createElement("td");
                var color1 = document.createElement("span");
                color1.style.border = "1.5px solid";
                color1.innerHTML = "&emsp;&emsp;&emsp;";

                color1.style.backgroundColor = cartItemsObj[i].color;
                colortd.appendChild(color1);
                theHead.appendChild(colortd);
                //產品價格
                var price = document.createElement("td");
                price.setAttribute("id", "price" + i);
                theHead.appendChild(price);
                price.innerHTML = cartItemsObj[i].price;

                //產品數量
                var amount = document.createElement("td")
                var amountInput = document.createElement("input");
                amountInput.setAttribute("type", "number");
                amountInput.setAttribute("min", "1");
                amountInput.setAttribute("max", "10");
                amountInput.setAttribute("id", "qty" + i);
                amountInput.setAttribute("value", cartItemsObj[i].amount);
                amountInput.style.width = "60px";
                amountInput.style.textAlign = "center";

                var total = document.createElement("td");
                total.setAttribute("id", "totalAmount" + i);
                total.setAttribute("class", "totalAmout");


                amount.appendChild(amountInput);
                theHead.appendChild(amount);
                //修改數量事件觸發
                amountInput.addEventListener("change", function () {

                    localStorage.setItem("cartItemsObj[getIndex].amount", this.value);
                    var getIndex = parseInt(this.getAttribute("id").replace("qty", ""));
                    var totalAmoutInput = document.getElementById("totalAmount" + getIndex);
                    var tmp = document.getElementById("price" + getIndex);

                    totalAmoutInput.innerHTML = parseInt(this.value) * parseInt(tmp.innerHTML);
                    localStorage.setItem("cartItemsObj[getIndex].amount", this.value);
                    var totalAmountInputs = document.getElementsByClassName("totalAmout");

                    summaryAmout = 0;
                    for (var k = 0; k < totalAmountInputs.length; k++)
                        summaryAmout += parseInt(totalAmountInputs[k].innerHTML);
                    document.getElementById("summary").innerHTML = summaryAmout;

                    //修改數量set到localStorage
                    localStorage.clear();
                    cartItemsObj[getIndex].amount = this.value;
                    localStorage.setItem("cartItems", JSON.stringify(cartItemsObj));

                })

                //單品總價
                var totalprice = cartItemsObj[i].price * cartItemsObj[i].amount;
                total.innerHTML = totalprice;
                summaryAmout += parseInt(totalprice);

                theHead.appendChild(total);
                //刪除按鈕
                var delete1 = document.createElement("td");
                var deletebtn = document.createElement("i");
                deletebtn.setAttribute("id", "del" + i);
                // deletebtn.setAttribute("id", "del"+i+"_"+cartItemsObj[i].ID);
                delete1.appendChild(deletebtn);
                theHead.appendChild(delete1);
                deletebtn.setAttribute("class", "sli sli-close");
                deletebtn.addEventListener("click", function (e) {

                    var getIndex1 = parseInt(e.target.id.replace("del", ""))

                    Swal.fire({
                        title: '確定要刪除此商品嗎?',
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        cancelButtonText: '取消',
                        confirmButtonText: '確認刪除'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            $("#tr" + getIndex1).empty();
                            localStorage.clear();
                            cartItemsObj.splice(getIndex1, 1);
                            console.log(cartItemsObj);
                            localStorage.setItem("cartItems", JSON.stringify(cartItemsObj));
                            location.reload();
                        }
                    }

                    )
                })
                //table+tr
                var br = document.createElement("br");
                theTbody.appendChild(theHead);
                theTbody.appendChild(br)

            }

        </script>
        <script>
            $("#summary").html(summaryAmout);
            $("#checkout").click(function () {
                localStorage.setItem("totalPrice", summaryAmout);

            })

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
        <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
        <script src="/blankShop/assets/js/header.js"></script>
        <script src="/blankShop/js/frontEnd/ShopCart-Header.js"></script>
        

    </body>

    </html>