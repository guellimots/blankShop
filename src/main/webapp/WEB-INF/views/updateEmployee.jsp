<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/blankShop/css/backEnd/update.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/blankShop/js/backEnd/addemp.js"></script>
<style>
fieldset {
 border:0;

    padding:10px;
    margin-bottom:position:relative;
    border-radius: 8px;
    background:-webkit-linear-gradient(top,#EEE,#FFF);
    background:-moz-linear-gradient(top,#EEE,#FFF);
    box-shadow:3px 3px 10px #666;
    -moz-box-shadow:3px 3px 10px #666;
    -webkit-box-shadow:3px 3px 10px #666;
        
    }
fieldset.explicit-width{ 
    width: 1%; /* Will expand to fit content */ 
} 
legend {

    background:#0044bb;
    color:white;
    border-radius:3px;
    -moz-border-radius:3px;
    -webkit-border-radius:3px;30
    box-shadow:2px 2px 4px #666;
    -moz-box-shadow:2px 2px 4px #666;
    -webkit-box-shadow:2px 2px 4px #666;  
    font-size:26px; 
    padding:10px;
    }
</style>
<script>
	$(function() {
		$("#hireDate").datepicker({

			dateFormat : "yy-mm-dd",
			maxDate : "+60d"
		});

		$("#datepicker4").datepicker({

			dateFormat : "yy-mm-dd",
			changeMonth : true,
			changeYear : true,
			yearRange : "-2:+1"
		});
		$("#datepicker5").datepicker({

			dateFormat : "yy-mm-dd",
			changeMonth : true,
			changeYear : true,
			yearRange : "-60:+0"
		});
	});

	function showUpload(event) {
		var reader = new FileReader();
		reader.onload = function() {
			var previewArea = document.getElementById('previewArea');
			previewArea.src = reader.result;
		};
		reader.readAsDataURL(event.target.files[0]);

	}

	function KeyIn() {
		document.getElementById("mobile").value = "0933-333-333";
		document.getElementById("address").value = "100006 台北市中正區重慶南路一段122號";

	}
	
    $(function(){
    	
    	if("${msg}"=="success")
    	  alert("資料更新成功!!");
    	
    })
</script>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fieldset>
		<legend>更新員工資料</legend>
		<form:form method="POST" modelAttribute="employee"
			enctype='multipart/form-data'>
			<Table style="align-self: center;">
				<c:if test='${employee.personID == null}'>
					<br>
					<tr>
						<td width="30%" align="right">身分證：<br>&nbsp;
						</td>
						<td width='360'><form:input path='personID' disabled="true" class="ingray"/><br>&nbsp;
							<form:errors path="personID" cssClass="error" /></td>
				</c:if>
				<c:if test='${employee.personID != null}'>
					<br>
					<tr>
						<td width="30%" align="right">身分證：<br>&nbsp;
						</td>
						<td width='360'><form:input path='personID'	value="${employee.personID}" disabled="true" class="ingray"/><br>&nbsp;
						</td>
					</tr>
				</c:if>

				<tr>
					<td width="30%" align="right">姓名：<br>&nbsp;
					</td>
					<td><form:input path='empName' default="${employee.empName}" onblur='checkName()' class="instyle"/><br>&nbsp;
						<span class="sp" id="verifyNameResult"></span>
						<form:errors path='empName' cssClass="error" /></td>
						
					<td width="30%" align="right">電子信箱：<br>&nbsp;
					</td>
					<td><form:input path="email" default="${employee.email}" disabled="true" class="ingray"/><br>&nbsp;
						<form:errors path='email' cssClass="error" /></td>
				</tr>
				<tr>
					<td width="30%" align="right">生日：<br>&nbsp;
					</td>
					<td><form:input path="birthday" default="${employee.birthday}"
							id="datepicker5" disabled="true" class="ingray"/><br>&nbsp; 
							<form:errors path='birthday' cssClass="error" /></td>
					<td width="30%" align="right">連絡電話：<br>&nbsp;
					</td>
					<td><form:input class="instyle" path="mobile" default="${employee.mobile}" id="mobile" onblur="checkMobile()"/><br>&nbsp; 
							<form:errors path='mobile'	cssClass="error" />
							<span class="sp" id="verifyMobileResult"></span>
							</td>
							
				</tr>
				<tr>
					<td width="30%" align="right">到職日：<br>&nbsp;
					</td>
					<td><form:input class="instyle" path="hireDate" default="${employee.hireDate}" id="hireDate" onblur='checkDate1()'/><br>&nbsp; 
					<form:errors path='hireDate' cssClass="error" />
					<span class="sp" id="verifyHireDateResult"></span>
					</td>
					<td width="30%" align="right">離職日：<br>&nbsp;
					</td>
					<td><form:input class="instyle" path="resignDate" default="${employee.resignDate}" id="datepicker4" /><br>&nbsp;
						<form:errors path='resignDate' cssClass="error" /></td>
				</tr>
				<tr>
					<td width="30%" align="right">住址：<br>&nbsp;
					</td>
					<td><form:input class="instyle" style="width:300px;" path="address" default="${employee.address}" id="address" onblur="checkAddress()"/><br>&nbsp; 
					    <form:errors path='address' cssClass="error" />
							<span class="sp" id="verifyAddressResult"></span>
							</td>
					<td width="30%" align="right">部門：<br>&nbsp;
					</td>
					<td><form:select path="deptNo" style="width:200px; height:30px;border-radius:5px;">
							<form:option value="-1" label="請挑選" />
							<form:options items="${deptList}" itemLabel='deptName'
								itemValue='deptNo' />
						</form:select><br>&nbsp; <form:errors path="deptNo" cssClass="error" />
					</td>
				</tr>
				<tr>
					<td width="30%" align="right">權限：<br>&nbsp;
					</td>
					<td><form:radiobuttons path="empStatus" items='${empStatusMap}' /><br>&nbsp; 
						<form:errors path='empStatus' cssClass="error" /></td>

					<td width="30%" align="right">職稱：<br>&nbsp;
					</td>
					<td><form:radiobuttons path="rankTitle" items='${rankMap}' /><br>&nbsp;
						<form:errors path='rankTitle' cssClass="error" /></td>
				</tr>
				<tr>

					<td align="right">照片：<br>&nbsp;
					</td>
					<td><img id="previewArea" width='60' height='72'
						src='${strbase64}' /><br><input accept="image/*"
						type="file" name="fileUpload" onchange="showUpload(event)" /></td>
				</tr>
				<tr>
					<td colspan='2' align='right'><br>&nbsp; 
					<input type='submit' id="but01" style="background-color:#0080FF" class='bu'></td>
					<td colspan='2' align='right'><br>&nbsp; 
					<input type='button' value="一鍵輸入" style="background-color:#9F4D95" class='bu' onclick="KeyIn()"></td>
				</tr>
			</Table>

		</form:form>

	</fieldset>
	<br>


</body>
</html>