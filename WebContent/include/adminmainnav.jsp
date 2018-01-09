<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../member/setting.jsp" %>
<!-- 메뉴바 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style type="text/css">
			body{
				text-align: center;
			}
			nav {
				border : 1px solid black;
				height : 50px;
			}
			.menubutton {
				width : 230px;
				height : 50px;
			}
		</style>		
	</head>
	<body>
	<script src="${project}member/script.js"></script>   
		<nav>
			<input class="menubutton" type="button" value="${btn_winterPark}" onclick="location='.do'"> 
			<input class="menubutton" type="button" value="${btn_reservation}" onclick="location='adminreverseRoomForm.do'">
			<input class="menubutton" type="button" value="${btn_skioom}" onclick="location='.do'">
			<input class="menubutton" type="button" value="${btn_eat}" onclick="location='adminFFList.do'">
			<input class="menubutton" type="button" value="${btn_event}" onclick="location='adminEventList.do'">
			<input class="menubutton" type="button" value="${btn_qa}" onclick="location='adminQnaList.do'">
		</nav>
	</body>
</html>
	