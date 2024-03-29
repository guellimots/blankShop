<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="shortcut icon" type="image/x-icon" href="/blankShop/assets/img/favicon.png">
<link rel="stylesheet" href="/blankShop/css/backEnd/login.css">
<script  src="/blankShop/js/backEnd/login/login.js"></script>
<script  src="/blankShop/js/backEnd/login/inputdata.js"></script>
<title>BlankShop後台系統</title>
</head>
<body>
	<div class="login-wrapper">
		<form action="BlankShop_Admin" class="form">
			<img src="/blankShop/img/backEnd/favicon.png">
			<h2>BlankShop後台管理系統</h2>
			<div class="input-group">
				<input type="text" name="account" id="loginUser" required> 
				<label for="loginUser">帳號</label>
			</div>
			<div class="input-group">
				<input type="password" name="password" id="loginPassword" required>
				<label for="loginPassword">密碼</label>
			</div>
			<input type="checkbox" onclick="myFunction()">顯示密碼
			<p>${errormsg.msg}</p> 
			<input type="submit" value="登入" class="submit-btn">
			<input type="button" id="manager" value="主管">
			<input type="button" id="employee1" value="員工1">
			<input type="button" id="employee2" value="員工2">
		</form>
	</div>	
	
</body>

</html>