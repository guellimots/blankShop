$(document).ready(function(){

    //重新整理功能
    $("#f5").click(function(){
        window.location.reload();
    })

    var createmsgDialog, createForm
    createmsgDialog = $("#create-form").dialog({
        autoOpen: false,
        height: 180,
        width: 650,
        modal: true,
        resizable:false,
        buttons: {
            "送出 ": function(){  
                $.ajax({
                        url: "/blankShop/backEnd/InsertMessage?msg="+$("#msg").val(),
                        type: "POST",
                        dataType: "json",
                        success: function(data) { 
                           swal("新增成功","","success",{button:"確定"}).then(function(){
						   parent.window.location.reload();
                           createmsgDialog.dialog("close")
						   })          
                    }
                })
            },
            "關閉": function () {
                createmsgDialog.dialog("close");
            }
        }   
    });

    $("#annousment").click(function(){
        $(".ui-dialog-titlebar-close").hide();
        createmsgDialog.dialog("open");
	    createmsgDialog.dialog( "option", "maxWidth", 900 );
    })

    var messageDialog
	    messageDialog = $("#messageDialog").dialog({
		autoOpen: false,
		height: 150,
		width: 300,
		modal: false,
		resizable:false
	})
	    
	    
	//將登入者empID送到employeeController    		
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
	//將登入者empID送到AttendanceController  
	postIDatt();
	var ID
	function postIDatt() {
	ID = $("#empid").val();
	$.ajax({
	    	url : "/blankShop/holiday/loginID/" + ID,
	        type : "GET",
	    	dataType : "json",
	    	success : function() {
	    			}
	       })
	}
	
	    		
	    
	    
	    
})