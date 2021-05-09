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
            <div class="breadcrumb-area pt-35 pb-35 bg-gray">
                <div class="container">
                    <div class="breadcrumb-content text-center">
                        <ul>
                            <li><a href="index.html">Home</a></li>
                            <li class="active">login / register</li>
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
                                                    <input class="col-6" type="text" id="user-name" name="user-name"
                                                        placeholder="Username" onblur=checkName()><span
                                                        id="verifyNameResult"></span>
                                                    <P>1.不可空白 2.至少兩個字以上 3.必須全部為中文字</P>
                                                    <input class="col-6" id="password" type="password"
                                                        name="user-password" placeholder="Password"
                                                        onblur=checkPassword()> <span id="verifyPasswordResult"></span>
                                                    <P>1.不可空白 2.至少6個字且必須包含英文字母、數字、特殊字元(!@#$%^&*)</P>
                                                    <input class="col-6" id="user-email" name="user-email"
                                                        placeholder="Email" type="text" onblur=checkEmail()>
                                                    <span id="verifyEmailResult"></span>
                                                    <span style="color:red">${errormsg.msg}</span>
                                                    <P>1.不可空白 2. 須符合email格式</P>

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
                $("#user-name").val("王曉明");
                $("#password").val("12@abc");
                $("#user-email").val("123@gmail.com");

            });

            $('#btn1').mousedown(function () {
                var abc = "${alertmsg}"
                if (abc == "good") {
                   
                    swal("帳號已經註冊過", "", "error", { button: '確定', timer: 2000 });
                    setTimeout(function () { $('#send1').submit(); }, 2000);

                    abc == "";

                }


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