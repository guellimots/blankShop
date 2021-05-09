
$(document).ready(function() {	
	
	$("#but01").click(function(){
	        if($("#address").val()==""){
	            alert("地址不可空白");
	            return false; 
	        }else if($("#cellNumber").val()==""){
	            alert("電話不可空白");
	            return false; 	  
	        }else{
	        	 checkForm();
	        }
	    })		
				
		
	});

function checkForm(){
	var alertMsg="確認要更新嗎?\n";

  if(confirm(alertMsg)==true) {   
	  return true;
  }else {  
    return false;
  }
} 

function KeyIn() {
	document.getElementById("cellNumber").value = "0957-575-757";
	document.getElementById("address").value = "106088 大安區仁愛路三段53號";
	//取消所有onblur	
	$("#cellNumber").removeAttr("onblur");
	$("#address").removeAttr("onblur");
	
	document.getElementById("verifyAddressResult").innerHTML ="";
	document.getElementById("verifyCellResult").innerHTML ="";

}




	//檢查手機號碼 須為全數字及10位數
function checkCellNumber() {
	let cellValue = document.getElementById("cellNumber").value;
	let resultSpan = document.getElementById("verifyCellResult");
	B1 = new Array("0", "1", "2", "3", "4", "5", "6", "7", "8", "9","-");
	let k = 0;

	if (cellValue.length != 12) {
		resultSpan.style.color = "brown";
		resultSpan.innerHTML = "\u2716 長度為12須如 0911-234-789 "
		document.getElementById("cellNumber").value = "";
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
		resultSpan.style.color = "brown";
		resultSpan.innerHTML = "\u2716 12碼須如 0911-234-789 "
		document.getElementById("cellNumber").value = "";
	}
}
	

		//檢查住址 不能有亂碼
			function checkAddress() {
				let roadValue = document.getElementById("address").value;
				let resultSpan = document.getElementById("verifyAddressResult");
				var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？%]");
				var result = roadValue.match(pattern);

				if (roadValue == "") {
					resultSpan.style.color = "brown";
					resultSpan.innerHTML = "\u2716 請勿空白"
				}
				else {
					if (!result) {
						resultSpan.style.color = "green";
						resultSpan.innerHTML = "\u25EF 正確";
					}
					else {
						resultSpan.style.color = "brown";
						resultSpan.innerHTML = "\u2716 請勿輸入特殊字元"
						document.getElementById("address").value = "";
					}
				}
			}
			
			
