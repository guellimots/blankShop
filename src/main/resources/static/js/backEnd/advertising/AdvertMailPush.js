
$(document).ready(function(){


	$("#previewImg").hide();

		function readURL(input){
			if(input.files && input.files[0]){
				var reader = new FileReader();
				reader.onload = function(e){
				$("#previewImg").attr("src",e.target.result);
			}
			$("#previewImg").show();
		}
		reader.readAsDataURL(input.files[0]);
	}
	$("#image").change(function(){
		readURL(this);
	});

    mailMemberTable()
	function mailMemberTable() {
		$('#memberInfo').DataTable(
            {
			    "sAjaxSource": "/blankShop/mem/showAllMembers",
			    "destroy": true,
			    "rowId":"memberId",
			    "sAjaxDataProp": "",
			    "aoColumns": [		
				    { "mData": "memberId" },
				    { "mData": "memberName" },
				    { "mData": "birthday" },
				    { "mData": "cellNumber" },
				    { "mData": "email" },
				    { "mData": "address" }
			    ]
            }
        );
	}

    var selectId
	var table = $('#memberInfo').DataTable();
	$('#memberInfo').on('click', 'tbody tr',
		function() {
			$(this).css('background-color', '#BEBEBE')
			//selectId = parseInt(this.textContent.substring(0, 1))	
			selectId = ($(this).attr("id"))
			if ($(this).attr('class') == 'odd'){
				$(this).css('background-color', '#f9f9f9')
			}else{
				$(this).css('background-color', '#fff')
			}
			//判斷是否包含中文
			function isChina(s) {
			var patrn = /[\u4E00-\u9FA5]|[\uFE30-\uFFA0]/gi;
			if (!patrn.exec(s)) {
				return false;
			} else {
				return true;
			}
		}
		$.ajax({
			url: "/blankShop/AdvertMailPage/findMemberMail/"+selectId,
			type: "GET",
			dataType: "json",
			success: function(data) {
				$('#to').val(data["email"]);
			}
		})
	})


	check()
	var re;
	function check(){
		re = $("#sendrs").val();
		if(re == "廣告已送出"){
			swal("成功","","success",{button:"確定"});
		}
		if(re == "廣告送出失敗"){
			swal("失敗","","error",{button:"確定"});
		}
	}


})





 