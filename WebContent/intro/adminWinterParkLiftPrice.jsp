<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<script src="${project}${folder}script.js"></script>
 
<%@include file="/include/adminmainheader.jsp" %>
<%@include file="/include/adminWinterParkaside.jsp" %>
<body>
	
	<div class="container">
		<div class="row">
			<div class="intrototal">
				<h2> 리프트요금안내 </h2>
				<br><br>
				<div class="introbtbox">
					<input class="btn btn-primary" type="button" value="${btn_Lift}" onclick="location='WinterParkLiftPrice.do'">
					<input class="btn btn-primary"  type="button" value="${btn_Condo}" onclick="location='WinterParkCondoPrice.do'">
				</div>
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
			</div> <!-- intrototal -->
		</div> <!-- row -->
	</div> <!-- container -->
	
	<%@include file="/include/mainfooter.jsp" %>
</body>
