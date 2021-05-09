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
				#dis1,#updis1{
					margin: auto;
					width: 400px;
					height: 100px;
					float: left;
					text-align: left;
					padding-left: 200px;
				}
				#dis2,#updis2{
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
				#upPrice,#upSalesPrice,#upGenre,#upPurpose{	
					display: inline;
					font-size: large;
					width: 100px;
				}
				#uptitle{
					font-size: 50px;
					
				}
				#up-product{
					visibility: hidden;
				}
				
			</style>
			<title>Insert title here</title>
		</head>

		<body>


			<button id="createButton">新增</button>
			<button id="editButton">編輯</button>
		
			<button id="pullButton">商品上架</button>
		
			



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
			
			<div style="text-align: center;" id="up-product">
				<h1 id="uptitle"></h1>
				<hr>
				<label id="upPrice">價格:</label>
				<label id="upSalesPrice">銷售價格:</label>	
				<hr>
				<label id="upGenre">子分類:</label>
				<label id="upPurpose">用途:</label>
				<hr>
			
				<img id="upimg1" width="300" height="500">
				<img id="upimg2" width="300" height="500">
				<img id="upimg3" width="300" height="500">
				<hr>
				<div id="updis1"></div>
				<div id="updis2"></div>
			</div>







			<div style="text-align: center;" id="previewDialog" >
				<h1 id="ptitle"></h1>
				<img id="img1" width="200" height="300">
				<img id="img2" width="200" height="300">
				<img id="img3" width="200" height="300">
				<hr>
				<div id="dis1"></div>
				<div id="dis2"></div>
			</div>
			
			
			<div id="create-form" title="新增商品">
			
				<form id="createForm">
					<fieldset>
						<label for="productID" id="selectNewIdName">產品編號:</label>
						<input type="text"  readonly id="selectNewId" name="productID" value="" class="text ui-widget-content ui-corner-all">

						<label for="productName">產品名稱:</label>
						<input type="text" required name="productName" id="selectNewName"  class="text ui-widget-content ui-corner-all">
						<br>
						<br>
						<label class="inputlabel" for="colorCode">顏色:</label> 
						<input class="inputBar" type="color" name="colorCode" id="selectcolor">

						<label class="inputlabel" for="size">尺寸:</label> 
						<select class="inputBar"  name="size"  id="selectsize" >
							<option>L</option>
							<option>M</option>
							<option>S</option>
						</select>


						<label class="inputlabel" for="genre">子分類:</label> 
						<select class="inputBar" name="genre" id ="selectgenre">
							<option>上衣</option>
							<option>襯衫</option>
							<option>褲裝</option>
							<option>裙裝</option>
						</select>

						<label class="inputlabel" for="purpose">用途:</label> 
						<select  class="inputBar" name="purpose"id ="selectpurpose">
							<option>居家休閒</option>
							<option>約會必勝</option>
							<option>職場穿搭</option>
						</select>
					
						<br>
						<br>
						<div id="validateMsg"></div>
						<br>
						
						<label for="inMarketDate">上架日期:</label> 
						<input type="date" name="inMarketDate" id="selectDate" value=""> 
						<label for="productPrice">價格:</label>
						<input required type="number" id ="selectproductPrice" min="0" name="productPrice" value="0" class="text ui-widget-content ui-corner-all">

						
						

						<label for="stockNumber">庫存:</label>
						<input required type="number" min="0" name="stockNumber" value="0" class="text ui-widget-content ui-corner-all">

						<label for="productDiscription1">產品描述1:</label> 
						<textarea id="snpd1" name="productDiscription1">  </textarea>

						<label for="productDiscription2">產品描述2:</label> 
						<textarea id="snpd2" name="productDiscription2">  </textarea>
					
					
						<label for="productImgDir1">附圖1:</label> 
						<input type="file" id="newmultipartFile1" name="multipartFile1" value="" > 
						<img id="newproductImgDir1" width="250" height="350">


						<canvas id="myCanvas">
						
							</canvas>





						<label for="productImgDir2">附圖2:</label> 
						<input type="file" id="newmultipartFile2"name="multipartFile2" value="" > 
						<img id="newproductImgDir2" width="250" height="350">
						<label for="productImgDir3">附圖3</label> 
						<input type="file" id="newmultipartFile3" name="multipartFile3" value="">
						<img id="newproductImgDir3" width="250" height="350">




						<input type="submit" tabindex="-1" style="position: absolute; top: -1000px">
					</fieldset>
				</form>
				<input type="submit" tabindex="-1" style="position: absolute; top: -1000px">
				</fieldset>
				</form>
			</div>










			<div id="dialog-form" title="編輯商品">
			

				<form  id="updateForm">
					<fieldset>
						<label for="typeId">型別編號</label> 
						<input readonly type="text" name="typeId" id="typeId" value="" class="text ui-widget-content ui-corner-all">

						<label for="productName">產品名稱</label> 
						<input type="text" required name="productName" id="productName" value="" class="text ui-widget-content ui-corner-all"> 

						<label for="productID">產品編號</label> 
						<input type="text" readonly name="productID" id="productID" value="" class="text ui-widget-content ui-corner-all"> 
						<br>
						<br>
						<label for="colorCode" class="inputlabel">顏色</label> 
						<input   type="color" class="inputBar" name="colorCode" id="colorCode" > 

						<label for="size" class="inputlabel">尺寸</label> 
						<select name="size"class="inputBar" id="size" >
							<option>L</option>
							<option>M</option>
							<option>S</option>
						</select>

						<label for="genre" class="inputlabel">子分類</label> 
						<select name="genre"class="inputBar" id ="genre">
							<option>上衣</option>
							<option>襯衫</option>
							<option>褲裝</option>
							<option>裙裝</option>
						</select>

						<label for="purpose" class="inputlabel">用途</label> 
						<select name="purpose" class="inputBar" id ="purpose">
							<option>居家休閒</option>
							<option>約會必勝</option>
							<option>職場穿搭</option>
						</select> 
						<br>
						<br>
						<div id="EditvalidateMsg"></div>
						<br>
						<label for="inMarketDate">上市日期</label> 
						<input type="date" name="reciDate" id="inMarketDate" value="" class="text ui-widget-content ui-corner-all"> 

						<label for="productPrice">產品價格</label> 
						<input required type="number" name="productPrice" id="productPrice" value="" class="text ui-widget-content ui-corner-all"> 

						<label for="salePrice">促銷價格</label> 
						<input type="number" name="salePrice" id="salePrice" value="" class="text ui-widget-content ui-corner-all"> 

					


						
						<label for="stockNumber">庫存</label>
						<input required type="number" name="stockNumber" id="stockNumber" value="0" class="text ui-widget-content ui-corner-all">
						

						<label for="productDiscription1">產品描述1</label> 
						<textarea name="productDiscription1" id="editsnpd1">  </textarea>

						<label for="productDiscription2">產品描述2</label> 
						<textarea name="productDiscription2" id="editsnpd2">  </textarea>
						

						 
 

						<label for="productImgDir1">附圖1</label> 
						<input type="file" id="multipartFile1"name="multipartFile1"  value="" > 
						<img id="productImgDir1" width="250" height="350">
						<img id="upproductImgDir1" width="250" height="350">
						
						<label for="productImgDir2">附圖2</label> 
						<input type="file" id="multipartFile2" name="multipartFile2"  value="">
						<img id="productImgDir2" width="250" height="350">
						<img id="upproductImgDir2" width="250" height="350">


						<label for="productImgDir3">附圖3</label> 
						<input type="file" id="multipartFile3" name="multipartFile3"  value="">
						<img id="productImgDir3" width="250" height="350">
						<img id="upproductImgDir3" width="250" height="350">

						


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
						"sAjaxSource": "/blankShop/backEnd/productdown",
						"sAjaxDataProp": "",
						"rowId":"typeId",
						"order": [[0, "desc"]],
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
				//選取單一商品功能

				$('#productTable').on('dblclick','tbody tr',function () {resetSelect()	})
				$('#productTable').on('click','tbody tr',function () {	

				

				
					$(".odd").css('background-color', '#f9f9f9')

					$(".even").css('background-color', '#fff')



						$(this).css('background-color', '#BEBEBE')
						
				
							selectId = $(this).attr("id")
		
								
					})


												//上架時的方法
												function productup(){

							$.ajax({
								url: "/blankShop/backEnd/productup/"
									+ selectId,
								type: "PUT",
								dataType: "json",
								success: function (data) {
									swal({
									icon: 'success',	
									title: data.msg,
									showConfirmButton: false,
									timer: 2000
									});
										
									upProductDialog.dialog("close");	
									table.ajax.reload()
									parent.sendMessage()
									
									
										}
									})
							}


					//上架預覽的表單
					var upProductDialog

					upProductDialog = $("#up-product").dialog({
					autoOpen: false,
					height: 1000,
					width: 1200,
					modal: true,
					resizable:false,
					buttons: {
						"上架": productup,
						"取消": function () {
							upProductDialog.dialog("close");
						}
					},
					close: function () {
					
						resetSelect()
						
						$("#snpd1").summernote("code","");
						$("#snpd2").summernote("code","");
						$('#upproductImgDir1').attr('src', "");
						$('#upproductImgDir2').attr('src', "");
						$('#upproductImgDir3').attr('src', "");
						upProductDialog.dialog("close");

					}
				});	

				


				//上架鍵
				$('#pullButton').button().on("click", function () {

					$("#up-product").css("visibility","visible")

					if(selectId!=null){
						$(".ui-dialog-titlebar-close").show();
					upProductDialog.dialog("open");
					upProductDialog.dialog( "option", "maxWidth", 900 );

					$.ajax({
						url: "/blankShop/backEnd/product/"
							+ selectId,
						type: "GET",
						dataType: "json",
						success: function (data) {
							// $('upProductInform').html(data["productName"]+"-"+)
							$('#uptitle').html(
							data["productName"]+"-"+
							data["size"]+"-<span style='background-color:"+	
							data["colorCode"]+";border: 1px solid black;'>&emsp;</span>")
							$('#upPrice').html("價格:&emsp;"+data["productPrice"]+"元&emsp;")
							$('#upSalesPrice').html("促銷價格:&emsp;"+data["salePrice"]+"元")
							$('#upGenre').html("子分類:&emsp;"+data["genre"]+"&emsp;")	
							$('#upPurpose').html("用途:&emsp;"+data["purpose"])	
							$('#upimg1').attr("src","../.."+data["productImgDir1"])
							$('#upimg2').attr("src","../.."+data["productImgDir2"])
							$('#upimg3').attr("src","../.."+data["productImgDir3"])
							$("#updis1").html(data["productDiscription1"])
							$("#updis2").html(data["productDiscription2"])
							
							
						}

					})
				}
				else
				alert("請選擇商品")
				
				});
				

				var createDialog, createForm
				//新增單一商品
				function createProduct() {

					var formdata = new FormData($('#createForm')[0]);

					$.ajax({
						url: '/blankShop/backEnd/product/',
						type: 'POST',
						datatype: 'json',
						data: formdata,
						cache: false,
						traditional: true,
						contentType: false,
						processData: false,
						success: function (data) {
							JSON.stringify(data)
							swal({
							icon: 'success',	
							title: data.msg,
							showConfirmButton: false,
							timer: 1500
							});
							
							
							createDialog.dialog("close");
							table.ajax.reload()
							
						}
					});


				}


				//新增表單樣式
				createDialog = $("#create-form").dialog({
					autoOpen: false,
					height: 700,
					width: 650,
					modal: true,
					resizable:false,
					buttons: {
						"新增": createProduct,
						"取消": function () {
							createDialog.dialog("close");
						}
					},
					close: function () {
						$("#validateMsg").html(null)
						$('#selectNewName').removeAttr("readonly")
						selectboxRresh()
						resetSelect()
						createForm[0].reset();
						$('#newproductImgDir1').attr('src', "");
						$('#newproductImgDir2').attr('src', "");
						$('#newproductImgDir3').attr('src', "");
						$("#snpd1").summernote("code","");
						$("#snpd2").summernote("code","");

					}
				});

				createForm = createDialog.find("form").on("submit",
					function (event) {
						event.preventDefault();
						
					});

				//新增鍵

			
				$("#createButton").button().on("click", function () {
					$(".ui-dialog-titlebar-close").show();
					
					
					if(selectId!=undefined){


					createDialog.dialog("open");
					createDialog.dialog( "option", "maxWidth", 900 );
					
				
					$.ajax({
						url: "/blankShop/backEnd/product/"
							+ selectId,
						type: "GET",
						dataType: "json",
						success: function (data) {
							
							$('#selectNewId').show()
							$('#selectNewIdName').show()
							$('#selectcolor').val(data["colorCode"]);
							$('#selectsize').val(data["size"]);
							$('#selectDate').val(data["inMarketDate"]);
							$('#selectNewId').val(data["productID"]);
							$('#selectNewName').val(data["productName"]);
							$('#selectproductPrice').val(data["productPrice"]);
							$('#selectpurpose').val(data["purpose"]);
							$('#selectgenre').val(data["genre"]);
							$("#snpd1").summernote("code", data["productDiscription1"]);
							$("#snpd2").summernote("code", data["productDiscription2"]);
						
							$('#selectNewName').attr("readonly","true");
						

							checkSize()
							
						}
							
					})


					
				}
				else{
					createDialog.dialog("open");
					createDialog.dialog( "option", "maxWidth", 900 );
					$('#selectNewId').hide()
					$('#selectNewIdName').hide()
					
				}
				
				
				});
			
				var dialog, form


				//更新單一商品
				function editProduct() {

					var formdata = new FormData($('#updateForm')[0]);

					$.ajax({
						url: '/blankShop/backEnd/product/'
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
							timer: 1500
							});
							
							form[0].reset();
							dialog.dialog("close");
							table.ajax.reload();
							
							
						},
						error: function () {
							swal({
							icon: 'error',	
							title: data.msg,
							showConfirmButton: false,
							timer: 1000
							});
						}
					});


				}
				//更新表單樣式
				dialog = $("#dialog-form").dialog({
					autoOpen: false,
					height: 700,
					width: 650,
					modal: true,
					resizable:false,
					
					buttons: {
						"修改": editProduct,
						"取消": function () {
							dialog.dialog("close");
						}
					},
					close: function () {
						$("#EditvalidateMsg").html(null)
						form[0].reset();
						editboxRresh()
						resetSelect()
						$('#upproductImgDir1').attr('src', "");
						$('#upproductImgDir2').attr('src', "");
						$('#upproductImgDir3').attr('src', "");
						
					}
				});

				form = dialog.find("form").on("submit",
					function (event) {
						event.preventDefault();
					
						Form[0].reset();
						dialog.dialog("close");



					});



				//更新鍵
				$("#editButton").button().on("click", function () {
					
					$(".ui-dialog-titlebar-close").show();
					if(selectId!=null){

				
						dialog.dialog("open");
						dialog.dialog( "option", "maxWidth", 900 );
					$.ajax({
						url: "/blankShop/backEnd/product/"
							+ selectId,
						type: "GET",
						dataType: "json",
						success: function (data) {
							$('#typeId').val(data["typeId"]);
							$('#productName').val(data["productName"]);
							$('#productID').val(data["productID"]);
							$('#colorCode').val(data["colorCode"]);
							$('#size').val(data["size"]);
							$('#inMarketDate').val(data["inMarketDate"]);
							$('#productPrice').val(data["productPrice"]);
							$('#genre').val(data["genre"]);
							$('#purpose').val(data["purpose"]);			
							$('#salePrice').val(data["salePrice"]);
							$("#editsnpd1").summernote("code", data["productDiscription1"]);
							$("#editsnpd2").summernote("code", data["productDiscription2"]);
							$('#stockNumber').val(data["stockNumber"]);							
							$('#productImgDir1').attr("src","../../"+data["productImgDir1"])
							$('#productImgDir2').attr("src","../../"+data["productImgDir2"])
							$('#productImgDir3').attr("src","../../"+data["productImgDir3"])
							
							editcheckSize()
						}

					})
				}
				else
				alert("請選擇商品")

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
					$('#img1').attr("src","../.."+data["productImgDir1"])
					$('#img2').attr("src","../.."+data["productImgDir2"])
					$('#img3').attr("src","../.."+data["productImgDir3"])
					$("#dis1").html(data["productDiscription1"])
					$("#dis2").html(data["productDiscription2"])
					
						}

					});
						
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
										//新增
								$("#newmultipartFile1").change(function(){
									if (this.files && this.files[0]) {
										let reader = new FileReader();
										reader.readAsDataURL(this.files[0]);
										reader.onload = function (e) {
											$('#newproductImgDir1').attr('src', e.target.result);
										}
									
									}
								});



							
								
								$("#newmultipartFile2").change(function(){
									if (this.files && this.files[0]) {
										let reader = new FileReader();
										reader.readAsDataURL(this.files[0]);
										reader.onload = function (e) {
											$('#newproductImgDir2').attr('src', e.target.result);
										}
									
									}
								});

								$("#newmultipartFile3").change(function(){
									if (this.files && this.files[0]) {
										let reader = new FileReader();
										reader.readAsDataURL(this.files[0]);
										reader.onload = function (e) {
											$('#newproductImgDir3').attr('src', e.target.result);
										}
									
									}
								});


								
										//檢查樣式

								$("#createForm").submit(function(){
									var result={};
									var status;
										result.productName = $("#selectNewName").val()
										result.size =   $("#selectsize").val()
										result.colorCode = $("#selectcolor").val();
										
										if(result.productName!=""&&result.size!=""&&result.colorCode!="")
											{
										$.ajax({
										url: "/blankShop/backEnd/product/checkstyle",
										data: result,
										type: "GET",
										dataType: "json",
										success: function (data) {
											if(data.msg==1)
											status=1
											else
											status=2
										}
									})
								}
										if(result.size==null)
										return false
										if(status==1)
										return true
										else
										return false

								
							})
								$("#updateForm").submit(
									function(){
									var result={};
									var status;
										result.productName = $("#productName").val()
										result.size =   $("#size").val()
										result.colorCode = $("#colorCode").val();
										
										if(result.productName!=""&&result.size!=""&&result.colorCode!="")
											{
										$.ajax({
										url: "/blankShop/backEnd/product/checkstyle",
										data: result,
										type: "GET",
										dataType: "json",
										success: function (data) {
											if(data.msg==1)
											status=1
											else
											status=2
										}
									})
								}
										
										if(status==1)
										return true
										else
										return false

								
							

									
								})
								
										
								$("#selectsize").change(checkstyle);
								$("#selectcolor").change(checkSize);
								$("#selectNewName").change(checkstyle);
								


								
								$("#colorCode").change(editcheckSize);
								$("#colorCode").change(editcheckstyle);
								$("#productName").change(editcheckstyle);
								$("#productName").change(editcheckSize);
							
							

								function checkstyle(){
									var result={};
										result.productName = $("#selectNewName").val()
										result.size =   $("#selectsize").val()
										result.colorCode = $("#selectcolor").val();
										console.log(result);
										if(result.productName!=""&&result.size!=""&&result.colorCode!="")
											{
										$.ajax({
										url: "/blankShop/backEnd/product/checkstyle",
										data: result,
										type: "GET",
										dataType: "json",
										success: function (data) {
											if(data.msg==1)
										$("#validateMsg").html("<img src='/blankShop/img/backEnd/correct.png'><span style='color:green'>樣式正確</span>")
											else	
										$("#validateMsg").html("<img src='/blankShop/img/backEnd/err.png'><span style='color:red'>樣式重複</span>")	

													}

												});
											}

								}
								
								function selectboxRresh(){

									$("#selectsize").html(	"<option>S</option>"+
															"<option>M</option>"+
															"<option>L</option>")
								}


								function checkSize(){
									var sizes= ["S","M","L"]
									var result={};	
									result.productName = $("#selectNewName").val()
									result.colorCode = $("#selectcolor").val();
									
									$.ajax({
										url: "/blankShop/backEnd/product/checkSize",
										data: result,
										type: "GET",
										dataType: "json",
										success: function (data) {
											
											var result ;
											for(let i = 0 ; i < data.length;i++){	
											sizes.splice($.inArray(data[i],sizes),1)	
											}
											

											 if(sizes.length==0){
											  result = "<option></option>";
											  $("#validateMsg").html("<img src='/blankShop/img/backEnd/err.png'><span style='color:red'>請改變顏色</span>")	
											}
											for(let i = 0 ; i < sizes.length;i++){	
												result+="<option>"+sizes[i]+"</option>";
												
											}


											 $("#selectsize").html(result)

												checkstyle()
													}

												});




								}


								function editcheckstyle(){
									var result={};
										result.productName = $("#productName").val()
										result.size =   $("#size").val()
										result.colorCode = $("#colorCode").val();
										console.log(result);
										if(result.productName!=""&&result.size!=""&&result.colorCode!="")
											{
										$.ajax({
										url: "/blankShop/backEnd/product/checkstyle",
										data: result,
										type: "GET",
										dataType: "json",
										success: function (data) {
											if(data.msg==1)
										$("#EditvalidateMsg").html("<img src='/blankShop/img/backEnd/correct.png'><span style='color:green'>樣式正確</span>")
											else	
										$("#EditvalidateMsg").html("<img src='/blankShop/img/backEnd/err.png'><span style='color:red'>樣式重複</span>")	
											

													}

												});
											}

								}
								
								function editboxRresh(){

									$("#size").html(	"<option>S</option>"+
															"<option>M</option>"+
															"<option>L</option>")
								}


								function editcheckSize(){
									var sizes= ["S","M","L"]
									var result={};	
									result.productName = $("#productName").val()
									result.colorCode = $("#colorCode").val();
									
									$.ajax({
										url: "/blankShop/backEnd/product/checkSize",
										data: result,
										type: "GET",
										dataType: "json",
										success: function (data) {
											
											var result ;
											for(let i = 0 ; i < data.length;i++){	
											sizes.splice($.inArray(data[i],sizes),1)	
											}
											
											
											
											
											 
									 
											if(sizes.includes($("#size").val()))							
											sizes.splice($.inArray($("#size").val(),sizes),1)	
											
											 
											for(let i = 0 ; i < sizes.length;i++){	
												result+="<option>"+sizes[i]+"</option>";
											}
										
											result+="<option>"+$("#size").val()+"</option>";
											 $("#size").html(result)
												
												
												
													}
													

												});




								}

					
			});

		</script>




		</html>