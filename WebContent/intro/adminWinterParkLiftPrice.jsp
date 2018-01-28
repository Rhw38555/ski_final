<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<script src="${project}${folder}script.js"></script>
 
<%@include file="/include/adminmainheader.jsp" %>
<%@include file="/include/adminWinterParkaside.jsp" %>
<body>
	<h2> 리프트요금안내 </h2>
	<br><br>
	<div style="width:80%; margin:auto; text-align: center; float:right;">
		<input class="btn btn-primary" type="button" value="${btn_Lift}" onclick="location='adminWinterParkLiftPrice.do'">
		<input class="btn btn-primary" type="button" value="${btn_Condo}" onclick="location='adminWinterParkCondoPrice.do'">
	</div>
	<br><br>
	<table style="width:70%; margin:auto; text-align: center" border="1">
		<tr>
			<th rowspan="2" style="text-align: center;"> 구분 </th>
			<th rowspan="2" colspan="2" style="text-align: center;"> 시간 </th>
			<th colspan="2" style="text-align: center;"> 이용요금 </th>
			<th rowspan="2" style="text-align: center;"> 비고 </th>
		</tr>
		<tr>
			<th style="text-align: center;"> 대인 </th>
			<th style="text-align: center;"> 소인 </th>
		</tr>
		<tr>
			<th style="text-align: center;"> 오전권 야간권 종일권 </th>
			<td> 09:00 ~ 17:00 </td>
			<td> 8h </td>
			<td> 대인가격 </td>
			<td> 소인가격 </td>
			<td></td>
		</tr>
		<tr>
			<th style="text-align: center;"> 야간권 </th>
			<td> 18:30 ~ 23:00 </td>
			<td> 4.5h </td>
			<td> 대인가격 </td>
			<td> 소인가격 </td>
			<td></td>
		</tr>
		<tr>
			<th style="text-align: center;"> 종일권 </th>
			<td> 09:00 ~ 23:00 </td>
			<td> 14h </td>
			<td> 대인가격 </td>
			<td> 소인가격 </td>
			<td></td>
		</tr>
	</table>
	<%@include file="/include/mainfooter.jsp" %>
</body>