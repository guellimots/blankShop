var total = 0;
var cartItemsObj = JSON.parse(localStorage.getItem('cartItems'));
for (var i = 0; i < cartItemsObj.length; i++) {
    var content = `<li class="single-shopping-cart" id=li${i}>
                                                      <div class="shopping-cart-img">
                                                          <a href="#" ><img src="${cartItemsObj[i].productImg}"
                                                              /></a>
                                                          
                                                      </div>
                                                      <div class="shopping-cart-title">
                                                          <h4>
                                                              <a href="#">${cartItemsObj[i].productName}</a>
                                                          </h4>
                                                          <span >數量: ${cartItemsObj[i].amount} 價格: $ ${cartItemsObj[i].price}</span>
                                                      </div>
                                                      <div class="item-close">
                                                          <a href="#"><i class="sli sli-close" id="dele${i}"></i></a>
                                                      </div>
                                                  </li>`;


    total += parseInt(cartItemsObj[i].amount) * parseInt(cartItemsObj[i].price);
    $("#cart1").append(content);

    document.getElementById("dele" + i).addEventListener("click", function (e) {

        var getIndex1 = parseInt(e.target.id.replace("dele", ""))

        Swal.fire({
            title: '確定要刪除此商品嗎?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            cancelButtonText: '取消',
            confirmButtonText: '確認刪除'
        }).then((result) => {
            if (result.isConfirmed) {
                $("#li" + getIndex1).empty();
                localStorage.clear();
                cartItemsObj.splice(getIndex1, 1);
                console.log(cartItemsObj);
                localStorage.setItem("cartItems", JSON.stringify(cartItemsObj));
                location.reload();
                //    $("#cartContent").attr("class","shopping-cart-content-active")
            }
        }

        )
    })

}

$("#subtotal").html(total);
//$("#cartCount").html(i);
//$("#crartTotalPrice").html(total);
