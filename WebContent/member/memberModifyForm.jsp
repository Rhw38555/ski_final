<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="setting.jsp" %>
<%@include file="/include/mainheader.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">	
	</head>

	<body onload="viewfocus()">
	<script src="${project}member/script.js"></script>    
	
		<header>${page_modify}</header>
		<%@include file="/include/mypageaside.jsp" %>
		<section>
			<form name="joinform" method="post" action="memberModifyPro.do" onsubmit="return viewcheck()">
			<input type="hidden" name="hiddenemail" value="1">
			<input type="hidden" name="hiddenemailvalue" value="${logonDto.email}">
			<input type="hidden" id="user_barcode" value="${user_barcode}">
			
			
			
			
			
				<table class="table">
					<tr>
						<th> ${str_id} </th>
						<td> &nbsp;${logonDto.id} </td>						
					</tr>
					<tr>
						<th rowspan="2"> ${str_passwd} </th>
						<td>
							<input class="input" type="password" name="passwd" maxlength="15" value="${logonDto.passwd}" onkeyup="passwdcheck()">
						</td>
						<td width="200"> <div id="passwdchk"></div> </td>
					</tr>
					<tr>
						<td>
							<input class="input" type="password" name="repasswd" maxlength="15" value="${logonDto.passwd}" onkeyup="repasswdcheck()">
						</td>
						<td width="200"> <div id="repasswdchk"></div> </td>
					</tr>
					<tr>
						<th> ${str_name} </th>
						<td> &nbsp;${logonDto.name} </td>
					</tr>
					<tr>
						<th> ${str_tel} </th>
						<td>							
							<c:if test="${logonDto.tel == null or logonDto.tel == ''}">
								<input class="input" type="text" name="tel1"
									maxlength="3" style="width: 28px">
								- <input class="input" type="text" name="tel2"
									maxlength="4" style="width: 35px">
								- <input class="input" type="text" name="tel3"
									maxlength="4" style="width: 35px">
							</c:if>
							<c:if test="${logonDto.tel != null and logonDto.tel != ''}">
								<c:set var="t" value="${fn:split( logonDto.tel, '-')}"/>
								<input class="input" type="text" name="tel1"
									maxlength="3" style="width: 28px" value="${t[0]}" onkeyup="nexttel1()">
								- <input class="input" type="text" name="tel2"
									maxlength="4" style="width: 35px" value="${t[1]}" onkeyup="nexttel2()">
								- <input class="input" type="text" name="tel3"
									maxlength="4" style="width: 35px" value="${t[2]}" onkeyup="nextemail()">
							</c:if>					
						</td>
					</tr>
					<tr>
						<th> ${str_email} </th>
						<td>
							<input id="fullemail" class="input" type="text" name="email0" value="${logonDto.email}" maxlength="30" style="width:200px">
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
							<input class="inputbutton" type="submit" value="${btn_mod}">
							<input class="inputbutton" type="reset" value="${btn_mod_cancel}">							
						</th>
					</tr>								
				</table>
			</form>
		</section>
	</body>
</html>