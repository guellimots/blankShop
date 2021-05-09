$(document).ready(function(){
	loginResult()
	var re;
	function loginResult(){
		re = $("#resultmsg").val();
		if(re == "警告: 帳號或密碼輸入有誤"){
			swal("警告: 帳號或密碼輸入有誤","","error",{button:"確定"});
		}
	}
})