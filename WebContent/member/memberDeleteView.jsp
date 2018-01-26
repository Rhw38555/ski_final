<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<%@include file="/include/mainheader.jsp" %>l
<script src="${project}member/script.js"></script>
	<div class="container text-center">
		<header class="loginheader">
			<h2> 정상적으로 탈퇴처리 되었습니다. <br> 이용해주셔서 감사합니다. </h2>
			<br><br><br><br><br>
		</header>
		<div class="login-join">
			<input class="btn btn-primary" type="button" value="${btn_main}" onclick="location='main.do'">
		</div>	
	</div>
<%@include file="/include/mainfooter.jsp" %>
