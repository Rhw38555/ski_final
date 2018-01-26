<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
 	<%@include file="/include/mainheader.jsp" %>
<script src="${project}member/script.js"></script>

<body>
		<div class="container text-center">
			<header class="loginheader">
				<h1> ${page_login} </h1>
				<p> ${msg_login} </p>
			</header>
			<div class="col-md-4 col-md-offset-login">
				<form name="loginform" action="memberLoginPro.do" onsubmit="return logincheck()">
					<div class="main-login">
						<div class="form-group">
					    	<input class="form-control" type="text" name="id" maxlength="15" placeholder="아이디" required>
					  	</div>
					    <div class="form-group">
					    	<input class="form-control" type="password" name="passwd" maxlength="15" placeholder="비밀번호" required>
					    	
							<input class="btn btn-link" type="button" value="${msg_btn_id}" onclick="location='memberFindIdForm.do'" style="width:300px">			
							<input class="btn btn-link" type="button" value="${msg_btn_passwd}" onclick="location='memberFindPasswdForm.do'" style="width:300px">	
						</div>
						<br><br>
						<div>
							<input class="btn btn-primary" type="submit" value="${btn_login}">
							<input class="btn btn-primary" type="button" value="${btn_join}" onclick="location='memberJoinForm.do'">
							<input class="btn btn-primary" type="button" value="${btn_main}" onclick="location='main.do'">
						</div>
					</div>
				</form>
			</div>
		</div>
			<%@include file="/include/mainfooter.jsp" %>
</body>













