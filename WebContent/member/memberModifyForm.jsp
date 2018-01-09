<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="setting.jsp" %>

<!DOCTYPE html>
<center>
<html>
	<head>
		<meta charset="UTF-8">
		<style type="text/css">
			body{
				text-align: center;
			}
			div {
				border : 1px solid black;
				margin : 10px;
			}
			header {
				height : 50px;
			}
			aside {
				width : 150px;
				height : 500px;				
				float : left;
			}
			section {
				width : 1300px;			
				height : 500px;
				float : left;
			}
			.button {
				width : 150px;
			}
			header, aside, section {
				border : 1px solid black;
				margin : 0px;
			}
		</style>		
	</head>

	<body onload="viewfocus()">
	<script src="${project}member/script.js"></script>    
	
		<header>${page_modify}</header>
		<%@include file="/include/mypageaside.jsp" %>
		<section>
			<form name="viewform" method="post" action="memberModifyPro.do" onsubmit="return viewcheck()">
				<table class="table">
					<tr>
						<th> ${str_id} </th>
						<td> &nbsp;${logonDto.id} </td>						
					</tr>
					<tr>
						<th rowspan="2"> ${str_passwd} </th>
						<td>
							<input class="input" type="password" name="passwd" maxlength="15" value="${logonDto.passwd}" onkeyup="modpasswdcheck()">
						</td>
						<td width="200"> <div id="passwdchk"></div> </td>
					</tr>
					<tr>
						<td>
							<input class="input" type="password" name="repasswd" maxlength="15" value="${logonDto.passwd}" onkeyup="modrepasswdcheck()">
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
									maxlength="3" style="width: 28px" value="${t[0]}" onkeyup="modnexttel1()">
								- <input class="input" type="text" name="tel2"
									maxlength="4" style="width: 35px" value="${t[1]}" onkeyup="modnexttel2()">
								- <input class="input" type="text" name="tel3"
									maxlength="4" style="width: 35px" value="${t[2]}" onkeyup="modnextemail()">
							</c:if>					
						</td>
					</tr>
					<tr>
						<th> ${str_email} </th>
						<td>											
							<c:set var="e" value="${fn:split( logonDto.email, '@') }"/>
							<input class="input" type="text" name="email1"
								maxlength="15" value="${e[0]}" style="width:100px">
							@ <input class="input" type="text" name="email2"
								maxlength="15" value="${e[1]}" style="width:100px">
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
</center>