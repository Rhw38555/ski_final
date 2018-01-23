<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../intro/setting.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<!-- 
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
		 -->		
	</head>

	<body>
	<script src="${project}${folder}script.js"></script>    
		<aside>
		<br><br>
			<input class="button" type="button" value="요금안내" onclick="location='adminWinterParkLiftPrice.do'"><br>
			<input class="button" type="button" value="공지사항" onclick="location='adminNoticeList.do'"><br>
			<input class="button" type="button" value="교통정보" onclick="location='adminWinterParkTrafic.do'"><br>
		</aside>
	</body>
</html>