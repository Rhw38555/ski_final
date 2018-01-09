<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<link href="${project}member/style.css" rel="stylesheet" type="text/css">
<script src="${project}member/script.js"></script>
<script src="${project}member/request.js"></script>

<!-- 이메일 인증 -->
<body onload="joinfocus()">
	<form method="post" action="memberJoinPro.do"
		name="joinform" onsubmit="return joincheck()">
		<input type="hidden" name="hiddenemail" value="0">
		<table border="1" width="800px">
			<tr>	
				<th colspan="2" width="150px">
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
					- <input class="input" type="text" name="tel3" maxlength="4" style="width: 35px" onkeyup="nextemail()">		
				</td>				
			</tr>
			<tr>		
				<th> ${str_email} </th>
				<td>
					<input id="fullemail" class="input" type="text" name="email0" maxlength="30" style="width:200px">
					<input id="shortemail" class="input" type="text" name="email1" maxlength="30" style="width:100px">
					<input id="shortemail2" class="input" type="text" name="email2" maxlength="15" style="width:100px" readonly>
					<select class="input" id="select" name="selectemail" onchange="chageLangSelect()">
						<option value="0"> 직접입력 </option>
						<option value="@naver.com"> 네이버 </option>
						<option value="@daum.net"> 다음 </option>
						<option value="@gmail.com"> 구글 </option>
						<option value="@nate.com"> 네이트 </option>
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






