<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="setting.jsp" %>

<!DOCTYPE html>
	<html>		
		<head>
			<meta charset="UTF-8">				
			<script src="${project}member/script.js"></script> 
			<script src="${project}member/jquery-3.2.1.js"></script>
			<script type="text/javascript">
				$(document).ready(function(){
					memberReserveCheck($('#userid').val());
				});
			</script>
			<%@include file="/include/mainheader.jsp"%>				
		</head>
	
		<body>
			<script src="${project}member/script.js"></script>    
			<br><br><br><br><br><br><br>
			<header>${page_reservationConfirm}</header>
			<%@include file="/include/mypageaside.jsp" %>
			<section>
				<input type="hidden" id="user_barcode" value="${user_barcode}">
				<input type="hidden" id="userid" value="${sessionScope.memId}">
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
		<%@include file="/include/mainfooter.jsp" %>
	</html>
