/**
 * 
 */


$(document).ready(function(){
    checkemp()

    //判斷職員權限
    var emp
    function checkemp(){
        emp = $("#empid").val();
        $.ajax({
            url: "/blankShop/backEnd/checkemprank/"+emp,
				type: "GET",
				dataType: "json",
				success: function(data) {
                    if(data != true){    
                        $("#insertphoto").hide();
                        $("#sendemail").hide();               
                        $("#insertemp").hide();
                        $("#findemp").hide();
                        $("#annousment").hide();
                        $("#UpButton").hide();
                    }
					
				}
        })
    }

})