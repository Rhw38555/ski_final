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

	<body onload="memberReserveCheck('${sessionScope.memId}')">
<script src="${project}member/script.js"></script>    
	
		<header>${page_reservationConfirm}</header>
		<%@include file="/include/mypageaside.jsp" %>
		<section>
			<table border="1"> 
				<tr>
					<th colspan="10">콘도 예약 정보</th>
				</tr>
				<tbody id="findtr"></tbody>
			</table>
			
			<table border="1"> 
				<tr>
					<th colspan="10">스키 예약 정보</th>
				</tr>
				<tbody id="findtr2"></tbody>
			</table>
			총가격 : <input type="text" id="allPrice">
		</section>
	</body>
</html>
</center>