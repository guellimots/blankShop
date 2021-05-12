
//計算是否submit前有無帳號重複, email與身分證與db重複阻止submit
var errorEmail=0;
var errorNumber=0;

//送出前檢查表格
$(document).ready(function() {	
	
	$("#but01").click(function(){
	
	document.getElementById("verifyNameResult").innerHTML ="";
	document.getElementById("verifyMobileResult").innerHTML ="";
	document.getElementById("verifyBirthResult").innerHTML ="";
	document.getElementById("verifyHireDateResult").innerHTML ="";
	document.getElementById("verifyEmailResult").innerHTML ="";
	document.getElementById("verifyPersonIDResult").innerHTML ="";
	document.getElementById("verifyAddressResult").innerHTML ="";
	document.getElementById("verifyPasswordResult").innerHTML ="";
	
	

	        if($("#empName").val()==""){
	            alert("未填寫姓名");
	            eval("document.form1['empName'].focus()");
	            return false; 
	        }else if($("#mobile").val()==""){
	            alert("未填寫電話");
	            eval("document.form1['mobile'].focus()"); 
	            return false; 
	        }else if($("#address").val()==""){
	            alert("未填寫地址");
	            alert($("#personID").val());
	            eval("document.form1['address'].focus()");
	            return false; 
	        }else if($("#password").val()==""){
	            alert("未填寫密碼");
	            eval("document.form1['password'].focus()");  
	            return false; 
	        }else if($("#personID").val()==""){
	            alert("未填寫身分證");
	            eval("document.form1['personID'].focus()");
	            return false; 
	        }else if($("#email").val()==""){
	            alert("未填寫email");
	            eval("document.form1['email'].focus()")
	            return false; 
	        }else if($("#birthday").val()==""){
	            alert("未填寫生日");
	            eval("document.form1['birthday'].focus()") ;
	            return false; 
	        }else if($("#hireDate").val()==""){
	            alert("未填寫到職日");
	            eval("document.form1['hireDate'].focus()");
	            return false;          
	        }else if($("#email").val()!="") {
	        	checkMailValid()
	        //	alert("errorEmail: "+errorEmail)
	        	document.getElementById("verifyEmailResult").innerHTML ="";
	        	if(errorEmail!=0) {
	        	alert("Email不得重複!!請檢查!!")
	            eval("document.form1['email'].focus()")
	            return false; }
	        	else if($("#personID").val()!="") {
	        		checkIdentID()
		        	document.getElementById("verifyPersonIDResult").innerHTML ="";
		        	if(errorNumber==1) {
		        	alert("身分證不得重複!!請檢查!! ")
		            eval("document.form1['personID'].focus()")
		            return false; }
	        	}
	        
	        }else if($("#personID").val()!="") {
	        	checkIdentID()
	        	document.getElementById("verifyPersonIDResult").innerHTML ="";
	        	if(errorNumber==1) {
	        		
	        	  alert("身分證不得重複!!請檢查!! ");
	              eval("document.form1['personID'].focus()");
	            return false; 
	            }
	        	else if($("#email").val()!="") {
	        		checkMailValid()
	    	        //	alert("errorEmail: "+errorEmail)
	    	        document.getElementById("verifyEmailResult").innerHTML ="";
	    	        if(errorEmail!=0) {
	    	        alert("Email不得重複!!請檢查!!")
	    	        eval("document.form1['email'].focus()")
	    	        return false; }
	        	}
	        }else {
	        	CheckForm()
//	            document.form1.submit();
	        }
	    })		
		
	});
		
function CheckForm()

{

  if(confirm("確認新增一筆員工？")==true)   
	  document.form1.submit();
  else  
    return false;
} 

