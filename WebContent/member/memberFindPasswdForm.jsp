<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<link href="${project}member/style.css" rel="stylesheet" type="text/css">
<script src="${project}member/script.js"></script>
    
<form name="passwdform" method="post" action="memberFindPasswdPro.do" onsubmit="return passwdconfirm()">                              
	<input type="hidden" id="user_barcode" value="${user_barcode}">
	<table>
		<tr>
	      <th>아이디</th>
	      <td>
	      	<input type="text" class="form-control" name="id" placeholder="아이디를 입력해주세요"/>
	      </td>	
        </tr>
        <tr>
 			<th>이메일</th>
            <td>
            	<input type="text" class="form-control" name="email" placeholder="아이디를 입력해주세요(@주소포함)"/>
            </td>	
   		</tr>
   		<tr>
   			<th colspan="2">
		      <input type="submit" class="btn btn-primary login-button" value="비밀번호찾기">
		      <input type="button" type="button" class="btn btn-theme login-button" value="취소" onclick="location='main.do'">
		    </th>
		</tr>      
	</table>              
</form>