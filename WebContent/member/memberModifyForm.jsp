<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<link href="${project}member/style.css" rel="stylesheet" type="text/css">
<script src="${project}member/script.js"></script>    
    
<body onload="viewfocus()">
	<form name="viewform" method="post" action="memberModifyPro.do" onsubmit="return viewcheck()">
		<table>
			<tr>
				<th colspan="2">
					${msg_modifyview}
				</th>	
			</tr>
			<tr>
				<th> ${str_id} </th>
				<td> &nbsp;${logonDto.id} </td>						
			</tr>
			<tr>
				<th rowspan="2"> ${str_passwd} </th>
				<td>
					<input class="input" type="password" name="passwd"
						maxlength="15" value="${logonDto.passwd}">
				</td>
			</tr>
			<tr>
				<td>
					<input class="input" type="password" name="repasswd"
						maxlength="15" value="${logonDto.passwd}">
				</td>
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
							maxlength="3" style="width: 28px" value="${t[0]}">
						- <input class="input" type="text" name="tel2"
							maxlength="4" style="width: 35px" value="${t[1]}">
						- <input class="input" type="text" name="tel3"
							maxlength="4" style="width: 35px" value="${t[2]}">
					</c:if>					
				</td>
			</tr>
			<tr>
				<th> ${str_email} </th>
				<td>
					<c:if test="${logonDto.email == null or logonDto.email == ''}">
						<input class="input" type="text" name="email1"
							maxlength="15" style="width:100px">
						@ <input class="input" type="text" name="email2"
							maxlength="15" style="width:100px">
					</c:if>											
					<c:if test="${logonDto.email != null and logonDto.email != ''}">
						<c:set var="e" value="${fn:split( logonDto.email, '@') }"/>
						<input class="input" type="text" name="email1"
							maxlength="15" value="${e[0]}" style="width:100px">
						@ <input class="input" type="text" name="email2"
							maxlength="15" value="${e[1]}" style="width:100px">									
					</c:if>
				</td>
			</tr>
			<tr>	
				<th colspan="2"> 
					<input class="inputbutton" type="submit" 
						value="${btn_mod}">
					<input class="inputbutton" type="button"
						value="${btn_mod_cancel}" onclick="location='main.do'">							
				</th>
			</tr>					
		</table>			
	</form>		
</body>	
    