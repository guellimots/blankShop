<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="/blankShop/css/backEnd/login.css">
<script type="text/javascript" src="/blankShop/js/backEnd/login.js"></script>
<title>BlankShop後台系統</title>
</head>
<body>
	<div class="login-wrapper">
		<form action="BlankShop_Admin" class="form">
			<img src="/blankShop/img/backEnd/avatar.png">
			<h2>Admin管理系統</h2>
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
		</form>
	</div>
</body>
</html>