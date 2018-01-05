<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<link href="${project}member/style.css" rel="stylesheet" type="text/css">

<body>	
	<form method="post" action="" name="mailform">				
		<c:if test="${authNum != ''}">
			<table>
				<tr>
					<th>인증번호</th>
					<td>
					<input type="text" class="inputbutton" name="textsub" style="width:100px;">
				<br>
				<input class="inputbutton" type="button" value="인증" onclick="mailsubmit(${authNum})">
				<input class="inputbutton" type="button" value="취소" onclick="self.close()">
				</td>
				</tr>
			</table>			
		</c:if>
	</form>
</body>	



