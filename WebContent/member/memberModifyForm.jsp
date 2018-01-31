<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="setting.jsp" %>
<%@include file="/include/mainheader.jsp" %>
<script src="${project}member/script.js"></script>
<script src="${project}member/request.js"></script>
	<%@include file="/include/mypageaside.jsp" %>
<body>
	<form name="joinform" method="post" action="memberModifyPro.do" onsubmit="return viewcheck()">
		<input type="hidden" name="hiddenemail" value="1">
		<input type="hidden" name="hiddenemailvalue" value="${logonDto.email}">
		<input type="hidden" id="user_barcode" value="${user_barcode}">
		<br><br><br><br><br><br>
		<div style="margin-left:10%">
		<div class="main-center">
			<h2>${page_modify}<br><br></h2>
				<div class="form-group">
					<label class="control-label">${str_id}</label>
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
						${logonDto.id}
					</div>
				</div>
				<div class="form-group">
					<label class="control-label">${str_passwd}</label>
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-lock fa" aria-hidden="true"></i></span>
						<input class="form-control" type="password" name="passwd" maxlength="15" value="${logonDto.passwd}" onkeyup="passwdcheck()">
					</div>
					<div id="passwdchk"></div>
				</div>
				<div class="form-group">
					<label class="control-label">${str_passwd}</label>
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-lock fa" aria-hidden="true"></i></span>
						<input class="form-control" type="password" name="repasswd" maxlength="15" value="${logonDto.passwd}" onkeyup="repasswdcheck()">
					</div>
					<div id="repasswdchk"></div>
				</div>					
				<div class="form-group">
					<label class="control-label">${str_name}</label>
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
						${logonDto.name}
					</div>
				</div>
				<div class="form-group">
					<label class="control-label">${str_tel}</label>
					<div class="input-group text-center">
						<span class="input-group-addon"><i class="fa fa-phone fa-lg" aria-hidden="true"></i></span>
						<c:set var="t" value="${fn:split( logonDto.tel, '-')}"/>
						<input class="input" type="text" name="tel1"
							maxlength="3" style="width: 35px" value="${t[0]}" onkeyup="nexttel1()">
						- <input class="input" type="text" name="tel2"
							maxlength="4" style="width: 40px" value="${t[1]}" onkeyup="nexttel2()">
						- <input class="input" type="text" name="tel3"
							maxlength="4" style="width: 40px" value="${t[2]}" onkeyup="nextemail()">	
					</div>
				</div>
				<div class="form-group">
					<label class="control-label">${str_email}</label>
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
						<input id="fullemail" type="text" name="email0" value="${logonDto.email}" maxlength="30" style="width:200px; float:left">
						<input id="shortemail" type="text" name="email1" maxlength="30" style="width:150px; float:left; margin-right: 10px">
						<input id="shortemail2" type="text" name="email2" maxlength="15" style="width:100px; float:left" readonly>
						<div style="float:right">
						<select id="select" name="selectemail" onchange="chageLangSelect()">
							<option value="0"> 직접입력 </option>
							<option value="@naver.com"> 네이버 </option>
							<option value="@daum.net"> 다음 </option>
							<option value="@gmail.com"> 구글 </option>
							<option value="@nate.com"> 네이트 </option>
						</select>
						<input class="inputbutton" type="button" value="${btn_confiremail}" style="width: 100px" onclick="confirmemail()">	</div>
						</div>
					</div>
				<div class="form-group text-center">
				<br><br>
					<input class="btn btn-primary" type="submit" value="${btn_mod}">
					<input class="btn btn-primary" type="reset" value="${btn_mod_cancel}">
				</div>
			</div>
			</div>
		</form>
		<%@include file="/include/mainfooter.jsp" %>
		<script type="text/javascript">
	        // 회원가입
	        $(document).ready(
				function(){
					joinform.passwd.focus();
					shortemail.style.display = "none";
					shortemail2.style.display = "none";
				}	
			);
		</script>		
	</body>
</html>