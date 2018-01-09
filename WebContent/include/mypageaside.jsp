<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../member/setting.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style type="text/css">
			body{
				text-align: center;
			}
			aside {
				width : 150px;
				height : 500px;				
				float : left;
				border : 1px solid black;
				margin : 0px;
			}
			.button {
				width : 150px;
			}
		</style>		
	</head>

	<body onload="viewfocus()">
	<script src="${project}member/script.js"></script>    
		<aside>
		<br><br>
			<input class="button" type="button" value="정보수정" onclick="location='memberModifyForm.do'"><br>
			<input class="button" type="button" value="예약확인" onclick="location='memberReservationConfirm.do'"><br>
			<input class="button" type="button" value="사용내역" onclick="location='memberUseHistory.do'"><br>
			<input class="button" type="button" value="${btn_delete}" onclick="location='memberDeleteForm.do'">
		</aside>
	</body>
</html>