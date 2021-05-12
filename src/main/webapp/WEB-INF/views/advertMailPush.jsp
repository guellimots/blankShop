
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<!-- Font Awesome -->
<link rel="stylesheet" href="/blankShop/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="/blankShop/css/backEnd/adminlte.min.css">
<!-- summernote -->
<link rel="stylesheet" href="/blankShop/plugins/summernote/summernote-bs4.min.css">
<!-- DataTable -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link rel="stylesheet" href="/blankShop/plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="/blankShop/plugins/uplot/uPlot.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="/blankShop/js/backEnd/jquery-3.5.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="/blankShop/css/backEnd/advertisting.css">
<script src="/blankShop/js/backEnd/jquery.dataTables.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta name="keywords" content="html,css,javascript,bootstrap4,jquery,jquery-ui">
<meta name="description" content="EDU 第一組期末專題專案">
<title>廣告PUSH</title>
</head>
<body>
<div class="card card-info">
		<div class="card-header">
			<h3 class="card-title">會員資訊</h3>
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
		<div class="card-body" id="memeberDetail">
			<!-- 資料存放區 -->
			<div>
				<table id="memberInfo" class="dataTable display cell-border hover" style="width: 100%">
					<thead>
						<tr>
							<th style='width: 10px'>#</th>
							<th>姓名</th>
							<th>生日</th>
							<th>聯絡電話</th>
							<th>電子信箱</th>
							<th>地址</th>
						</tr>
					</thead>
				</table>
			</div>
			<!-- /資料存放區 -->
		</div>
		<!-- /.card-body -->
	</div>
<form action="/blankShop/AdvertMailPage/sendMail" method="POST" enctype="multipart/form-data">
	<div class="card card-success">
		<div class="card-header">
			<h3 class="card-title">廣告PUSH</h3>
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
	</div>
		<div class="card-body" id="mailpush">
			<div class="card-body">
				<div class="form-group">
					<input class="form-control" placeholder="To:" name="mailto" id="to">
				</div>
				<div class="form-group">
					<input class="form-control" placeholder="From:" name="mailfrom"
						id="from" value="blankshopcompany@gmail.com">
				</div>
				<div class="form-group">
					<input class="form-control" placeholder="Subject:"
						name="mailsubject" id="subject">
				</div>
				<div class="form-group">
					<textarea id="mail_advert_Msg" class="form-control"
						style="height: 300px" name="content">          
                    </textarea>
				</div>
				<div id="actions" class="row">	
					<div class="col-lg-6">
						<input type="file" id="image" name="image" />
					</div>			
				</div><br>
				<img id="previewImg" style="width: 400px; height: 350px;"/>
			</div>
			<!-- /.card-body -->
			<div class="card-footer">
				<input type="hidden" id="sendrs" name="sendrs" value="${sendrs}"/>
					<div class="float-right">
						<button type="submit" class="btn btn-primary" id="">
							<i class="far fa-envelope"></i>送出
						</button>
					</div>
				</div>
			</div>
		<!-- /.card-body -->
		</div>
	</div>
</form>
	
	<!-- Bootstrap 4 -->
	<script src="/blankShop/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="/blankShop/js/backEnd/adminlte.min.js"></script>
	<!-- Summernote -->
	<script src="/blankShop/plugins/summernote/summernote-bs4.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="/blankShop/js/backEnd/dist/js/demo.js"></script>
	<script src="/blankShop/js/backEnd/advertising/AdvertMailPush.js"></script>
	<script src="/blankShop/js/backEnd/advertising/summernote.js"></script>
</body>
</html>