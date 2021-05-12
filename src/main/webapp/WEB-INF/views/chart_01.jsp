<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<!-- <script src="/blankShop/js/backEnd/jquery-3.5.1.js"></script> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- <script src="/blankShop/js/backEnd/jquery.dataTables.min.js"></script> -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
</head>


<body>

	<div id="tab-demo" align="center" style="height: 50vh; width: 90vw;">
		<ul class="tab-title">
			<li><a href="#div01">會員年齡與消費金額</a></li>
			<li><a href="#div02">會員級別之分佈比例</a></li>
			<li><a href="#div03">商品分類之總銷售額</a></li>
			<li><a href="#div04">近七天總銷售額</a></li>
		</ul>

		<!-- 會員年齡與消費金額 -->
		<div class="tab-inner" id="div01"
			style="height: 50vh; width: 90vw; margin: 5px; border: 0; padding: 0;">
			<br>
			<canvas id="myChart01" width="200" height="100"></canvas>
		</div>

		<!-- 會員級別之分佈比例 -->
		<div class="tab-inner" id="div02"
			style="height: 50vh; width: 90vw; margin: 5px; border: 0; padding: 0;">
			<br>
			<canvas id="myChart02" width="200" height="100"></canvas>
		</div>

		<!-- 商品分類之總銷售額 -->
		<div class="tab-inner" id="div03"
			style="height: 40vh; width: 80vw; margin: 5px; border: 0; padding: 0;">
			<br>
			<canvas id="myChart03" width="200" height="100"></canvas>
		</div>
		<br>

		<!-- 近七天總銷售額 -->
		<div class="tab-inner" id="div04"
			style="height: 35vh; width: 80vw; margin: 5px; border: 0; padding: 0;">
			<br>
			<canvas id="myChart04" width="200" height="100"></canvas>
		</div>


	</div>
	<script>
		$(document).ready(
				function() {
					//使用json獲取資料
					var jsonData = $.ajax({
						url : '/blankShop/mem/sortMemAge',
						type : 'post',
						dataType : 'json'
					}).done(
							function(mydata) {
								console.log(mydata);
								//把資料分成兩個array
								//var data01=JSON.stringify(mydata,null,4);
								//console.log("data01:"+data01);
								//var results=JSON.parse(mydata);
								//console.log("results: "+results);

								var money = [], age = [];
								level = [];
								var moneySort=[0,0,0,0,0,0],ageSort=[0,0,0,0,0,0];

								for (let i = 0; i < mydata.length; i++) {
									money.push(mydata[i].spending);
									age.push(mydata[i].age);
									level.push(mydata[i].level);
									// 		  console.log("money["+i+"]:"+money[i]);

								}for (let j = 0; j < mydata.length; j++) {
									if(age[j]<=25){
										ageSort[0]+=1;
										moneySort[0]+=money[j];
									}else if(age[j]<=30 && age[j]>25){
										ageSort[1]+=1;
										moneySort[1]+=money[j];
									}else if(age[j]<=35 && age[j]>30){
                                        ageSort[2]+=1;
                                        moneySort[2]+=money[j];
                                    }else if(age[j]<=40 && age[j]>35){
                                        ageSort[3]+=1;
                                        moneySort[3]+=money[j];
                                    }else if(age[j]<=45 && age[j]>40){
                                        ageSort[4]+=1;
                                        moneySort[4]+=money[j];
                                    }else if(age[j]<=50 && age[j]>45){
                                        ageSort[5]+=1;
                                        moneySort[5]+=money[j];}
									
								}
								

								//     	  for(var ageSpent in results){
								//     		  money.push(ageSpent.spending);
								//     		  data.push(ageSpent.age);
								//     		  console.log(ageSpent.age+":"+ageSpent.spending);

								//     	  }
								//    	  console.log("money[1]"+money[1]);
								//    	  console.log("age[1]"+age[1]);

								//準備圖表的數據  <訂單年齡消費金額分析圖>
								var spentData = {
									labels : ['小於25','25-30','30-35','35-40','40-45','45-50'],
									datasets : [ {
										label : "年齡層區間消費金額",
										fill : false,
										data : moneySort,
										borderWidth : 1,
										borderColor : '#00c0ef',
										//     	              backgroundColor: 'rgba(66, 165, 245, 0.5)',
										backgroundColor : [
												'rgba(255, 99, 132, 0.4)',
												'rgba(54, 162, 235, 0.4)',
												'rgba(255, 206, 86, 0.4)',
												'rgba(255, 99, 132, 0.4)',
												'rgba(54, 162, 235, 0.4)',
												'rgba(255, 206, 86, 0.4)'
// 												'rgba(255, 99, 132, 0.4)',
// 												'rgba(54, 162, 235, 0.4)',
// 												'rgba(255, 206, 86, 0.4)',
// 												'rgba(255, 99, 132, 0.4)',
// 												'rgba(54, 162, 235, 0.4)',
// 												'rgba(255, 206, 86, 0.4)',
// 												'rgba(255, 99, 132, 0.4)',
// 												'rgba(54, 162, 235, 0.4)',
// 												'rgba(255, 206, 86, 0.4)',
// 												'rgba(255, 99, 132, 0.4)',
// 												'rgba(54, 162, 235, 0.4)',
// 												'rgba(255, 206, 86, 0.4)',
// 												'rgba(255, 99, 132, 0.4)',
// 												'rgba(54, 162, 235, 0.4)',
// 												'rgba(255, 206, 86, 0.4)' 
												],
										borderColor : [ 'rgba(255,99,132,1)',
												'rgba(54, 162, 235, 1)',
												'rgba(255, 206, 86, 1)',
												'rgba(255,99,132,1)',
												'rgba(54, 162, 235, 1)',
												'rgba(255, 206, 86, 1)'
// 												'rgba(255,99,132,1)',
// 												'rgba(54, 162, 235, 1)',
// 												'rgba(255, 206, 86, 1)',
// 												'rgba(255,99,132,1)',
// 												'rgba(54, 162, 235, 1)',
// 												'rgba(255, 206, 86, 1)',
// 												'rgba(255,99,132,1)',
// 												'rgba(54, 162, 235, 1)',
// 												'rgba(255, 206, 86, 1)',
// 												'rgba(255,99,132,1)',
// 												'rgba(54, 162, 235, 1)',
// 												'rgba(255, 206, 86, 1)' 
												],

									} ]
								};

								//     	  訂單年齡消費金額分析圖
								var ctx = document.getElementById("myChart01")
										.getContext("2d");
								//     	  畫圖 <訂單年齡消費金額分析圖>
								var myChart = new Chart(ctx, {
									type : 'bar',
									data : spentData,
									options : {
										title : {
											display : true,
											text : '會員年齡與消費金額',
											fontSize : 30,
										},

// 										scales : {
// 											y : {
// 												beginAtZero : true,
// 											}
// 										}
										animation: {
										      onComplete: function() {
										        var chartInstance = this.chart,
										        ctx = chartInstance.ctx;
										 
// 										        ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
                                                ctx.font = Chart.helpers.fontString(18, "normal", "'Helvetica Neue', 'Helvetica', 'Arial', sans-serif");
                                                ctx.fillStyle = '#444';
                                                ctx.textAlign = 'center';
										        ctx.textBaseline = 'bottom';
										 
										        this.data.datasets.forEach(function(dataset, i) {
										          var meta = chartInstance.controller.getDatasetMeta(i);
										          meta.data.forEach(function(bar, index) {
										            var data = dataset.data[index];
										            ctx.fillText(data, bar._model.x, bar._model.y - 5);
										          });
										        });
										      }
										    }
									}

								});

								//會員等級與年齡分析圖
								var age01 = age, level01 = level;
								var le1 = 0, le2 = 0, le3 = 0;
								for (let i = 0; i < mydata.length; i++) {
									if (level[i] == 1) {
										le1 = le1 + 1;
									} else if (level[i] == 2) {
										le2 = le2 + 1;
									} else if (level[i] == 3) {
										le3 = le3 + 1;
									}

								}
								  	  console.log("le1="+le1);
								  	  console.log("le2="+le2);
								  	  console.log("le3="+le3);

								//準備圖表的數據  <會員等級與年齡關係分析圖>

								var ctx = document.getElementById("myChart02")
										.getContext("2d");
								//畫圖 <訂單年齡消費金額分析圖>
								var myChart = new Chart(ctx, {
									type : 'polarArea',
									data : {
										labels : [ "Level 1(超過10,000)", "Level 2(超過5,000)", "Level 3(未滿5,000)" ],
										datasets : [ {
											label : '會員等級分布圖',
											data : [ le1, le2, le3 ],
											       backgroundColor : [
													   'rgba(255, 99, 132,0.5)',
													   'rgba(54, 162, 235,0.5)',
													   'rgba(255, 206, 86,0.5)' ],
										} ]
									},
									
									options : {
										title : {
											display : true,
											text : '會員之消費級別分布比例',
											fontSize : 30,
										}
									
									}
								});
							})
					//------------------------------------------
					//圖3的衣服分類銷售圖表
					var jsonData1 = $.ajax({
						url : '/blankShop/OrdersInfoMain/typeAmount',
						type : 'post',
						dataType : 'json'
					}).done(
							function(mydata) {
								console.log(mydata);
								//把資料分成兩個array
								//var data01=JSON.stringify(mydata,null,4);
								//console.log("data01:"+data01);
								//var results=JSON.parse(mydata);
								//console.log("results: "+results);

								var genre = [], amount = [];
								salePrice = [];

								for (let i = 0; i < mydata.length; i++) {
									genre.push(mydata[i].genre);
									amount.push(mydata[i].amount);
									salePrice.push(mydata[i].salePrice);
									//   		  console.log("amount["+i+"]:"+amount[i]);
								}

								//畫圖 <服飾種類總銷售表>
								var ctx = document.getElementById("myChart03")
										.getContext("2d");
								var myChart = new Chart(ctx, {
									type : 'horizontalBar',
									data : {
										labels : genre,
										datasets : [ {
											label : "總銷售額(元)",
											backgroundColor : [ "#3e95cd",
													"#8e5ea2", "#3cba9f",
													"#e8c3b9", "#c45850" ],
											data : salePrice
										} ]
									},
									options : {
										legend : {
											display : false
										},
										title : {
											display : true,
											text : '服飾種類總銷售額表',
											fontSize : 30,
										}
					
									}
								});
							})
					//------------------------------------------------

					//建立一個近七天的銷售額

					//使用json獲取資料
					var jsonData = $.ajax({
						url : '/blankShop/OrdersInfoMain/incomeWeek',
						type : 'post',
						dataType : 'json'
					}).done(
							function(mydata4) {
								console.log("mydata4:" + mydata4);
								//把資料分成兩個array

								var day = [], moneyPer = [];
								for (let i = 0; i < mydata4.length; i++) {
									day.push(mydata4[i].day);
									moneyPer.push(mydata4[i].income);
								}
								//準備圖表數據

								var spentData = {
									labels : day,
									datasets : [ {
										label : "當日總銷售額",
										fill : false,
										data : moneyPer,
										borderWidth : 1,
										borderColor : 'rgba(70, 130, 180,1)',
										//     	              backgroundColor: 'rgba(66, 165, 245, 0.5)',
										//    	              backgroundColor: 'rgba(255, 99, 132, 0.2)',
										backgroundColor : 'rgba(72, 209, 204,0.5)',
									//     	              borderColor: 'rgba(255,160,122,0.5)',

									} ]
								};

								//畫圖 <七天銷售額>

								var ctx = document.getElementById("myChart04")
										.getContext("2d");
								var myChart = new Chart(ctx, {

									type : 'bar',
									data : spentData,
									options : {
										title : {
											display : true,
											text : '七日銷售額統計圖',
											fontSize : 30,
										},
							
// 										scales : {
// 											y : {
// 												beginAtZero : true,
// 											}
// 										}
										animation: {
										      onComplete: function() {
										        var chartInstance = this.chart,
										        ctx = chartInstance.ctx;
										 
										        ctx.font = Chart.helpers.fontString(18, "normal", "'Helvetica Neue', 'Helvetica', 'Arial', sans-serif");
                                                ctx.fillStyle = '#444';
										        ctx.textAlign = 'center';
										        ctx.textBaseline = 'bottom';
										   			 
										        this.data.datasets.forEach(function(dataset, i) {
										          var meta = chartInstance.controller.getDatasetMeta(i);
										          meta.data.forEach(function(bar, index) {
										            var data = dataset.data[index];
										            ctx.fillText(data, bar._model.x, bar._model.y - 5);
										          });
										        });
										      }
										    }
									}

								});
							})

					// 控制顯示與隱藏圖表

					$(function() {
						var $li = $('ul.tab-title li');
						$($li.eq(0).addClass('active').find('a').attr('href'))
								.siblings('.tab-inner').hide();

						$li.click(function() {
							$($(this).find('a').attr('href')).show().siblings(
									'.tab-inner').hide();
							$(this).addClass('active').siblings('.active')
									.removeClass('active');
						});
					});
				})
	</script>

</body>
<style>
.bt {
	width: 200px;
	height: 35px;
	color: #6C6C6C;
	font-size: 20px;
	border-radius: 5px;
	padding: 5px, 5px, 5px, 5px;
	background-color: #D2E9FF;
}

#tab-demo {
	width: 1000px;
	height: 1000px;
}

#tab-demo>ul {
	display: block;
	margin: 0;
	list-style: none;
}

.tab-title {
	list-style: none;
}

#tab-demo>ul>li {
	display: inline-block;
	vertical-align: top;
	font-family: '微軟正黑體';
	margin: 0 -1px -1px 0;
	border: 1px solid #BCBCBC;
	height: 30px;
	line-height: 30px;
	background: #cdcdcd;
	padding: 0 15px;
	list-style: none;
	box-sizing: border-box;
}

#tab-demo>ul>li a {
	color: #000;
	text-decoration: none;
}

#tab-demo>ul>li.active {
	border-bottom: 1px solid #fff;
	background: #fff;
}

#tab-demo>.tab-inner {
	clear: both;
	color: #000;
	border: 1px #BCBCBC solid;
}

.tab-inner {
	padding: 16px;
	height: 50px;
}
</style>
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
</html>