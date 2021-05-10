<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<!DOCTYPE html>
		<html>

		<head>
			<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
			<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0/dist/Chart.min.js"></script>
			
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
			<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
			<script src="/blankShop/js/backEnd/jquery.dataTables.min.js"></script>
			<script src="/blankShop/js/backEnd/product/disablebutton.js"></script>
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
			</style>
			<title></title>
		</head>

		<body>


			<button id="downButton">商品下架</button>
			
			

			

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
			<div  width="400" height="400">
				<canvas id="myChart"></canvas>
			</div>
			
		</body>
		
			
		<!-- Script-->
		<script type="text/javascript">
	
		var myChart
			//創建TABLE
			$(function () {
					//產品圖表
							
			
					showProductChart(getProductChart());
					
					$('#snpd1').summernote();
					$('#snpd2').summernote();
					$('#editsnpd1').summernote();
					$('#editsnpd2').summernote();

					
					$('#productTable').DataTable({
						
						"destroy": true,
						"sAjaxSource": "/blankShop/backEnd/product",
						"sAjaxDataProp": "",
						"rowId":"typeId",
						"order": [[0, "desc"]],
						"columnDefs": [
							// { "width": "5%", "targets": 0},
							{ targets: 2,
							render: function(data) {
								return "<div style='background-color:" +data+"'>&emsp;</div>"
								}
							}   
						],
						"aoColumns": [
							
						{
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
					
					
				
				
				var selectId;
				var table = $('#productTable').DataTable();
				//選取單一商品功能
				$('#productTable').on('dblclick','tbody tr',function () {resetSelect()	})


				$('#productTable').on('click','tbody tr',function () {	

					
					$(".odd").css('background-color', '#f9f9f9')
				
					$(".even").css('background-color', '#fff')



						$(this).css('background-color', '#BEBEBE')
						
				
							selectId = $(this).attr("id")
		
								
							
							})
					


				//下架鍵
				$('#downButton').button().on("click", function () {
					
					if(selectId==null)
					alert("請選擇商品")


					else{
					swal({
							title:'確定下架?',
							icon: "warning",
							buttons: {
								Btn: false,
								confirm: {
									text: "確定",
									visible: true
								},
								cancel: {
									text: "取消",
									visible: true
								},
							
							
								},
							
							dangerMode: true
							}).then(function(status){
								
								if(status==true){
								$.ajax({
						url: "/blankShop/backEnd/product/"
							+ selectId,
						type: "DELETE",
						dataType: "json",
						success: function (data) {
							swal({
							icon: 'success',	
							title: data.msg,
							showConfirmButton: false,
							timer: 1500
							});
							
								
							table.ajax.reload()
							parent.sendMessage()
							selectId=null
							showProductChart(getProductChart());
							
						
								
							
						}
					})

				}

							})
						}			
					
				

				});



					
				//還原顏色
					function resetSelect() {
						selectId = null;
						$(".odd").css('background-color', '#f9f9f9')
				
						$(".even").css('background-color', '#fff')
					}
					//滑動預覽圖片
					var preSelectId ;

					$('#previewDialog').on('mouseenter',function(){
						previewDialog.dialog("open");
						previewDialog.dialog( "option", "maxWidth", 900 );

					})


					$('#previewDialog').on('mouseleave',function(){
						
						
						previewDialog.dialog("close");

					})


					
					$('#productTable').on('mouseenter','tbody tr td:nth-child(2)',function () {	
						preSelectId = $(this).parent().attr("id")
						console.log(preSelectId)
		
						previewDialog.dialog("open");
						previewDialog.dialog( "option", "maxWidth", 900 );
					})
					$('#productTable').on('mouseleave','tbody  tr td:nth-child(2)',function () {	
					
						
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

					//上傳時預覽圖片
							
							//更新
							$("#multipartFile1").change(function(){
									if (this.files && this.files[0]) {
										let reader = new FileReader();
										reader.readAsDataURL(this.files[0]);
										reader.onload = function (e) {
											$('#upproductImgDir1').attr('src', e.target.result);
										}
									
									}
								});



							
								
								$("#multipartFile2").change(function(){
									if (this.files && this.files[0]) {
										let reader = new FileReader();
										reader.readAsDataURL(this.files[0]);
										reader.onload = function (e) {
											$('#upproductImgDir2').attr('src', e.target.result);
											
										}
										
									}
								});

								$("#multipartFile3").change(function(){
									if (this.files && this.files[0]) {
										let reader = new FileReader();
										reader.readAsDataURL(this.files[0]);
										reader.onload = function (e) {
											$('#upproductImgDir3').attr('src', e.target.result);
										}
									
									}
								});
								
							
							
								
							





					
			});
	
			

		
			function showProductChart(datachart){
				var colorSet = [ 
							'rgba(255, 99, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(255, 206, 86, 0.2)',
							'rgba(75, 192, 192, 0.2)',
							'rgba(153, 102, 255, 0.2)',
							'rgba(255, 159, 64, 0.2)'
						]
						var colorBorderSet = [
							'rgba(255, 99, 132, 1)',
							'rgba(54, 162, 235, 1)',
							'rgba(255, 206, 86, 1)',
							'rgba(75, 192, 192, 1)',
							'rgba(153, 102, 255, 1)',
							'rgba(255, 159, 64, 1)'
						]
				var chartlabels = [];
				var chartdata = [];
				var backgroundColor = [];
				var borderColor = [];
				var ctx = document.getElementById('myChart').getContext('2d');
			
				for(let i = 0,j=0; i <datachart.length;i++,j++){
					chartlabels.push(datachart[i].productName)
					chartdata.push(datachart[i].sum)
					backgroundColor.push(colorSet[j])
					borderColor.push(colorBorderSet[j])
				
					if(j==5)
					j=0;
				}
				
				if(myChart!=undefined)
					myChart.destroy()
					
				
				
			 myChart = new Chart(ctx, {
				type: 'bar',

				data: {
					labels: chartlabels,
					datasets: [{
						label: '銷售量',
						data: chartdata,
						backgroundColor:backgroundColor,
						borderColor: borderColor,
						borderWidth: 1
					}]
				},
				options: {
					scales: {
						y: {
							beginAtZero: true
						}
					}
				}
			
			});
			
		
			}
			
						function getProductChart(){

								var result
							 $.ajax({
										url :"/blankShop/backEnd/product/chart"	,
										type :"get",
										dataType: "json",
										async :false , 
										success: function(data){	

											 result =  data;
											
										}

									})
									
									return result;
									
								}


		</script>
		


		</html>