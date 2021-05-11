<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link rel="stylesheet" href="/blankShop/plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="/blankShop/plugins/uplot/uPlot.min.css">
<link rel="stylesheet" href="/blankShop/css/backEnd/adminlte.min.css">
<link rel="stylesheet" href="/blankShop/css/backEnd/advertisting.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />

<script src="/blankShop/js/backEnd/jquery-3.5.1.js"></script>
<script src="/blankShop/js/backEnd/jquery.dataTables.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta charset="UTF-8">
<meta name="keywords" content="html,css,javascript,bootstrap4,jquery,jquery-ui">
<meta name="description" content="EDU 第一組期末專題專案">
<title>訂單管理</title>
</head>

<div id="sortable">
	<div class="card card-info" >
		<div class="card-header">
			<h3 class="card-title">訂單查詢結果</h3>
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
			<table id="orderTable" class="dataTable display cell-border hover" style="width: 100%">
					<thead>
						<tr>
							<th style='width: 10px'>#</th>
							<th>訂單編號</th>
							<th>產品編號</th>
							<th>會員編號</th>
							<th>價格</th>
							<th>購買數量</th>
							<th>訂單狀態</th>
							<th>付款資訊</th>
							<th>配送地址</th>
							<th>建立時間</th>
							<th>異動時間</th>
						</tr>
					</thead>
			</table>
			<!-- /資料存放區 -->
			<!-- 會員詳細資料 -->
			<div style="align: center;" id="memberDialog" >
				<h1 id="title"></h1>
				<hr>
				<a>會員編號:</a>&emsp;<span id="disid"></span><br>
				<a>聯絡電話:</a>&emsp;<span id="disphone"></span><br>
				<a>Email:</a>&emsp;<span id="dismail"></span><br>
				<a>地址:</a>&emsp;<span id="disaddress"></span><br>
			</div>
			<!-- /會員詳細資料 -->
			<!-- 產品詳細資料 -->
			<div style="align: center;" id="productDialog" >
				<h1 id="pdname"></h1>
				<hr>
				<a>尺寸:</a>&emsp;<span id="pdsize"></span><br>				
				<a>價格:</a>&emsp; <span id="pdprice"></span><br>
				<a>類型:</a>&emsp; <span id="pdgenre"></span><br>
				<a>促銷價格:</a>&emsp; <span id="pdsalrprice"></span><br>
			</div>
			<!-- /產品詳細資料 -->
		</div>
		<!-- /.card-body -->
	</div>
	<div class="card card-warning">
		<div class="card-header">
			<h3 class="card-title">更新訂單</h3>
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
		
		<div class="card-body" id="updateOrder">
		<form id="updateform">
			<fieldset>
			<label for="orderId">#</label> <input type="text" name="orderIdentity"
				class="form-control" id="pkid" > <br>
			<label for="orderId">訂單編號</label> <input type="text" name="orderId"
				class="form-control" id="id" > <br>
			<label for="orderStatus">狀態</label> 
			<select class="form-control select2" style="width: 100%;" id="status" name="orderStatus">
				<option selected="selected"></option>
				<option>訂單取消</option>
				<option>理貨中</option>
				<option>送貨中</option>
				<option>已送達</option>				
			</select>
			</fieldset>	
		</form>
			<div class="card-footer">
				<button type="submit" class="btn btn-primary" id ="updatebutton">更新</button>
			</div>
		</div>	
		<!-- /.card-body -->
	</div>
</div>
<script src="/blankShop/js/backEnd/order/findorder.js"></script>
<script src="/blankShop/js/backEnd/adminlte.js"></script>
</body>
</html>