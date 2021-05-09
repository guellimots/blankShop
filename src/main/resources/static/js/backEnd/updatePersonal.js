//送出前檢查表格

	var finalMobile=0;
	var finalAdd=0;
	
	
	$("#but01").mousedown(function(){
		
	var frm = document.forms["form1"];
// function submitTest() {

	  document.getElementById("verifyMobileResult").innerHTML ="";
	  document.getElementById("verifyAddressResult").innerHTML ="";
	   
		function CheckForm()
		{

		  if(confirm("確認更新？")==true)   
		     frm.submit();
		  else {  
			  return false;		  
		  }
		} 
	  
	  
	  checkAddress();
	  checkMobile();
	  if(finalAdd==0) {
		  if(finalMobile==0) 
		    { 	CheckForm()}
	  } else
		  return false;
	      
	});	


function KeyIn() {
    document.getElementById("mobile").value = "0977-222-111";
    document.getElementById("address").value = "241083 新北市三重區市民大道100巷30號5樓";

	}

			
		//檢查住址 不能有亂碼
function checkAddress() {
		let roadValue = document.getElementById("address").value;
		let resultSpan = document.getElementById("verifyAddressResult");
		var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？%]");
		var result = roadValue.match(pattern);

		if (roadValue == "") {
			finalAdd=1;
			resultSpan.style.color = "brown";
			resultSpan.innerHTML = "\u2716 請勿空白"
			eval("document.form1['address'].focus()")
			alert("地址空白無效!!")
		    return false;
		}
		else {
			if (!result) {
				resultSpan.style.color = "green";
				resultSpan.innerHTML = "\u25EF 格式正確";
			}
			else {
				resultSpan.style.color = "brown";
				resultSpan.innerHTML = "\u2716 請勿輸入特殊字元"
				alert("地址輸入無效!!")
				eval("document.form1['address'].focus()")
				finalAdd=1;
				return false;
			}
		}
			}
					
//檢查手機號碼 須數字及兩個-組成12位數
function checkMobile() {
	let cellValue = document.getElementById("mobile").value;
	let resultSpan = document.getElementById("verifyMobileResult");
	B1 = new Array("0", "1", "2", "3", "4", "5", "6", "7", "8", "9","-");
	let k = 0;

	if (cellValue.length != 12) {
		finalMobile=1;
		resultSpan.style.color = "brown";
		resultSpan.innerHTML = "\u2716 長度為12須如 0911-234-789 "
		document.getElementById("mobile").value = "";
		alert("電話格式錯誤!!將復原!!")
		eval("document.form1['mobile'].focus()")
		return false;
	}
	for (let i = 0; i < 12; i++) {
		for (let j = 0; j < 11; j++) {
			if (cellValue.charAt(i) == B1[j]) {
				k++;
			}
		}
	}
	if (k == 12) {
		resultSpan.style.color = "green";
		resultSpan.innerHTML = "\u25EF 正確";
	} else {
		finalMobile=1;
		resultSpan.style.color = "brown";
		resultSpan.innerHTML = "\u2716 12碼須如 0911-234-789 "
		document.getElementById("mobile").value = "";
		alert("電話格式錯誤!!須為09xx-xxx-xxx !!!!")
		eval("document.form1['mobile'].focus()")
		return false;
		
	}
}

function showUpload(event) {
	var reader = new FileReader();
	
	reader.onload = function() {
		var previewArea = document.getElementById('previewArea');
		previewArea.src = reader.result;
	};
	reader.readAsDataURL(event.target.files[0]);

}