//});
function KeyIn() {
		document.getElementById("mobile").value = "0921-477-301";
		document.getElementById("empName").value = "陳時中";
		document.getElementById("password").value = "@!!1%3abc";
		document.getElementById("personID").value = "O154700304";
		document.getElementById("birthday").value = "1954-12-10";	
		document.getElementById("hireDate").value = "2022-03-15";	
		document.getElementById("address").value = "100030 台北市中正區林森南路6號";
		document.getElementById("email").value = "clock@gmail.com";	
		document.getElementById("verifyNameResult").innerHTML ="";
		document.getElementById("verifyMobileResult").innerHTML ="";
		document.getElementById("verifyBirthResult").innerHTML ="";
		document.getElementById("verifyHireDateResult").innerHTML ="";
		document.getElementById("verifyEmailResult").innerHTML ="";
		document.getElementById("verifyPersonIDResult").innerHTML ="";
		document.getElementById("verifyAddressResult").innerHTML ="";
		document.getElementById("verifyPasswordResult").innerHTML ="";
		
		 isValid()

}
 function isValid() {
 //檢查姓名
 //function checkName() 
 	//按下submit前會alert(errormsg)
 	
 	checkName();
 	checkPassword();
 	checkIdentID();
 	checkDate();
 	checkMobile();
 	checkAddress();
 	checkEmail();
 	checkDate1();
 }
	
//檢查姓名
function checkName() {
	let nameValue = document.getElementById("empName").value;
	let resultSpan = document.getElementById("verifyNameResult");

    if (nameValue == "") {
		resultSpan.style.color = "brown";
		resultSpan.innerHTML = "\u2716 姓名不可為空白";		
		}
		else if (nameValue.length >= 2) {
			let flag = true;
			for (let i = 0; i < nameValue.length; i++) {
				let charUni = nameValue.charCodeAt(i);
				if ((charUni < 0x4E00) || (charUni > 0x9FFF)) {
					resultSpan.style.color = "brown";
					resultSpan.innerHTML = "\u2716 姓名須皆為中文字";
					document.getElementById("empName").value = "";
					flag = false;
					break;
				}
			}
			if (flag) {
				resultSpan.style.color = "green";
				resultSpan.innerHTML = "\u25EF 格式正確";
			}

		}
		else {

			let charUni = nameValue.charCodeAt(0);
			if (((charUni < 0x4E00) || (charUni > 0x9FFF))) {
				resultSpan.style.color = "brown";
				resultSpan.innerHTML = "\u2716 姓名須至少為兩個字且須為中文字";
				document.getElementById("empName").value = "";
			}
			else {
				resultSpan.style.color = "brown";
				resultSpan.innerHTML = "\u2716 姓名須至少為兩個字";
				document.getElementById("empName").value = "";

			}
		}
	}

	//檢查密碼
function checkPassword() {

	let re = /^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)(?=.*[!@#$%^&*]+.*).{6,}$/;

	let passwordValue = document.getElementById("password").value;
	let resultSpan = document.getElementById("verifyPasswordResult");

	if (passwordValue == "") {
		resultSpan.style.color = "brown";
		resultSpan.innerHTML = "\u2716 密碼不可為空白";
	}
	else if (passwordValue.length >= 6) {
		if (re.test(passwordValue)) {
			resultSpan.style.color = "green";
			resultSpan.innerHTML = "\u25EF 格式正確";
		}
		else {
		 resultSpan.style.color = "brown";
				resultSpan.innerHTML = "\u2716 格式錯誤";
				document.getElementById("password").value = "";
			}

		}
		else {
			resultSpan.style.color = "brown";
			resultSpan.innerHTML = "\u2716 密碼長度須至少為6";
			document.getElementById("password").value = "";
		}
	}
	//檢查身分證
function checkIdentID() {
		let idValue = document.getElementById("personID").value;
		let resultSpan = document.getElementById("verifyPersonIDResult");
		tab = "ABCDEFGHJKLMNPQRSTUVXYWZIO"
		A1 = new Array(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3);
		A2 = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4, 5);
		Mx = new Array(9, 8, 7, 6, 5, 4, 3, 2, 1, 1);

		if (idValue.length != 10) {
			resultSpan.style.color = "brown";
			resultSpan.innerHTML = "\u2716 身分證必須為10碼";
			document.getElementById("personID").value = "";
		}

		i = tab.indexOf(idValue.charAt(0));
		if (i == -1) { resultSpan.style.color = "brown"; resultSpan.innerHTML = "\u2716 身分證格式錯誤"; document.getElementById("personID").value = ""; }
		sum = A1[i] + A2[i] * 9;

		for (i = 1; i < 10; i++) {
			v = parseInt(idValue.charAt(i));
			if (isNaN(v)) { resultSpan.style.color = "brown"; resultSpan.innerHTML = "\u2716 身分證號碼無效"; document.getElementById("personID").value = ""; }
			sum = sum + v * Mx[i];
		}
		if (sum % 10 != 0) { resultSpan.innerHTML = "\u2716 身分證號碼無效"; document.getElementById("personID").value = ""; }
		else {
			resultSpan.style.color = "green";
			resultSpan.innerHTML = "\u25EF 格式正確";
			checkIdValid();
		}
	}
	
