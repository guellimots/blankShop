<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/blankShop/css/backEnd/update.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
$(function(){
	
	if("${msg}".length>0){
		swal("資料變更成功!!","","success",{button:"確定"}).then(function(){
			parent.window.location.reload();
		})
			
	}
	
})

</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fieldset>
		<legend>更新個人資料(員工自助)</legend>
		<form:form id="form1" name="form1" method="POST" modelAttribute="employee" enctype='multipart/form-data'>
			<Table style="align-self: center;">
				<c:if test='${employee.personID == null}'>
					<br>
					<tr>
						<td width="30%" align="right" style="font-size:18px;">身分證：<br>&nbsp;
						</td>
						<td ><form:input path='personID'  readonly="true" class="ingray"/><br>&nbsp;
							<form:errors path="personID" cssClass="error" /></td>
							
							
				</c:if>
				<c:if test='${employee.personID != null}'>
					<br>
					<tr>
						<td width="20%" align="right" style="font-size:18px;">身分證：<br>&nbsp;
						</td>
						<td><form:input path='personID' 
								value="${employee.personID}" readonly="true" class="ingray"/><br>&nbsp;
						</td>
					</tr>
				</c:if>

				<tr>
					<td width="20%" align="right" style="font-size:18px;">姓名：<br>&nbsp;
					</td>
					<td><form:input path='empName' default="${employee.empName}"
							readonly="true" class="ingray"/><br>&nbsp; <form:errors path='empName'
							cssClass="error" /></td>
					<td width="20%" align="right" style="font-size:18px;">電子信箱：<br>&nbsp;
					</td>
					<td><form:input   path="email" default="${employee.email}"
							readonly="true" name="email" class="ingray" /><br>&nbsp; <form:errors
							path='email' cssClass="error" /></td>
				</tr>
				<tr>
					<td width="20%" align="right" style="font-size:18px;">生日：<br>&nbsp;
					</td>
					<td><form:input  path="birthday" default="${employee.birthday}" readonly="true" class="ingray"/><br>&nbsp; 
						<form:errors path='birthday' cssClass="error" /></td>
					<td width="20%" align="right" style="font-size:18px;">連絡電話：<br>&nbsp;
					</td>
					<td><form:input  path="mobile" default="${employee.mobile}"	id="mobile" name="modile" class="instyle" onblur='checkMobile()' /><br>&nbsp; <form:errors path='mobile' cssClass="error" />
						<span class="sp" id="verifyMobileResult"></span>
					</td>
				</tr>
				<tr>
					<td width="20%" align="right" style="font-size:18px;">住址：<br>&nbsp;
					</td>
					<td><form:input  path="address" default="${employee.address}" class="instyle" id="address" name="address" onblur='checkAddress()'/><br>&nbsp;
						<form:errors path='address' cssClass="error" />
						<span class="sp" id="verifyAddressResult"></span>
						</td>
						

					<td width="20%" align="right" style="font-size:18px;">職稱：<br>&nbsp;
					</td>
					<td><form:radiobuttons  path="rankTitle" items='${rankMap}' disabled="true" /><br>&nbsp; 
						<form:errors path='rankTitle' cssClass="error" />
					</td>
				</tr>
				<tr>
					<td width="20%" align="right" style="font-size:18px;">到職日：<br>&nbsp;
					</td>
					<td><form:input  path="hireDate" default="${employee.hireDate}" readonly="true" class="ingray"/><br>&nbsp; 
						<form:errors path='hireDate' cssClass="error" /></td>
					<td width="30%" align="right" style="font-size:18px;">部門：<br>&nbsp;
					</td>
					<td><form:select  path="deptNo.deptNo" disabled="true">
						<form:option value="-1" label="" />
						<form:options items="${deptList}" itemLabel='deptName' itemValue='deptNo' />
						</form:select><br>&nbsp; <form:errors path="deptNo" cssClass="error" />
					</td>
				</tr>
				<tr>
					<td align="right" style="font-size:18px;">照片：<br>&nbsp;
					</td>
					<td><img id="previewArea" width='84' height='94' src='${strbase64}' /><br> 
						<form:input accept="image/*" type="file" path="image" onchange="showUpload(event)" /></td>
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
  <script src="/blankShop/js/backEnd/updatePersonal.js"></script>

</body>
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
fieldset.explicit-width{ 
    width: 1%; /* Will expand to fit content */ 
} 
fieldset.inline-block{ 
    display: inline-block; 
}     
</style>
</html>