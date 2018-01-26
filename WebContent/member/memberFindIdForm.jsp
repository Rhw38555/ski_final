<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<%@include file="/include/mainheader.jsp" %>l
<script src="${project}member/script.js"></script>
    
	<div class="container text-center">
		<header class="loginheader">
			<h2> 아이디 찾기 </h2>
			<br><br><br>
		</header>
		<div class="col-md-4 col-md-offset-login">
			<form name="idform" method="post" action="memberFindIdPro.do" onsubmit="return idconfirm()">  
				<input type="hidden" id="user_barcode" value="${user_barcode}">
				<div class="main-login">
					<div class="form-group">
						<input class="form-control" type="text" name="email" placeholder="이메일을 입력해주세요(@주소포함)"/>
					</div>
					<input class="btn btn-primary" type="submit" value="아이디찾기">
					<input class="btn btn-primary" type="button" value="취소" onclick="location='memberLoginForm.do'">
					
				</div>
			</form>	
		</div>
	</div>
<%@include file="/include/mainfooter.jsp" %>
