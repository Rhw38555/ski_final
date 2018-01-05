<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<link href="${project}member/style.css" rel="stylesheet" type="text/css">
<script src="${project}member/script.js"></script>
<script src="${project}member/request.js"></script>

<body onload="joinfocus()">
	<form method="post" action="memberJoinPro.do"
		name="joinform" onsubmit="return joincheck()">
		<input type="hidden" name="hiddenemail" value="0">
		<table border="1">
			<tr>	
				<th colspan="2">
					${msg_join}
				</th>
			</tr>
			<tr>		
				<th> ${str_id} </th>
				<td>
					<input class="input" type="text" name="id" maxlength="15" onkeyup="idcheck()">
				</td>
				<td width="200"> <div id="idchk"></div> </td>
			</tr>
			<tr>		
				<th rowspan="2"> ${str_passwd} </th>
				<td>
					<input class="input" type="password" name="passwd" maxlength="15" onkeyup="passwdcheck()">
				</td>
				<td width="200"> <div id="passwdchk"></div> </td>
			</tr>
			<tr>	
				<td>
					<input class="input" type="password" name="repasswd" maxlength="15" onkeyup="repasswdcheck()">
				</td>
				<td width="200"> <div id="repasswdchk"></div> </td>
			</tr>
			<tr>
				<th> ${str_name} </th>
				<td>
					<input class="input" type="text" name="name" maxlength="30">
				</td>
			</tr>
			<tr>	
				<th> ${str_tel} </th>
				<td>
					<input class="input" type="text" name="tel1" maxlength="3" style="width: 28px" onkeyup="nexttel1()">
					- <input class="input" type="text" name="tel2" maxlength="4" style="width: 35px" onkeyup="nexttel2()">
					- <input class="input" type="text" name="tel3" maxlength="4" style="width: 35px" onkeyup="nextemail1()">		
				</td>				
			</tr>
			<tr>
			<!-- 이메일 인증하기 -->			
				<th> ${str_email} </th>
				<td>
					<input class="input" type="text" name="email1"
						maxlength="15" style="width:50px">
					@
					<select class="input" name="email2">
						<option value="0"> 직접입력 </option>
						<option value="naver.com"> 네이버 </option>
						<option value="daum.net"> 다음 </option>
						<option value="gmail.com"> 구글 </option>
						<option value="nate.com"> 네이트 </option>
					</select>
					
					<input class="inputbutton" type="button" value="${btn_confiremail}" style="width: 80px" onclick="confirmemail()">		
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input class="inputbutton" type="submit" value="${btn_in}">
					<input class="inputbutton" type="button" value="${btn_in_cancel}" onclick="location='memberLoginForm.do'">
				</th>
			</tr>			
		</table>
	</form>
</body>






