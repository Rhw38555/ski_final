<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="setting.jsp" %>

<!DOCTYPE html>
	<html>		
		<head>
			<meta charset="UTF-8">		
			<link href="./member/a_re.css" rel="stylesheet">  		
			<script src="${project}member/script.js"></script> 
			<script src="${project}member/jquery-3.2.1.js"></script>					
			<script type="text/javascript">
				$(document).ready(function(){
					memberReserveCheck($('#userid').val());					
					//$('.roomcheck_a').css('active',true);
					$('#skicheck').css('display','none');	
					$('.roomcheck_a').css('color','orange');
					$('.skicheck_a').css('color','gray');
					$('#notable').css('display','none');
				});
			</script>
			<%@include file="/include/mainheader.jsp"%>				
		</head>
		
		<body>
			<script src="${project}member/script.js"></script>    
			<br><br><br><br><br><br><br>
			
			<%@include file="/include/mypageaside.jsp" %>				
			<form class="form">
			<%--<header>${page_reservationConfirm}</header> --%>
				<input type="hidden" id="user_barcode" value="${user_barcode}">
				<input type="hidden" id="userid" value="${sessionScope.memId}">
				<input type="hidden" id="noroom" value="0">
				<input type="hidden" id="noski" value="0">
				<div class="checkform">	
					<div class="checkbtbox">
						<a href="javascript:showroom();" class="roomcheck_a">콘도</a>
						<a href="javascript:showski();" class="skicheck_a">스키</a>
					</div>
					<div id="notable">
						<b>예약 내역이 없습니다 ! !</b>
					</div>
					<div id="roomcheck">
						<%--<div>콘도 예약 정보</div> --%> 														
						<div id="findtr"></div>
					</div>			
					<div id="skicheck">
						<%--<div>스키 예약 정보</div> --%> 														
						<div id="findtr2"></div>
					</div>
				</div>	
				<%--총가격 : <input type="text" id="allPrice"> --%>
			</form>			
		</body>
		<%@include file="/include/mainfooter.jsp" %>
	</html>
