/**
 * 
 */
$(document).ready(function() {

	$("#updateOrder").hide();

	orderTable()
	function orderTable() {
		$('#orderTable').DataTable({
			"sAjaxSource": "/blankShop/OrdersInfoMain/getorders",
			"destroy": true,
			"rowId":"orderIdentity",
			"sAjaxDataProp": "",
			"aoColumns": [		
				{ "mData": "orderIdentity" },
				{ "mData": "orderId" },
				{ "mData": "typeId" },
				{ "mData": "memberId" },
				{ "mData": "price" },
				{ "mData": "amount" },
				{ "mData": "orderStatus" },
				{ "mData": "paymentInfo" },
				{ "mData": "address" },
				{ "mData": "createDate" },
				{ "mData": "modifDate" }
			]

		});

	}

	var selectId
	var table = $('#orderTable').DataTable();
	$('#orderTable').on('click', 'tbody tr',
		function() {

			$(this).css('background-color', '#BEBEBE')
			//selectId = parseInt(this.textContent.substring(0, 1))	
			selectId = ($(this).attr("id"))
			if ($(this).attr('class') == 'odd'){
				$(this).css('background-color', '#f9f9f9')
			}else{
				$(this).css('background-color', '#fff')
			}
			console.log(selectId)
			function isRepeat(arr) {
				var hash = {};
				for (var i in arr) {
					if (hash[arr[i]])
						return true;
					hash[arr[i]] = true;
				}
				return false;
			}

			$("#updateOrder").show();
			$.ajax({
				url: "/blankShop/OrdersInfoMain/getordersId/"+ selectId,
				type: "GET",
				dataType: "json",
				success: function(data) {
					$('#pkid').val(data["orderIdentity"]);
					$('#id').val(data["orderId"]);
					$('#status').val(data["orderStatus"]);
				}

			})

		})
	//判斷是否包含中文
	function isChina(s) {
		var patrn = /[\u4E00-\u9FA5]|[\uFE30-\uFFA0]/gi;
		if (!patrn.exec(s)) {
			return false;
		} else {
			return true;
		}
	}

	var form
	$("#updatebutton").click(function editAdvertising() {
		var formdata = new FormData($("#updateform")[0]);

		$.ajax({
			url: '/blankShop/OrdersInfoMain/updateorders',
			type: 'PUT',
			datatype: 'json',
			data: formdata,
			cache: false,
			traditional: true,
			contentType: false,
			processData: false,
			success: function(data) {
				swal("更新成功","","success",{button:"確定"})
				//				table.clear().draw()
				$("#updateform")[0].reset()
				$("#updateOrder").hide();
				table.ajax.reload()
			},
			error: function() {
				swal("更新失敗","","error",{button:"確定"})
			}
		});

		

	})



	var memselectId;
    $("#orderTable").on("mouseenter",'tbody tr td:nth-child(4)',function(){
		
        memselectId = $(this).html();
        memberDialog.dialog("open");
	    memberDialog.dialog( "option", "maxWidth", 900 );
    })

	$('#orderTable').on('mouseleave','tbody  tr td:nth-child(4)',function () {	
		memselectId = null
		memberDialog.dialog("close");
		memberDialog.dialog("destory");
	})

	var memberDialog
	memberDialog = $("#memberDialog").dialog({
		autoOpen: false,
		height: 280,
		width: 400,
		modal: false,
		resizable:false,					
		open:function(){
		$(".ui-dialog-titlebar-close").hide();
		$.ajax({
			url: "/blankShop/OrdersInfoMain/getordememberId/"+ memselectId,
			type: "GET",
			dataType: "json",
			success: function (data) 
			{
			$('#title').html(data["memberName"])
			$("#disid").html(data["memberId"])
			$("#disphone").html(data["cellNumber"])
			$("#dismail").html(data["email"])
			$("#disaddress").html(data["address"])		
			}
		})
		}
	})


	var pdselectId;
    $("#orderTable").on("mouseenter",'tbody tr td:nth-child(3)',function(){
		
        pdselectId = $(this).html();
        productDialog.dialog("open");
	    productDialog.dialog( "option", "maxWidth", 900 );
    })

	$('#orderTable').on('mouseleave','tbody  tr td:nth-child(3)',function () {	
		pdselectId		
		productDialog.dialog("close");
		productDialog.dialog("destory");
	})

	var productDialog
	productDialog = $("#productDialog").dialog({
		autoOpen: false,
		height: 270,
		width: 520,
		modal: false,
		resizable:false,					
		open:function(){
		$(".ui-dialog-titlebar-close").hide();
		$.ajax({
			url: "/blankShop/OrdersInfoMain/getordproductId/"+ pdselectId,
			type: "GET",
			dataType: "json",
			success: function (data) 
			{
			$('#pdname').html(data["productName"])		
			$("#pdsize").html(data["size"])
			$("#pdprice").html(data["productPrice"])
			$("#pdgenre").html(data["genre"])
			$("#pdsalrprice").html(data["salePrice"])		
			}
		})
		}
	})


});

