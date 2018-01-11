<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="setting.jsp" %>

<!DOCTYPE html>
<center>
<html>
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

	<body onload="viewfocus()">
<script src="${project}member/script.js"></script>    
	
		<header>${page_reservationConfirm}</header>
		<%@include file="/include/mypageaside.jsp" %>
		<section>
			<table> 
				<tr>
					<th colspan="2"> 스키장 예약내역 </th>
				</tr>
				<tr>
					<th> 예약날짜 : </th>
					<td>
					<!-- 날짜 받아오기 -->
						2000.11.11 ~ 2000.11.13 (2일)
					</td>
				</tr>
				<tr>
					<th> 예약 종류 : </th>
					<td>
					<!-- 예약종류 받아오기 -->
						야간 예약 : 1개
					</td>
				</tr>
				<tr>
				<!-- 금액 받아오기 -->
					<th colspan="2"> 금액 : 100,000원</th>
				</tr>
			</table>
			<table> 
				<tr>
					<th colspan="2"> 콘도 예약내역 </th>
				</tr>
				<tr>
					<th> 예약날짜 : </th>
					<td>
					<!-- 예약날짜 받아오기 -->
						2000.11.11 ~ 2000.11.13 (2일)
					</td>
				</tr>
				<tr>
					<th> 예약 객실 : </th>
					<td>
					<!-- 예약객실 받아오기 -->
						2인실 : 1개
					</td>
				</tr>
				<tr>
				<!-- 금액 받아오기 -->
					<th colspan="2"> 금액 : 100,000원</th>
				</tr>
			</table>
			<table>
				<tr>
				<!-- 금액 받아온거 합치기 -->
					<th> 총 금액 : 200,000원 </th>
				</tr>
				<tr>	
					<th colspan="2">
					<!-- 로케이션 바꾸기 -->
						<input class="inputbutton" type="button" value="${btn_Reservation_modify}" onclick="location='main.do'">						
					</th>
				</tr>	
			</table>
		</section>
	</body>
</html>
</center>