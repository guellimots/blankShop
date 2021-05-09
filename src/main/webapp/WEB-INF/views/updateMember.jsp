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
<script src="/blankShop/js/backEnd/checkMem.js"></script>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br><br><br>
	<fieldset>
		<legend>變更會員資料</legend>
		<form:form method="POST" modelAttribute="member01"
			enctype='multipart/form-data'>
			<Table style="align-self: center;">
				<c:if test='${member01.memberId == null}'>
					<br>
					<tr>
						<td width="30%" align="right">編號：<br>&nbsp;
						</td>
						<td><form:input path='memberId' disabled="true" /><br>&nbsp;
<%-- 							<form:errors path="memberId" cssClass="error" /> --%>
                       </td>
				</c:if>
				<c:if test='${member01.memberId != null}'>
					<br>
					<tr>
						<td width="30%" align="right">編號：<br>&nbsp;
						</td>
						<td><form:input path='memberId'
								value="${member01.memberId}" disabled="true" class="ingray"/><br>&nbsp;</td>
					</tr>
				</c:if>

				<tr>
					<td width="30%" align="right">姓名：<br>&nbsp;
					</td>
					<td><form:input path='memberName'
							value="${member01.memberName}" disabled="true" class="ingray"/><br>&nbsp;</td>
					<td width="30%" align="right">Email：<br>&nbsp;
					</td>
					<td><form:input path='email'
							value="${member01.email}" disabled="true" class="ingray"/><br>&nbsp;
				</tr>
				<tr>
					<td width="30%" align="right">生日：<br>&nbsp;
					</td>
					<td><form:input path='birthday'
							value="${member01.birthday}" disabled="true" class="ingray"/><br>&nbsp;
					<td width="30%" align="right">註冊日：<br>&nbsp;
					</td>
					<td><form:input path='createDate'
							value="${member01.createDate}" disabled="true" class="ingray"/><br>&nbsp;
				</tr>
				<tr>
					<td width="30%" align="right">住址：<br>&nbsp;
					</td>
					<td><form:input class="instyle" path="address"
							default="${member01.address}" id="address" name="address" onblur="checkAddress()"/><br>&nbsp; <form:errors
							path='address' cssClass="error" />
							<span class="sp" id="verifyAddressResult"></span></td>
					<td width="30%" align="right">電話：<br>&nbsp;
					</td>
					<td><form:input class="instyle" path="cellNumber"
							default="${member01.cellNumber}" id="cellNumber"  name="cellNumber" onblur="checkCellNumber()"/><br>&nbsp;
						<form:errors path='cellNumber' cssClass="error" />
						<span class="sp" id="verifyCellResult"></span>
						</td>
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
<!-- 	<div align="center"> -->
<!-- 		<button><a href="../showAllMembers">回前頁</a></button> -->
	

</body>

</html>