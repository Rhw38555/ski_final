<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<script src="${project}${folder}script.js"></script>
 
<%@include file="/include/mainheader.jsp" %>
<%@include file="/include/WinterParkaside.jsp" %>
<body>
	<div class="container">
		<div class="row">
			<div class="intrototal">
				<br>
				<h2> 리프트 요금</h2>
				<div class="introtablebox">
					<table>
						<tr>
							<th class="th"> 구분 </th>
							<th colspan="2" class="th"> 시간 </th>
							<th class="th"> 이용요금 </th>
							<th class="th"> 비고 </th>
						</tr>
						<tr>
							<th> 오전권 </th>
							<td> 09:00 ~ 17:00 </td>
							<td> 8h </td>
							<td> 20,000원 </td>
							<td></td>
						</tr>
						<tr>
							<th> 야간권 </th>
							<td> 18:30 ~ 23:00 </td>
							<td> 4.5h </td>
							<td> 30,000원 </td>
							<td></td>
						</tr>
						<tr>
							<th> 종일권 </th>
							<td> 09:00 ~ 23:00 </td>
							<td> 14h </td>
							<td> 40,000원 </td>
							<td></td>
						</tr>
					</table>
				</div> <!-- introtablebox -->
				<br><br><br>
				<h2> 콘도 요금 </h2>
				<div class="introtablebox">
					<table>
						<tr>
							<th rowspan="2" class="th"> 구분 </th>
							<th colspan="3" class="th"> 금액 </th>
						</tr>
						<tr>
							<th class="th"> 비수기 </th>
							<th class="th"> 준성수기 </th>
							<th class="th"> 성수기 </th>
						</tr>
						<tr>
							<th> 2인실 </th>
							<td> 10,000원 </td>
							<td> 15,000원 </td>
							<td> 20,000원 </td>
						</tr>
						<tr>
							<th> 4인실 </th>
							<td> 20,000원 </td>
							<td> 30,000원 </td>
							<td> 40,000원 </td>
						</tr>
						<tr>
							<th> 8인실 </th>
							<td> 60,000원 </td>
							<td> 70,000원 </td>
							<td> 80,000원 </td>
						</tr>
					</table>
				</div>
			</div> <!-- intrototal -->
		</div> <!-- row -->
	</div> <!-- container -->
	
	<%@include file="/include/mainfooter.jsp" %>
</body>
