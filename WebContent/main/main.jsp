<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<%@ include file="../member/setting.jsp"%>
<link href="${project}member/style.css" rel="stylesheet" type="text/css">
<script src="${project}member/script.js"></script>	
	
<c:if test="${sessionScope.memId == null}">
	<body onload="mainfocus()">
		<form method="post" action="memberLoginPro.do" name="mainform"
			onsubmit="return maincheck()">
			<table>
				<tr>
					<th colspan="2">${msg_main}</th>
				</tr>
				<tr>
					<th>${str_id}</th>
					<td><input class="input" type="text" name="id" maxlength="15">
					</td>
				</tr>
				<tr>
					<th>${str_passwd}</th>
					<td><input class="input" type="password" name="passwd"
						maxlength="15"></td>
				</tr>
				<tr>
					<th colspan="2">
						<input class="inputbutton" type="submit" value="${btn_login}"> 
						<input class="inputbutton" type="reset" value="${btn_cancel}">						 
						<input class="inputbutton" type="button" value="${btn_join}"
							onclick="location='memberJoinForm.do'"></th>
				</tr>
	
			</table>
		</form>
	</body>
</c:if>
<c:if test="${sessionScope.memId != null}">
	<table>
		<tr>
			<th><span>${sessionScope.memId}</span> ${msg_loginmain}
			</th>
		</tr>
		<tr>
			<td align="center">
				<input class="inputbutton" type="button" value="${btn_logout}" 
					onclick="location='memberLogout.do'"> 
				<input class="inputbutton" type="button" value="${btn_modify}"
					onclick="location='memberModifyForm.do'">
				<input class="inputbutton" type="button" value="${btn_delete}"
					onclick="location='memberDeleteForm.do'">
			</td>
		</tr>
		
	</table>
</c:if>



	