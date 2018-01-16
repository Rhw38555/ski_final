<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="setting.jsp" %>

<!DOCTYPE html>
<center>
<html>
<script src="${project}member/script.js"></script> 
<script src="${project}member/jquery-3.2.1.js"></script>
	<head>
		<meta charset="UTF-8">
		<style type="text/css">
			body{
				text-align: center;
			}
			header {
				height : 50px;
			}
			section {
				width : 1300px;			
				height : 500px;
				float : left;
			}
			header, section {
				border : 1px solid black;
				margin : 0px;
			}
		</style>		
	</head>

	<body onload="memberUseHistoryCheck('${user_barcode}')">
		<header>${page_UseHistory}</header>
		<%@include file="/include/mypageaside.jsp" %>
		<section>
			<table border="1"> 
				<tbody id="findtr"></tbody>
			</table>
		</section>
	</body>
</html>
</center>