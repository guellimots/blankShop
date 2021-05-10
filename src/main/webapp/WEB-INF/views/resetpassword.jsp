<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Reset password for member</title>
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
		<div class="main-header-wrap">
			<div class="container">
				<div class="row"></div>
				<div class="single-input-item">
					<br>
					<h3>重設密碼</h3>
					<hr>
					<form action="resetPwdController" method="post">
						<input type="hidden" name="id" value="${MemberBean.memberId}">
						<div class="row">
							<div class="col-lg-6">
								<div class="single-input-item">
									<label for="new-pwd" class="required">Eamil</label> <input
										type="email" id="emial-gary" name="email" value="${useremail}" readonly="readonly" 
										style="background-color: rgb(218, 211, 211)"/>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-6">
								<div class="single-input-item">
									<label for="new-pwd" class="required">新密碼</label> <input
										type="text" id="pwd" name="new-pwd" />
								</div>
							</div>
							<div class="col-lg-6">
								<div class="single-input-item">
									<label for="confirm-pwd" class="required">密碼確認</label> <input
										type="text" id="checkPwd" name="confirm-pwd" /> <span
										id="checkPwdMsg"></span>
								</div>
							</div>
						</div>
						<hr>
						<button type="submit" class="btn btn-secondary">修改密碼</button>
					</form>
				</div>
			</div>
		</div>
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
	<script>
		document.getElementById("checkPwd").addEventListener("focus", checkPwd);
		document.getElementById("checkPwd").addEventListener("blur", checkPwd);
		function checkPwd() {
			if (!$("#checkPwd").val()) {
				$("#checkPwdMsg").text("請輸入新密碼").show();
			} else if ($("#pwd").val() != $("#checkPwd").val()) {
				$("#checkPwdMsg").text("密碼不相符,請再次輸入").show();
			} else {
				$("#checkPwdMsg").text("一樣").show();
			}
		}
	</script>
</body>

</html>