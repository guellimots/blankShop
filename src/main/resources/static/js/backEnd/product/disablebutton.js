$(document).ready(function(){
    disablebtn()

    //判斷職員權限
    function disablebtn(){
        $.ajax({
            url: "/blankShop/backEnd/disablebutton",
				type: "GET",
				dataType: "json",
				success: function(data) {
                    if(data != true){
                        //下架鍵
                        $("#downButton").attr("disabled", true);                    
                        $("#downButton").css('color', 'lightgray');
                        //上架鍵
                        $("#pullButton").attr("disabled", true);
                        $("#pullButton").css('color', 'lightgray');                    
                    }
			    }
            })
    }
})