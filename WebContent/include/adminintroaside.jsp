<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../intro/setting.jsp" %>

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
				height : 100%;				
				float : left;
				border : 1px solid black;
				margin : 0px;
			}
			.button {
				width : 150px;
			}
			Pre {
				font-size : 20px;
				float : left;
			}
		</style>		
	</head>

	<body>
	<script src="${project}${folder}script.js"></script>    
		<aside>
		<br><br>
			<pre>스키장</pre>
			<input class="button" type="button" value="스키장 안내 및 제원" onclick="location='adminintroSki.do'"><br>
			<input class="button" type="button" value="실시간웹캠" onclick="location='adminintroWebcam.do'"><br>
			<pre>콘도</pre>
			<input class="button" type="button" value="콘도소개" onclick="location='adminintroCondo.do'"><br>
			<input class="button" type="button" value="객실 미리보기" onclick="location='adminintroCondoView2.do'"><br>
		</aside>
	</body>
</html>