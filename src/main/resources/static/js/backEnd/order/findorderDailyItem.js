$(document).ready(function(){
 
    getDailyOrderPrice()
    getDailyOrder()
    getAllMember()
    getAllproduct()

    function getDailyOrderPrice(){
        $.ajax({
            url: "/blankShop/OrdersInfoMain/getordDaytotalOrder",
				type: "GET",
				dataType: "json",
				success: function(data) {
                    $("#DailyOrder").html(data)
            }
        })
    }

    function getDailyOrder(){
        $.ajax({
            url: "/blankShop/OrdersInfoMain/getordDaytotalPrice",
				type: "GET",
				dataType: "json",
				success: function(data) {
                    $("#DailyOrderPrice").html(data)
            }
        })
    }

    function getAllMember(){
        $.ajax({
            url: "/blankShop/backEnd/getallMember",
				type: "GET",
				dataType: "json",
				success: function(data) {
                    $("#totalMember").html(data)
            }
        })
    }


    function getAllproduct(){
        $.ajax({
            url: "/blankShop/backEnd/product/getproductamount",
				type: "GET",
				dataType: "json",
				success: function(data) {
                    $("#totalProduct").html(data)
            }
        })
    }

})