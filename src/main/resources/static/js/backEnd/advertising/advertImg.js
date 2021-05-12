/**
 * 
 */

$(document).ready(function(){
	check()
	var re;
	function check(){
		re = $("#resultmsg").html();
		if(re == "上傳成功"){
			swal("新增成功","","success",{button:"確定"}).then(function(){
				$('#resultmsg').css('display','none')
			});
		}
		if(re == "上傳失敗"){
			swal("新增失敗","","error",{button:"確定"}).then(function(){
				$('#resultmsg').css('display','none');
		}
	}
})



