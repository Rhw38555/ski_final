<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<link href="${project}member/style.css" rel="stylesheet" type="text/css">
<script src="${project}member/script.js"></script>

<table>
	<tr>
		<th>
			<span> 정상적으로 탈퇴처리 되었습니다. <br> 이용해주셔서 감사합니다. </span>
		</th>
	</tr>
	<tr>
		<td>
			<input class="inputbutton" type="button" value="${btn_main}" onclick="location='main.do'">
		</td>
	</tr>
</table>