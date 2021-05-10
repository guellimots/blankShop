<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="/blankShop/css/backEnd/adminlte.min.css">
<link rel="stylesheet" href="/blankShop/css/backEnd/advert.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>新增倫播牆</title>
</head>
<body>
	<form action="/blankShop/advertisting/insertImg" method="POST" enctype="multipart/form-data">
			<div class="col-md-12">
				<div class="card card-info">
					<div class="card-header">
						<h3 class="card-title">新增廣告</h3>
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
						<label for="imgstatus">圖片名稱</label> 
						<input type="text" class="form-control" id="title" name="title" placeholder="輸入名稱"  required>	
					</div>
					
					<div class="card-body">
					
						<div id="actions" class="row">	
							<div class="col-lg-6">
									<input type="file" id="imgfile" name="imgfile" value=''/>										
							</div>
						</div><br>
						<img id="showSendImg" style="width: 400px; height: 350px;"/>
					</div>
					<button id="btnadvert" type="submit" class="btn btn-primary col start">
						<i class="fas fa-upload"></i> <span>上傳</span>
					</button>
				</div>
			</div>
		<div align="center" id="resultmsg" style="color:green;">${uploadResult}</div>		
	</form>

	<script src="/blankShop/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="/blankShop/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Bootstrap4 Duallistbox -->
	<script src="/blankShop/plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>

	<script src="/blankShop/plugins/inputmask/jquery.inputmask.min.js"></script>
	
	<!-- bootstrap color picker -->
	<script src="/blankShop/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
	<!-- dropzonejs -->
	<script src="/blankShop/plugins/dropzone/min/dropzone.min.js"></script>
	<!-- AdminLTE App -->
	<script src="/blankShop/js/backEnd/adminlte.min.js"></script>
	<script src="/blankShop/js/backEnd/advertising/checkInsertImg.js"></script>
	<script src="/blankShop/js/backEnd/advertising/advertImg.js"></script>
</body>
</html>