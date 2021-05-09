<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link rel="stylesheet"
	href="/blankShop/plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="/blankShop/plugins/uplot/uPlot.min.css">
<link rel="stylesheet" href="/blankShop/css/backEnd/adminlte.min.css">
<link rel="stylesheet" href="/blankShop/css/backEnd/advertisting.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="/blankShop/js/backEnd/jquery-3.5.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="/blankShop/js/backEnd/jquery.dataTables.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta charset="UTF-8">
<meta name="keywords" content="html,css,javascript,bootstrap4,jquery,jquery-ui">
<meta name="description" content="EDU 第一組期末專題專案">
<title>輪播牆</title>
</head>
<body>
	<div class="card card-info">
		<div class="card-header">
			<h3 class="card-title">廣告牆詳細資料</h3>
			<div class="card-tools">
				<button type="button" class="btn btn-tool"
					data-card-widget="collapse">
					<i class="fas fa-minus"></i>
				</button>
				<button type="button" class="btn btn-tool" data-card-widget="remove">
					<i class="fas fa-times"></i>
				</button>
			</div>
		</div>
		<div class="card-body">
			<!-- 資料存放區 -->
			<div>
				<table id="imgDetail" class="dataTable display cell-border hover" style="width: 100%">
					<thead>
						<tr>
							<th style='width: 10px'>#</th>
							<th>名稱</th>
							<th>使用狀態</th>
							<th>建立時間</th>
							<th>異動時間</th>
						</tr>
					</thead>
				</table>
			</div>
			<!-- /資料存放區 -->
		</div>
		<!-- /.card-body -->
	</div>
	<div class="card card-success">
		<div class="card-header">
			<h3 class="card-title">圖片瀏覽</h3>

			<div class="card-tools">
				<button type="button" class="btn btn-tool"
					data-card-widget="collapse">
					<i class="fas fa-minus"></i>
				</button>
				<button type="button" class="btn btn-tool" data-card-widget="remove">
					<i class="fas fa-times"></i>
				</button>
			</div>
		</div>
		<div class="card-body" id="showimg">
			<!-- 資料存放區 -->
			<div align="center"><img id="imgInfo" src="" style="width:800px;high:600px;"> </div>
			<!-- /資料存放區 -->
		</div>
		<!-- /.card-body -->
	</div>	
	<div class="card card-danger">
		<div class="card-header">
			<h3 class="card-title">更新廣告狀態</h3>
			<div class="card-tools">
				<button type="button" class="btn btn-tool"
					data-card-widget="collapse">
					<i class="fas fa-minus"></i>
				</button>
				<button type="button" class="btn btn-tool" data-card-widget="remove">
					<i class="fas fa-times"></i>
				</button>
			</div>
		</div>
		
		<div class="card-body" id="updateTitle">
		<form id="updateform">
			<fieldset>
			<label for="id">編號</label> <input type="text" name="id"
				class="form-control" id="id" > <br>
			<label for="title">名稱</label> <input type="text" name="title"
				class="form-control" id="title" > <br>
			<label for="status">狀態</label> 
			<select class="form-control select2" style="width: 100%;" id="status" name="status">
				<option selected="selected"></option>
				<option>Y</option>
				<option>N</option>				
			</select>
			</fieldset>	
		</form>
		<div class="card-footer">
			<button type="submit" class="btn btn-primary" id ="updatebutton">更新</button>
		</div>
		</div>
				
		<!-- /.card-body -->
	</div>		
	<script src="/blankShop/js/backEnd/advertising/findadvertInfo.js"></script>
	<script src="/blankShop/js/backEnd/adminlte.js"></script>
</body>
</html>