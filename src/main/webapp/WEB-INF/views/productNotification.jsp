<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<!DOCTYPE html>
		<html>

		<head>
			
			<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
			<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>


			<!-- include libraries(jQuery, bootstrap) -->
			<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
			<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
			<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

			<!-- include summernote css/js -->
			<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
			<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>


			<link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />
			<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
			<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
			<!-- <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script> -->
			<script src="/blankShop/js/backEnd/jquery.dataTables.min.js"></script>
			<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		

			<meta charset="UTF-8">
			<style>


				.inputBar{
					width: 80px;
					float: left;
					margin-right: 15px ;

				}
				.inputlabel{
					width: 50px;
					float: left;
				}
				#dis1{
					margin: auto;
					width: 400px;
					height: 100px;
					float: left;
					text-align: left;
					padding-left: 200px;
				}
				#dis2{
					margin: auto;
					width: 400px;
					height: 100px;
					float: right;
					text-align: left;
					padding-right: 200px;
				}
				label,
				input {
					display: block;
				}

				input.text {
					margin-bottom: 12px;
					width: 95%;
					padding: .4em;
				}

				fieldset {
					padding: 0;
					border: 0;
					margin-top: 25px;
				}

				h1 {
					font-size: 1.2em;
					margin: .6em 0;
				}
				

				div#users-contain {
					width: 350px;
					margin: 20px 0;
				}

				div#users-contain table {
					margin: 1em 0;
					border-collapse: collapse;
					width: 100%;
				}

				div#users-contain table td,
				div#users-contain table th {
					border: 1px solid #eee;
					padding: .6em 10px;
					text-align: left;
				}

				.ui-dialog .ui-state-error {
					padding: .3em;
				}

				.validateTips {
					border: 1px solid transparent;
					padding: 0.3em;
				}
			/* #productTable_wrapper{
				width: 800px;
				
			} */
			</style>
			<title>Insert title here</title>
		</head>

		<body>



			<table id="productTable" class="dataTable cell-border stripe hover" style="width: 100%">
				<thead>
					<tr>

						
						<th>型別編號</th>
						<th>產品名稱</th>
						<th>色碼</th>
						<th>尺寸</th>	
						<th>價格</th>
						<th>促銷價格</th>
						<th>子分類</th>
						<th>用途</th>
						<th>庫存</th>
						
					

					</tr>
				</thead>



				


			
			</table>
			<div style="text-align: center;" id="previewDialog" >
				<h1 id="ptitle"></h1>
				<img id="img1" width="200" height="300">
				<img id="img2" width="200" height="300">
				<img id="img3" width="200" height="300">
				<hr>
				<div id="dis1"></div>
				<div id="dis2"></div>
			</div>
			
			
	

			<div id="dialog-form" title="增加庫存">
			

				<form id="updateForm">
					<fieldset>
						<label for="typeId">編號</label> 
						<input readonly type="text" name="typeId" id="typeId" value="" class="text ui-widget-content ui-corner-all">
			
						<label for="stockNumber">庫存</label>
						<input type="number" min="0" name="stockNumber" id="stockNumber" value="" class="text ui-widget-content ui-corner-all">

						<input type="submit" tabindex="-1" style="position: absolute; top: -1000px">
					</fieldset>
				</form>
			</div>


			
		

		</body>

		<!-- Script-->
		
		<script type="text/javascript">

		
			//創建TABLE
			$(function () {


					$('#snpd1').summernote();
					$('#snpd2').summernote();
					$('#editsnpd1').summernote();
					$('#editsnpd2').summernote();

					
					$('#productTable').DataTable({
						
						"destroy": true,
						"sAjaxSource": "/blankShop/backEnd/productNotification",
						"sAjaxDataProp": "",
						"rowId":"typeId",
						"order": [[1, "desc"]],
						"columnDefs": [
							{ targets: 2,
							render: function(data) {
								return "<div style='background-color:" +data+"'>&emsp;</div>"
								}
							}   
						],
						"aoColumns": [ {
							"mData": "typeId"
						}, {
							"mData": "productName"
						}, {
							"mData": "colorCode",
						
						}, {
							"mData": "size"
						}, {
							"mData": "productPrice"
						}, 
						
						  {
							"mData": "salePrice"
						},  
						{
							"mData": "genre"
						},

						{
							"mData": "purpose"
						},
						{
							"mData": "stockNumber"
						}, 

						],

						
					});
					
					
				
				
				var selectId ;
				var table = $('#productTable').DataTable();
				
				var dialog, form


				//更新單一商品
				function editProduct() {

					var formdata = new FormData($('#updateForm')[0]);

					$.ajax({
						url: '/blankShop/backEnd/productstock/'
							+ $('#typeId').val(),
						type: 'PUT',
						datatype: 'json',
						data: formdata,
						cache: false,
						traditional: true,
						contentType: false,
						processData: false,
						success: function (data) {

							swal({
									icon: 'success',	
									title: data.msg,
									showConfirmButton: false,
									timer: 2000
									});
							
							form[0].reset();
							dialog.dialog("close");
							table.ajax.reload()
							parent.sendMessage()
							
						},
						error: function () {
							alert("err!!!")
						}
					});
					

				}
				//更新表單樣式
				dialog = $("#dialog-form").dialog({
					autoOpen: false,
					height: 300,
					width: 400,
					modal: true,
					resizable:false,

					buttons: {
						"修改": editProduct,
						"取消": function () {
							dialog.dialog("close");
						}
					},
					close: function () {
						form[0].reset();

					}
				});

				form = dialog.find("form").on("submit",
					function (event) {
						event.preventDefault();
						editProduct();
						Form[0].reset();
						dialog.dialog("close");



					});


					//滑動預覽圖片
					var preSelectId ;


					$('#previewDialog').on('mouseenter',function(){
						previewDialog.dialog("open");
						previewDialog.dialog( "option", "maxWidth", 900 );

					})


					$('#previewDialog').on('mouseleave',function(){
						preSelectId = null
						
						previewDialog.dialog("close");

					})

					
					$('#productTable').on('mouseenter','tbody tr td:nth-child(2)',function () {	
						preSelectId = $(this).parent().attr("id")
						console.log(preSelectId)
		
						previewDialog.dialog("open");
						previewDialog.dialog( "option", "maxWidth", 900 );
					})
					$('#productTable').on('mouseleave','tbody  tr td:nth-child(2)',function () {	
						preSelectId = null
						
						previewDialog.dialog("close");
						
					
					})
					//預覽的dialog



					var previewDialog,previewDiv
					previewDialog = $("#previewDialog").dialog({
					autoOpen: false,
					height: 750,
					width: 900,
					modal: false,
					resizable:false,
					open:function(){
					
						
						$(".ui-dialog-titlebar-close").hide();
						
					
						$.ajax({
						url: "/blankShop/backEnd/product/"
							+ preSelectId,
						type: "GET",
						dataType: "json",
						success: function (data) {
					$('#ptitle').html(data["productName"])		
					$('#img1').attr("src","../../"+data["productImgDir1"])
					$('#img2').attr("src","../../"+data["productImgDir2"])
					$('#img3').attr("src","../../"+data["productImgDir3"])
					$("#dis1").html(data["productDiscription1"])
					$("#dis2").html(data["productDiscription2"])
					
						}

					})
						
					}
					
				});

				// 雙擊增加庫存

					$('#productTable').on('dblclick','tbody tr',function () {	
						selectId = $(this).attr("id")
							
						$(".ui-dialog-titlebar-close").show();
					
					
						dialog.dialog("open");
						dialog.dialog( "option", "maxWidth", 900 );
					$.ajax({
						url: "/blankShop/backEnd/product/"
							+ selectId,
						type: "GET",
						dataType: "json",
						success: function (data) {
							$('#typeId').val(data["typeId"]);
							$('#stockNumber').val(data["stockNumber"]);	
																		
						}

					})
				
			
				
				})




					
			});

		</script>




		</html>