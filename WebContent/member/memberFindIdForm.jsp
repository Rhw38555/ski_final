<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<link href="${project}member/style.css" rel="stylesheet" type="text/css">

<script src="${project}member/script.js"></script>
    
<form name="idform" method="post" action="memberFindIdPro.do" onsubmit="return idconfirm()">  
<input type="hidden" id="user_barcode" value="${user_barcode}">                            
	<table>
		<tr>
			<th>이메일</th>
			<td>
				<input type="text" class="input" name="email" placeholder="아이디를 입력해주세요(@주소포함)"/>
			</td>
		</tr>	                  
		<tr>
			<th colspan="2">
				<input class="inputbutton" type="submit" value="아이디찾기">
				<input class="inputbutton" type="button" value="취소" onclick="location='memberLoginForm.do'">
			</th>
		</tr>                  
	</table>
</form>
