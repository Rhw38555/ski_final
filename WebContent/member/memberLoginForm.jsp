<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
    <%@include file="/include/mainnav.jsp" %>
 	<%@include file="/include/mainheader.jsp" %>
<script src="${project}member/script.js"></script>

<body onload="loginfocus()">
			<div class="content-block" id="contact">
				<div class="container text-center">
					<header class="block-heading cleafix">
						<h1> ${page_login} </h1>
						<p> ${msg_login} </p>
					</header>
					<section class="block-body">
						<div class="row">
							<div class="col-md-6 col-md-offset-3">
								<form role="form" name="loginform" method="post" action="memberLoginPro.do" onsubmit="return logincheck()">
									<div class="form-group">
								    	<input class="form-control form-control-white" type="text" name="id" maxlength="15" placeholder="아이디" required>
								  	</div>
								    <div class="form-group">
								    	<input class="form-control form-control-white" type="password" name="passwd" maxlength="15" placeholder="비밀번호" required>
								    </div>
									<div>
										<input class="btn btn-o-white" type="submit" value="${btn_login}">
										<input class="btn btn-o-white" type="button" value="${btn_join}" onclick="location='memberJoinForm.do'">
										<input class="btn btn-o-white" type="button" value="${btn_main}" onclick="location='main.do'">
									</div>
									<br><br>
									<div>
										<input class="btn btn-o-white" type="button" value="${msg_btn_id}" onclick="location='memberFindIdForm.do'" style="width:300px">			
										<input class="btn btn-o-white" type="button" value="${msg_btn_passwd}" onclick="location='memberFindPasswdForm.do'" style="width:300px">	
									</div>
								</form>
							</div>
						</div>
					</section>
				</div>
			</div><!-- #contact -->
			<%@include file="/include/mainfooter.jsp" %>
</body>













