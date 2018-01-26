<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<%@include file="/include/mainheader.jsp" %>l
<script src="${project}member/script.js"></script>

	<div class="container text-center">
		<header class="loginheader">
			<h2> 비밀번호 찾기 </h2>
			<br><br><br>
		</header>
		<div class="col-md-4 col-md-offset-login">
			<form name="passwdform" method="post" action="memberFindPasswdPro.do" onsubmit="return passwdconfirm()">                              
				<input type="hidden" id="user_barcode" value="${user_barcode}">
				<div class="main-login">
					<div class="form-group">
						<input type="text" class="form-control" name="id" placeholder="아이디를 입력해주세요"/>
					</div>	
					<div class="form-group">
						<input type="text" class="form-control" name="email" placeholder="아이디를 입력해주세요(@주소포함)"/>
					</div>
						<input type="submit" class="btn btn-primary" value="비밀번호찾기">
		     			<input type="button" class="btn btn-primary" value="취소" onclick="location='main.do'">
				</div>
			</form>	
		</div>
	</div>
<%@include file="/include/mainfooter.jsp" %>