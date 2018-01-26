<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<%@include file="/include/mainheader.jsp" %>l
<script src="${project}member/script.js"></script>
	<div class="container text-center">
		<header class="loginheader">
			<h2> 회원가입을 진심으로 축하드립니다. </h2>
			<br><br><br><br><br>
		</header>
		<div class="login-join">
			<input class="btn btn-primary" type="button" value="${btn_main}" onclick="location='main.do'">
			<input class="btn btn-primary" type="button" value="${btn_login}" onclick="location='memberLoginForm.do'">
		</div>	
	</div>
<%@include file="/include/mainfooter.jsp" %>