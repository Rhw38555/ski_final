<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<link href="${project}member/style.css" rel="stylesheet" type="text/css">
<script src="${project}member/script.js"></script>

<table>
	<tr>
		<th><span> 회원가입을 진심으로 축하드립니다. </span></th>
	</tr>
	<tr>
		<td>
			<input class="inputbutton" type="button" value="${btn_main}" onclick="location='main.do'">
			<input class="inputbutton" type="button" value="${btn_login}" onclick="location='memberLoginForm.do'">
		</td>
	</tr>
</table>