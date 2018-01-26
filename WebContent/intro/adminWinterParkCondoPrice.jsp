<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<script src="${project}${folder}script.js"></script>
 
<%@include file="/include/adminmainheader.jsp" %>
<%@include file="/include/adminWinterParkaside.jsp" %>
<h2> 리프트요금안내 </h2>

<input type="button" value="${btn_Lift}" onclick="location='adminWinterParkLiftPrice.do'">
<input type="button" value="${btn_Condo}" onclick="location='adminWinterParkCondoPrice.do'">

<table border="1">
	<tr>
		<th rowspan="2"> 구분 </th>
		<th colspan="3"> 금액 </th>
	</tr>
	<tr>
		<th> 비수기 </th>
		<th> 준성수기 </th>
		<th> 성수기 </th>
	</tr>
	<tr>
		<th> 2인실 </th>
		<td> 비수기가격 </td>
		<td> 준성수기가격 </td>
		<td> 성수기가격 </td>
	</tr>
	<tr>
		<th> 4인실 </th>
		<td> 비수기가격 </td>
		<td> 준성수기가격 </td>
		<td> 성수기가격 </td>
	</tr>
	<tr>
		<th> 8인실 </th>
		<td> 비수기가격 </td>
		<td> 준성수기가격 </td>
		<td> 성수기가격 </td>
	</tr>
</table>