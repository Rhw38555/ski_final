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
	
		<header>${page_UseHistory}</header>
		<%@include file="/include/mypageaside.jsp" %>
		<section>
			<table>
			<!-- for문 돌리기 -->
				<tr>
					<th colspan="3"> 사용 내역 </th>
				</tr>
				<tr>
					<th> 품목 </th>
					<th> 가격 </th>
					<th> 누적 </th>
				</tr>
				<tr>
					<td>김치찌개</td>
					<td>6,000원</td>
					<td>6,000원</td>
				</tr>
			</table>
			<table>
				<tr>
				<!-- 금액 받아오기 -->
					<th> 총 금액 : 200,000원 </th>
				</tr>
			</table>
		</section>
	</body>
</html>
</center>