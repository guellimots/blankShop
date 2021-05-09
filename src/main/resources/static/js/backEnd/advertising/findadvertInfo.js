/**
 * 
 */
$(document).ready(function() {


	$("#updateTitle").hide();
	$("#showimg").hide();

	printTable()
	function printTable() {
		$('#imgDetail').DataTable(
				{
					"sAjaxSource": "/blankShop/advertisting/select_advertisingInfo",
					"destroy": true,
					"rowId":"id",
					"sAjaxDataProp": "",
					"aoColumns": [
						{"mData": "id"}, 
						{"mData": "title"}, 
						{"mData": "status"}, 
						{"mData": "createDate"}, 
						{"mData": "modifDate"}
					]
				});

	}


	var selectId
	var table = $('#imgDetail').DataTable();
	//選取列
	$('#imgDetail').on('click', 'tbody tr',
		function() {

			$(this).css('background-color', '#BEBEBE')
			selectId = ($(this).attr("id"))
			if ($(this).attr('class') == 'odd')
				$(this).css('background-color', '#f9f9f9')
			else
				$(this).css('background-color', '#fff')
			console.log(selectId)
			//判斷是否重複
			function isRepeat(arr) {
				var hash = {};
				for (var i in arr) {
					if (hash[arr[i]])
						return true;
					hash[arr[i]] = true;
				}
				return false;
			}

			$("#updateTitle").show(); //顯示更新資料
			$.ajax({
				url: "/blankShop/advertisting/select_advertisingInfo/"
					+ selectId,
				type: "GET",
				dataType: "json",
				success: function(data) {
					$('#id').val(data["id"]);
					$('#title').val(data["title"]);
					$('#status').val(data["status"]);
				}
			})
			$("#showimg").show(); //顯示圖片
			$.ajax({
				url:"/blankShop/advertisting/advertisingImg/"+selectId,
				type:"GET",
				contentType: 'application/json; charset=utf-8',
				success: function(data, textStatus, xhr){
					$('#imgInfo').attr("src","data:image/jpeg;base64,"+ data);				
				},
				error: function(data, textStatus, xhr){
					swal("查詢失敗","","error",{button:"確定"})
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

	var form //更新資料 ajax post DB
	$("#updatebutton").click(function editAdvertising() {
		var formdata = new FormData($("#updateform")[0]);

		$.ajax({
			url: '/blankShop/advertisting/updateadvertisingImg',
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
				table.ajax.reload()
				$("#updateTitle").hide();
				$("#showimg").hide();
			},
			error: function() {
				swal("更新失敗","","error",{button:"確定"})
			}
		});

	})




});
