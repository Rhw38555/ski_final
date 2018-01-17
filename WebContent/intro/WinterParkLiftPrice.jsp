<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<script src="${project}${folder}script.js"></script>
 
<%@include file="/include/mainheader.jsp" %>
<%@include file="/include/mainnav.jsp" %>
<%@include file="/include/WinterParkaside.jsp" %>
<h2> 리프트요금안내 </h2>

<input type="button" value="${btn_Lift}" onclick="location='WinterParkLiftPrice.do'">
<input type="button" value="${btn_Condo}" onclick="location='WinterParkCondoPrice.do'">

<table border="1">
	<tr>
		<th rowspan="2"> 구분 </th>
		<th rowspan="2" colspan="2"> 시간 </th>
		<th colspan="2"> 이용요금 </th>
		<th rowspan="2"> 비고 </th>
	</tr>
	<tr>
		<th> 대인 </th>
		<th> 소인 </th>
	</tr>
	<tr>
		<th> 오전권 야간권 종일권 </th>
		<td> 09:00 ~ 17:00 </td>
		<td> 8h </td>
		<td> 대인가격 </td>
		<td> 소인가격 </td>
		<td></td>
	</tr>
	<tr>
		<th> 야간권 </th>
		<td> 18:30 ~ 23:00 </td>
		<td> 4.5h </td>
		<td> 대인가격 </td>
		<td> 소인가격 </td>
		<td></td>
	</tr>
	<tr>
		<th> 종일권 </th>
		<td> 09:00 ~ 23:00 </td>
		<td> 14h </td>
		<td> 대인가격 </td>
		<td> 소인가격 </td>
		<td></td>
	</tr>
</table>