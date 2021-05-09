/**
 * 
 */

$(document).ready(function() {

	function editProduct() {
		var formdata = new FormData($('#updateForm')[0]);

		$.ajax({
			url: '/blankShop/backEnd/product/'
				+ $('#typeId').val(),
			type: 'PUT',
			datatype: 'json',
			data: formdata,
			cache: false,
			traditional: true,
			contentType: false,
			processData: false,
			success: function(data) {
				swal("更新成功","","success",{button:"確定"})
			},
			error: function() {
				swal("更新失敗","","error",{button:"確定"})
			}
		});


	}
	
	dialog = $("#updatedialog").dialog({
		autoOpen: false,
		height: 800,
		width: 750,
		modal: true,
		buttons: {
			"修改": editProduct,
			"取消": function() {
				dialog.dialog("close");
			}
		},
		close: function() {
			form[0].reset();
		
		}
	});

	form = dialog.find("form").on("submit",
		function(event) {
			event.preventDefault();
			editProduct();
		});

	//更新鍵
	$("#editButton").button().on("click", function() {
		dialog.dialog("open", function() {
		});

		$.ajax({
			url: "/blankShop/backEnd/product/"+selectId,
			type: "GET",
			dataType: "json",
			success: function(data) {
				$('#typeId').val(data["typeId"]);
				$('#productName').val(data["productName"]);
				$('#productID').val(data["productID"]);
				$('#colorCode').val(data["colorCode"]);
			}
		})
	});
});

