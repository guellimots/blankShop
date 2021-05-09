function onLoad() {
	gapi.load('auth2', function() {
		gapi.auth2.init();
	});
}


function logOut() {
	var auth2 = gapi.auth2.getAuthInstance();
	auth2.signOut().then(function() {
		window.location.href = "/blankShop/frontEnd/logOut";
	});


}

var logOutBtn = document.getElementById("logout-btn");
logOutBtn.addEventListener("click", logOut);


if(localStorage.getItem('cartItems')==null){
	$(".count-style").css('visibility','hidden');
	$(".cart-price").html('0');
}
else{
    var cartItems=JSON.parse(localStorage.getItem('cartItems'));
	var amount=0;
	var total=0;
	for (var i=0; i<cartItems.length; i++){
		amount+=parseInt(cartItems[i].amount);
		total+=parseInt(cartItems[i].price)*parseInt(cartItems[i].amount);
	}
	
	$(".count-style").css('visibility','visible');
	$(".count-style").html(amount.toString());
	$(".cart-price").html(total.toString());
}



$(document).ready(function(){

	var urlEle=document.getElementById("urlIndex");
	
	var urlIndex=urlEle.value;

	var ajaxUrl=null;
    
	switch(urlIndex) {
	    case "1":
	    ajaxUrl="/blankShop/frontEnd/products/getIndex/1"
	    break;

	    case "2":
	    ajaxUrl="/blankShop/frontEnd/products/getIndex/2"
	    break;
	    
	    case "3":
	    ajaxUrl="/blankShop/frontEnd/products/getIndex/3"
	    break;
	    
	    case "4":
	    ajaxUrl="/blankShop/frontEnd/products/getIndex/4"
	    break;

	    case "5":
	    ajaxUrl="/blankShop/frontEnd/products/getIndex/5"
	    break;

	    case "6":
	    ajaxUrl="/blankShop/frontEnd/products/getIndex/6"
	    break;

	    case "7":
	    ajaxUrl="/blankShop/frontEnd/products/getIndex/7"    
	    break;
	}



	$.ajax({
		url: ajaxUrl,                        
		type: 'GET',                    
		dataType:'json',
		// error: function (xhr, status, error) { 
		// 	console.log(error);
		// },    
		success: function (data) {

			$('#shop-1').pagination({
				pageSize:9,
				dataSource: data,
				showNavigator: true,
				formatNavigator: '第<%= currentPage %>頁，共<%= totalPage %>頁，共<%= totalNumber %>項結果',
				callback: function (data, pagination) {
		
							var html = "";
							$.each(data, function (index, item) {
				
								var pdName=item.productName;
								var pdPrice=item.productPrice;
								var pdSalePrice=item.salePrice;
				
								if(pdSalePrice=="0"){
									pdSalePrice=pdPrice;
									pdPrice="";
								}
				
								pdSalePrice="NT$ "+pdSalePrice;
								if(pdPrice!=""){
									pdPrice="NT$ "+pdPrice;
								}
				
				
								var pdGenre=item.genre;
								var pdLink="/blankShop/frontEnd/product/"+item.productID;
								var pdImg=item.productImgDir1;
				
								html += `
								<div class="col-xl-4 col-md-6 col-lg-6 col-sm-6">
									<div class="ht-product ht-product-action-on-hover ht-product-category-right-bottom mb-30">
															<div class="ht-product-inner">
																<div class="ht-product-image-wrap">
																	<a href="${pdLink}" class="ht-product-image"> <img src="${pdImg}" alt="Universal Product Style"> </a>
																	<div class="ht-product-action">
																		<ul>
																			<li><a href="#" data-toggle="modal" data-target="#exampleModal"><i class="sli sli-magnifier"></i><span class="ht-product-action-tooltip">Quick View</span></a></li>
																		</ul>
																	</div>
																</div>
																<div class="ht-product-content">
																	<div class="ht-product-content-inner">
																		<div class="ht-product-categories"><a href="#">${pdGenre}</a></div>
																		<h4 class="ht-product-title"><a href="${pdLink}">${pdName}</a></h4>
																		<div class="ht-product-price">
																			<span class="new">${pdSalePrice}</span>
																			<span class="old">${pdPrice}</span>
																		</div>
																	</div>
																	<div class="ht-product-action">
																		<ul>
																			<li><a href="#"><i class="sli sli-magnifier"></i><span class="ht-product-action-tooltip">Quick View</span></a></li>
																		</ul>
																	</div>
																</div>
															</div>
									</div>
								</div>
								`;
							});
							
							$('#dataContainer1').html(html);
		
				}
			})


			$('#shop-2').pagination({
				pageSize:4,
				dataSource: data,
				showNavigator: true,
				formatNavigator: '第<%= currentPage %>頁，共<%= totalPage %>頁，共<%= totalNumber %>項結果',
				callback: function (data, pagination) {

		
							var html = "";
							$.each(data, function (index, item) {
				
								var pdName=item.productName;
								var pdPrice=item.productPrice;
								var pdSalePrice=item.salePrice;
				
								if(pdSalePrice=="0"){
									pdSalePrice=pdPrice;
									pdPrice="";
								}
				
								pdSalePrice="NT$ "+pdSalePrice;
								if(pdPrice!=""){
									pdPrice="NT$ "+pdPrice;
								}
				
				
								var pdGenre=item.genre;
								var pdLink="/blankShop/frontEnd/product/"+item.productID;
								var pdImg=item.productImgDir1;
								var pdDis=item.productDiscription1;
				
								html += `
								<div
										class="shop-list-wrap shop-list-mrg2 shop-list-mrg-none mb-30">
										<div class="row">
											<div class="col-lg-4 col-md-4">
												<div class="product-list-img">
													<a href="${pdLink}"> <img
														src="${pdImg}"
														alt="Universal Product Style">
													</a>
													<div class="product-quickview">
														<a href="#" title="Quick View" data-toggle="modal"
															data-target="#exampleModal"><i
															class="sli sli-magnifier-add"></i></a>
													</div>
												</div>
											</div>
											<div class="col-lg-8 col-md-8 align-self-center">
												<div class="shop-list-content">
													<h3>
														<a href="${pdLink}">${pdName}</a>
													</h3>
													${pdDis}
													<span>${pdGenre}</span>
													<div class="shop-list-price-action-wrap">
														<div class="shop-list-price-ratting">
															<div class="ht-product-list-price">
																<span class="new">${pdSalePrice}</span> <span class="old">${pdPrice}</span>
															</div>
														</div>
														<div class="ht-product-list-action">
															<a class="list-cart" title="Add To Cart" href="${pdLink}"><i
																class="sli sli-eye"></i>檢視商品</a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								`;
							});
							
							$('#dataContainer2').html(html);
		
				}
			})


		}
	});



	
});


