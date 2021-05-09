$(document).ready(function(){

    message()
    function message(){
        $.ajax({
            url: "/blankShop/backEnd/showannouncement",
				type: "GET",
				dataType: "json",
				success: function(data) {
                    $("#marqueeMsg").html(data["msg"])
				}
        })
    }

})