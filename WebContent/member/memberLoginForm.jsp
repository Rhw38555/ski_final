<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
 	<%@include file="/include/mainheader.jsp" %>
<script src="${project}member/script.js"></script>

<body onload="loginfocus()">
			<div class="content-block" id="contact">
				<div class="container text-center">
					<header class="block-heading cleafix">
						<h1> ${page_login} </h1>
						<p> ${msg_login} </p>
					</header>
					<div class="col-md-4 col-md-offset-3">
						<form name="loginform" action="memberLoginPro.do" onsubmit="return logincheck()">
							<div class="form-group">
						    	<input class="form-control" type="text" name="id" maxlength="15" placeholder="아이디" required>
						  	</div>
						    <div class="form-group">
						    	<input class="form-control" type="password" name="passwd" maxlength="15" placeholder="비밀번호" required>
						    </div>
							<div>
								<input class="btn" type="submit" value="${btn_login}">
								<input class="btn" type="button" value="${btn_join}" onclick="location='memberJoinForm.do'">
								<input class="btn" type="button" value="${btn_main}" onclick="location='main.do'">
							</div>
							<br><br>
							<div>
								<input class="btn" type="button" value="${msg_btn_id}" onclick="location='memberFindIdForm.do'" style="width:300px">			
								<input class="btn" type="button" value="${msg_btn_passwd}" onclick="location='memberFindPasswdForm.do'" style="width:300px">	
							</div>
						</form>
					</div>
				</div>
			</div><!-- #contact -->
			<%@include file="/include/mainfooter.jsp" %>
</body>













