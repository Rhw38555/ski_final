<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<%@include file="/include/mainheader.jsp" %>
<script src="${project}member/script.js"></script>
<script src="${project}member/request.js"></script>

<body>
	<form action="memberJoinPro.do" name="joinform" onsubmit="return joincheck()">
		<input type="hidden" name="hiddenemail" value="0">
		<div class="container">
			<div class="main-center">
				<h2>${msg_join}</h2>
					<div class="form-group">
						<label class="cols-sm-2 control-label">${str_id}</label>
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
							<input class="form-control" type="text" name="id" maxlength="15" onkeyup="idcheck()">
						</div>
						<div id="idchk"></div>
					</div>
					<div class="form-group">
						<label class="cols-sm-2 control-label">${str_passwd}</label>
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-lock fa" aria-hidden="true"></i></span>
							<input class="form-control" type="password" name="passwd" maxlength="15" onkeyup="passwdcheck()">
						</div>
						<div id="passwdchk"></div>
					</div>
					<div class="form-group">
						<label class="cols-sm-2 control-label">${str_passwd}</label>
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-lock fa" aria-hidden="true"></i></span>
							<input class="form-control" type="password" name="repasswd" maxlength="15" onkeyup="repasswdcheck()">
						</div>
						<div id="repasswdchk"></div>
					</div>					
					<div class="form-group">
						<label class="cols-sm-2 control-label">${str_name}</label>
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
							<input class="form-control" type="text" name="name" maxlength="30">
						</div>
					</div>
					<div class="form-group">
						<label class="cols-sm-2 control-label">${str_tel}</label>
						<div class="input-group text-center">
							<span class="input-group-addon"><i class="fa fa-phone fa-lg" aria-hidden="true"></i></span>
							<input type="text" name="tel1" maxlength="3" style="width: 35px" onkeyup="nexttel1()">
							- <input type="text" name="tel2" maxlength="4" style="width: 40px" onkeyup="nexttel2()">
							- <input type="text" name="tel3" maxlength="4" style="width: 40px" onkeyup="nextemail()">	
						</div>
					</div>
					<div class="form-group">
						<label class="cols-sm-2 control-label">${str_email}</label>
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
							<input id="fullemail" type="text" name="email0" maxlength="30" style="width:200px; float:left">
							<input id="shortemail" type="text" name="email1" maxlength="30" style="width:150px; float:left; margin-right: 10px">
							<input id="shortemail2" type="text" name="email2" maxlength="15" style="width:100px; float:left" readonly>
							<select class="input" id="select" name="selectemail" onchange="chageLangSelect()">
								<option value="0"> 직접입력 </option>
								<option value="@naver.com"> 네이버 </option>
								<option value="@daum.net"> 다음 </option>
								<option value="@gmail.com"> 구글 </option>
								<option value="@nate.com"> 네이트 </option>
							</select>
							
							<input class="member-button" type="button" value="${btn_confiremail}" onclick="confirmemail()">
						</div>
					</div>
					<div class="form-group text-center">
					<br><br>
						<input class="btn btn-primary" type="submit" value="${btn_in}">
						<input class="btn btn-primary" type="button" value="${btn_in_cancel}" onclick="location='main.do'">
					</div>
				</div>
			</div>
	</form>
	<%@include file="/include/mainfooter.jsp" %>
	<script type="text/javascript">
        // 회원가입
        $(document).ready(
			function(){
				joinform.id.focus();
				shortemail.style.display = "none";
				shortemail2.style.display = "none";
			}		
		);
	</script>
</body>