function checkIdValid() {
	let PIDValue = document.getElementById("personID").value;
	let resultSpan = document.getElementById("verifyPersonIDResult");
		
		$.ajax({
			type:"GET",
			url:"/blankShop/emp/checkID/"+PIDValue,
			
			contentType: "application/json; charset=utf-8",
            dataType: "json",
            
            success: function (data) {
				var str="此身分證已被註冊";
				if(str==(data.msg)) {
					resultSpan.style.color = "red";
					resultSpan.innerHTML = "\u25EF"+data.msg;
					errorNumber=1;
					
				}else {
					resultSpan.innerHTML += "\u25EF"+data.msg;				
					resultSpan.style.color = "green";
					errorNumber=0;
					
				}				
			}			
		})
	
}
	
	//檢查database有沒有重複的mail
function checkMailValid() {
let Value = document.getElementById("email").value;
let resultSpan = document.getElementById("verifyEmailResult");
		
$.ajax({
	type:"GET",
	url:"/blankShop/emp/checkMail/"+Value,
			
	contentType: "application/json; charset=utf-8",
    dataType: "json",
            
    success: function (data) {
		var str="此email已註冊過";
		if(str==data.msg) {
			resultSpan.style.color = "red";
//			resultSpan.innerHTML += "\u25EF"+data.msg;
			resultSpan.innerHTML = "\u25EF"+data.msg;
			errorEmail=1;
		}else {
			resultSpan.innerHTML += "\u25EF"+data.msg;				
			resultSpan.style.color = "green";
			errorEmail=0;
					
	}				
}			
})
}
	
	

	//檢查生日 不能空白
	function checkDate() {
		let dateValue = document.getElementById("birthday").value;
		let resultSpan = document.getElementById("verifyBirthResult");

		if (dateValue == "") {
			resultSpan.style.color = "brown";
			resultSpan.innerHTML = "\u2716 日期不可為空白";
		} else {
			resultSpan.style.color = "green";
			resultSpan.innerHTML = "\u25EF 正確";
		}
	}
	//檢查手機號碼 須數字及兩個-組成12位數
		function checkMobile() {
			let cellValue = document.getElementById("mobile").value;
			let resultSpan = document.getElementById("verifyMobileResult");
			B1 = new Array("0", "1", "2", "3", "4", "5", "6", "7", "8", "9","-");
			let k = 0;

			if (cellValue.length != 12) {
				resultSpan.style.color = "brown";
				resultSpan.innerHTML = "\u2716 長度為12須如 0911-234-789 "
				document.getElementById("mobile").value = "";
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
				document.getElementById("mobile").value = "";
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
				resultSpan.innerHTML = "\u25EF 格式正確";
			}
			else {
				resultSpan.style.color = "brown";
				resultSpan.innerHTML = "\u2716 請勿輸入特殊字元"
				document.getElementById("address").value = "";
			}
		}
			}
					
			
			//檢查email, 必須有@與.
function checkEmail() {
		let emailValue="";
		let resultSpan="";
		emailValue = document.getElementById("email").value;
		resultSpan = document.getElementById("verifyEmailResult");

		const re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
				  
        if(emailValue==""||emailValue==null) {
            resultSpan.style.color = "brown";
 			resultSpan.innerHTML = "\u2716 email不可空白";     
         }
		if (re.test(emailValue)){					  
			resultSpan.style.color = "green";
			resultSpan.innerHTML = "\u25EF 格式正確";
			checkMailValid();		 
		}
		else{
			resultSpan.style.color = "brown";
			resultSpan.innerHTML = "\u2716 email需有@與.英文加數字"
			document.getElementById("email").value = "";}
			}
			
			

			
			
			
			
//檢查到職日 不能空白
function checkDate1() {
	let dateValue = document.getElementById("hireDate").value;
	let resultSpan = document.getElementById("verifyHireDateResult");

	if (dateValue == "") {
		resultSpan.style.color = "brown";
		resultSpan.innerHTML = "\u2716 日期不可為空白";
	} else {
		resultSpan.style.color = "green";
		resultSpan.innerHTML = "\u25EF 正確";
	}
}
		
