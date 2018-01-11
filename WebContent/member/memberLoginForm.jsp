<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<link href="${project}member/style.css" rel="stylesheet" type="text/css">
<script src="${project}member/script.js"></script>

<h2> ${page_login} </h2>
<!-- 아이디 찾기, 비밀번호 찾기 -->
<body onload="loginfocus()">
	<form name="loginform" method="post" action="memberLoginPro.do"
		onsubmit="return logincheck()">
		<table>
			<tr>
				<th colspan="5">
					${msg_login}
				</th>
			</tr>
			<tr>
				<th> ${str_id} </th>
				<td>
					<input class="input" type="text" name="id" maxlength="15"> 
				</td>
				<th rowspan="2">
					<input class="inputbutton" type="submit" value="${btn_login}">
				</th>
				<th rowspan="2">
					<input class="inputbutton" type="button" value="${btn_join}" onclick="location='memberJoinForm.do'">
				</th>
				<th rowspan="2">
					<input class="inputbutton" type="button" value="${btn_main}" onclick="location='main.do'">
				</th>
			</tr>
			<tr>
				<th> ${str_passwd} </th>
				<td>
					<input class="input" type="password" name="passwd" maxlength="15">
				</td>
			</tr>
			<tr>
				<th colspan="5">
					<input class="inputbutton" type="button" value="${msg_btn_id}" onclick="location='memberFindIdForm.do'" style="width:300px">			
					<input class="inputbutton" type="button" value="${msg_btn_passwd}" onclick="location='memberFindPasswdForm.do'" style="width:300px">			
				</th>
			</tr>		
		</table>
	</form>
</body>













