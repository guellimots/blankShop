<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="html,css,javascript,bootstrap4,jquery,jquery-ui">
<meta name="description" content="EDU 第一組期末專題專案">
<!-- websocket -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.0/handlebars.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/list.js/1.1.1/list.min.js"></script>
<!--    libs for stomp and sockjs-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<!--    end libs for stomp and sockjs-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet" type="text/css">
<link href="/blankShop/css/backEnd/adminstyle.css" rel="stylesheet">
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet" href="/blankShop/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="/blankShop/css/backEnd/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet" href="/blankShop/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<link rel="stylesheet" href="/blankShop/css/backEnd/findorderDailyItem.css">
<!-- 取代 alert script -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- dialog -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>BlankShop 後臺管理系統</title>
</head>
<!-- /GetButton.io widget -->
<body class="hold-transition sidebar-mini layout-fixed" data-panel-auto-height-mode="height">
	<!-- websocket的預設admin -->
	<div class="wrapper">
		<!-- 後台Blankshop容器 -->
		<nav class="main-header navbar navbar-expand navbar-white navbar-light">
			<!-- 左上功能鍵 -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a></li>
				<!-- 後台頁面設定 -->
				<li class="nav-item d-none d-sm-inline-block">
				<a  class="nav-link" id="annousment">公告</a></li>
			</ul>
			<!-- 新增公告 -->
			<div id="create-form" style="text-align: center;" title="新增公告">
				<form id="createform">
					<fieldset style="margin-top: 5px;">
						<label for="msg">訊息:</label>
						<input class="inputBar" type="text" name="message" id="msg">
					</fieldset>
				</form>
			</div>
			<!-- /新增公告 -->

			<!-- 右上功能選單 -->
			<ul class="navbar-nav ml-auto">

				<!-- 即時通訊息功能-->
				<li class="nav-item dropdown">
					<a class="nav-link" data-toggle="dropdown" href=""> 
					<i class="far fa-comments"  id="comments"></i>
					<span class="badge badge-success navbar-badge" id="msginf"></span>
					</a>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						<a id="goToChat" href="/blankShop/backEnd/adminChatRoomView" class="dropdown-item" ><span id="userInf" class="fa fa-user-circle">  客人聯繫</span></a>
						<a href="/blankShop/backEnd/adminChatRoom" class="dropdown-item" id="group"><span class="fa fa-users" id="usergroup">  群組聯繫</span></a>
					</div>
					
				<!-- 警示通訊息功能-->
				<li class="nav-item dropdown"><a class="nav-link"
					data-toggle="dropdown" href="#"> <i class="far fa-bell"></i> <span
						class="badge badge-warning navbar-badge" id="warncnt"></span>
				</a>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
					
						<div class="dropdown-divider"></div>
						<a id="warnMsg" href="/blankShop/backEnd/viewProductNotification"
							class="dropdown-item"> </a>
					</div></li>
					<form action="/bakcEnd/logout">
						<li class="nav-item dropdown"><a class="navbar-brand"
							href="logout"> <i class="fas fa-sign-out-alt"></i>
						</a></li>
					</form>				
				<!-- 開啟全視窗功能 -->
				<li class="nav-item"><a class="nav-link"
					data-widget="fullscreen" href="#" role="button"> <i
						class="fas fa-expand-arrows-alt"></i>
				</a></li>
			</ul>
		</nav>
		<!-- /後台Blankshop容器 -->

		<!-- 主側邊容器 -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- 品牌logo -->
			<a class="brand-link"> <img
				src="/blankShop/img/backEnd/favicon.png" alt="AdminLTE Logo"
				class="brand-image img-circle elevation-3" style="opacity: .8">
				<span class="brand-text font-weight-light">BlankShop</span>
			</a>

			<!-- 左邊欄位選單 -->
			<div class="sidebar">
				<!-- 顯示員工登入畫面 -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="image">
						<img src="${empimg}" class="img-circle elevation-2"
							alt="User Image">
					</div>
					<div class="info">
						<a class="d-block"> ${empname} - ${empid}</a> 
						<input type="hidden" id="empid" name="empid" value="${empid}">
						<input id="userName" value="admin" placeholder="search" type="hidden">
						<!-- 員工登入顯示(照片、員編、姓名) -->
					</div>
				</div>
				<!-- 功能欄 -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-tachometer-alt"></i>
								<p>
									商品管理<i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a
									href="/blankShop/backEnd/viewProduct" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>檢視與調整產品</p>
								</a></li>
								<li class="nav-item"><a
									href="/blankShop/backEnd/viewProductInMarket" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>上架中商品</p>
								</a></li>
								<li class="nav-item"><a
									href="/blankShop/backEnd/viewProductNotification"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>產品庫存警告</p>
								</a></li>
							</ul></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-chart-pie"></i>
								<p>
									訂單管理 <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a
									href="/blankShop/OrdersInfoMain/oerderDetail" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>訂單檢視</p>
								</a></li>
							</ul></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-tree"></i>
								<p>
									廣告管理 <i class="fas fa-angle-left right"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item" id="insertphoto"><a
									href="/blankShop/advertisting/Insertadvertisting"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>新增廣告</p>
								</a></li>
								<li class="nav-item"><a
									href="/blankShop/advertisting/all_advertising" class="nav-link"
									id="imgInfo"> <i class="far fa-circle nav-icon"></i>
										<p>廣告資訊</p>
								</a></li>
								<li class="nav-item" id="sendemail"><a
									href="/blankShop/AdvertMailPage/AdvertMailMain"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>廣告PUSH</p>
								</a></li>
							</ul></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-edit"></i>
								<p>
									會員管理 <i class="fas fa-angle-left right"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="/blankShop/mem/editMem"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>查詢與修改</p>
								</a></li>
								<li class="nav-item"><a href="/blankShop/mem/memByAge"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>消費分析</p>
								</a></li>
							</ul></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-table"></i>
								<p>
									員工管理 <i class="fas fa-angle-left right"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item" id="insertemp"><a 
									href="/blankShop/emp/newemp" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>新增員工</p>
								</a></li>
								<li class="nav-item" id="findemp"><a 
									href="/blankShop/emp/editEmp" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>查詢與修改</p>
								</a></li>
								<li class="nav-item" id="updateemp"><a
									href="/blankShop/emp/updatePersonal" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>更新個人資料</p>
								</a></li>
							</ul></li>
							<li class="nav-item" id="data" ><a href="/blankShop/chart/chart01" class="nav-link"> 
								<i class="nav-icon fas fa-copy"></i>
								  <p>
									  數據管理 <i class="fas fa-angle-left right"></i>
								  </p>
							</a>
					</ul>
				</nav>
				<!-- /左邊欄位選單 -->
			</div>
		</aside>
		<!-- /.主側邊容器 -->

		<!-- 右側容器 -->
		<div class="content-wrapper iframe-mode" data-widget="iframe"
			data-loading-screen="750">
			<div
				class="nav navbar navbar-expand navbar-white navbar-light border-bottom p-0">
				<div class="nav-item dropdown">
					<a class="nav-link bg-danger dropdown-toggle"
						data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
						aria-expanded="false">關閉</a>
					<div class="dropdown-menu mt-0">
						<a class="dropdown-item" href="#" data-widget="iframe-close"
							data-type="all">關閉此頁面</a> <a class="dropdown-item" 
							data-widget="iframe-close" data-type="all-other" id="f5">首頁</a>
					</div>
				</div>
				<a class="nav-link bg-light" href="#"
					data-widget="iframe-scrollleft"><i
					class="fas fa-angle-double-left"></i></a>
				<ul class="navbar-nav overflow-hidden" role="tablist"></ul>
				<a class="nav-link bg-light" href="#"
					data-widget="iframe-scrollright"><i
					class="fas fa-angle-double-right"></i></a> <a class="nav-link bg-light"
					href="#" data-widget="iframe-fullscreen"><i
					class="fas fa-expand"></i></a>
			</div>
			<div class="tab-content">
				<section class="content">
					<!-- 首頁數據顯示區 -->
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-3 col-sm-6 col-12">
								<div class="info-box">
									<span class="info-box-icon bg-info"><i class="fas fa-shopping-cart"></i></span>
									<div class="info-box-content">
										<span class="info-box-text">今日訂單數</span> 
										<h3 class="info-box-number" id="DailyOrder"></h3>
									</div>		
								</div>
							</div>
							<div class="col-md-3 col-sm-6 col-12">
            					<div class="info-box">
              						<span class="info-box-icon bg-success"><i class="fas fa-search-dollar"></i></span>
              						<div class="info-box-content">
                						<span class="info-box-text">今日成交金額</span>
                						<h3 class="info-box-number" id="DailyOrderPrice"></h3>
              						</div>
            					</div>          
          					</div>
							<div class="col-md-3 col-sm-6 col-12">
            					<div class="info-box">
              						<span class="info-box-icon bg-danger"><i class="fas fa-tshirt"></i></span>
              						<div class="info-box-content">
                						<span class="info-box-text">商品數量</span>
										<h3 class="info-box-number" id="totalProduct"></h3>
              						</div>
            					</div>          
          					</div>
							<div class="col-md-3 col-sm-6 col-12">
            					<div class="info-box">
              						<span class="info-box-icon bg-warning"><i class="fas fa-user-plus"></i></span>
              						<div class="info-box-content">
                						<span class="info-box-text">會員累積</span>
										<h3 class="info-box-number" id="totalMember"></h3>
              						</div>
            					</div>          
          					</div>
          					<div class="col-md-3">
          						<div class="card card-warning">
              						<div class="card-header">
                						<h3 class="card-title">訊息公告</h3>
               							<div class="card-tools">
                  							<button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
                  							</button>
                						</div>             
              						</div>
              						<div class="card-body" align="center">
              							<img class="direct-chat-img" src="/blankShop/img/backEnd/avatar.png" alt="Message User Image">
              							<div class = "direct-chat-text">
              								<marquee width = "90%" direction = "right" id="marqueeMsg"></marquee>
              							</div>      						
              						</div>
           					 	</div>
           					 </div>
						</div>		
					</div>
					<!-- /首頁數據顯示區 -->
				</section>
				
				<div class="tab-loading">
					<div>
						<h2 class="display-4">
							資料查詢中<i class="fas fa-spinner fa-spin"></i>
						</h2>
						<!-- 點擊功能時顯示 -->
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- ./wrapper -->

	<!-- jQuery -->
	<script src="/blankShop/plugins/jquery/jquery.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="/blankShop/plugins/jquery-ui/jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script src="/blankShop/js/backEnd/chatroom/checkmessage.js"></script>
	<script src="/blankShop/js/backEnd/memberChat/admincustom.js"></script>
	<script src="/blankShop/js/backEnd/memberChat/adminchat.js"></script>
	<script src="/blankShop/js/backEnd/product/notificationProduct.js"></script>
	<script>
		$.widget.bridge('uibutton', $.ui.button)
	</script>
	<script>
		$(document).ready(function() {
			registration() 
			
			$("#goToChat").click(function(){

			$("#msginf").html("")
			$("#circleOnline").remove();
			})	


			getuser()
			postID();
			var empID
			function postID() {
				empID = $("#empid").val();
				$.ajax({
					url : "/blankShop/emp/loginID/" + empID,
					type : "GET",
					dataType : "json",
					success : function() {

					}
				})
			}
		})
	</script>




	<!-- Bootstrap 4 -->
	<script src="/blankShop/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- overlayScrollbars -->
	<script src="/blankShop/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
	<!-- AdminLTE App -->
	<script src="/blankShop/js/backEnd/adminlte.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="/blankShop/js/backEnd/demo.js"></script>
	<script src="/blankShop/js/backEnd/employee/checkemp.js"></script>
	<script src="/blankShop/js/backEnd/order/findorderDailyItem.js"></script>
	<script src="/blankShop/js/backEnd/showmessage.js"></script>
	<script src="/blankShop/js/backEnd/adminindex.js"></script>



</body>
</html>
