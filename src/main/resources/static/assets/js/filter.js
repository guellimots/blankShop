

$('#filterSubmit-btn').click(
    function(e){
    
        e.preventDefault();

        var filterList={
                    tops:"0",   
                    shirts:"0",
                    trousers:"0",
                    dresses:"0",
                    minPrice:"0",
                    maxPrice:"0",
                    leisure:"0",
                    date:"0",
                    workPlace:"0"
        };

        $('#genreFilter input').each(
            function(){
                if($(this).prop("checked")==true){
                    filterList[$(this).val()]="1";
                }
            }
        );

        $('#purposeFilter input').each(
            function(){
                if($(this).prop("checked")==true){
                    filterList[$(this).val()]="1";
                }
            }
        );

        
        var priceRange=$('#priceFilter input').val();

        if(priceRange!=''){
            var rangeArr=priceRange.split(/\s+/);
            filterList.minPrice=rangeArr[1];
            filterList.maxPrice=rangeArr[4];
        }

        console.log(filterList);

        $.ajax({
            data: JSON.stringify(filterList),
            url: '/blankShop/frontEnd/products/pageFilter',                        
            type: 'POST',
            contentType:"application/json",         
            dataType:'json',
            error: function (xhr, status, error) { 
            console.log(error);
            },    
            success: function (data) {

                console.log(data);
    
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
    }
);
