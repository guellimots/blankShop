<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="Utf-8">
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<title>Query and update Member</title>
<link rel="stylesheet" href="/blankShop/css/backEnd/adminlte.min.css">
<link rel="stylesheet"
	href="/blankShop/plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="/blankShop/plugins/uplot/uPlot.min.css">

<script src="/blankShop/js/backEnd/jquery-3.5.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/blankShop/js/backEnd/jquery.dataTables.min.js"></script>

<link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />
<script src="/blankShop/js/backEnd/jquery.dataTables.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
</style>

</head>
<body>
	<div class="card card-warning">
		<div class="card-header">
			<h3 class="card-title">會員查詢與維護</h3>
		</div>

		<hr>
		<table class="dataTable cell-border stripe" id="MemberList" style="width: 100%">
			<thead class="thead-light">
				<tr>
					<th>會員編號</th>
					<th>姓名</th>
					<th>生日</th>
					<th>電話</th>
					<th>住址</th>
					<th>電子郵件</th>
				</tr>
			</thead>
		</table>


		<script type="text/javascript">
		$(function(){

			if ("${msg}".length > 0)
				swal("資料變更成功!!", "", "success", {button : "確定"})
		})
		
		//創建TABLE

		$(function() {
			$('#MemberList').DataTable(
						{
							"destroy" : true,
							"sAjaxSource" : "/blankShop/mem/showAllMembers",
							"sAjaxDataProp" : "",
							"order" : [ [ 3, "desc" ] ],
							"columnDefs" : [ {
								targets : 0,
								render : function(data) {
									return "<a href=../mem/updateMem/"+data+">"
											+ data + "</a>"
								}
							} ],
							"aoColumns" : [ {
								"mData" : "memberId"
							}, {
								"mData" : "memberName"
							}, {
								"mData" : "birthday"
							}, {
								"mData" : "cellNumber"
							}, {
								"mData" : "address"
							}, {
								"mData" : "email"
							}, ]
						});
			});

			
		</script>
	</div>
</body>
</html>