<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<script src="${project}${folder}script.js"></script>
 
<%@include file="/include/adminmainheader.jsp" %>
<%@include file="/include/adminWinterParkaside.jsp" %>
<body>
	<h2> 콘도요금안내 </h2>
	<br><br>
	<div style="width:80%; margin:auto; text-align: center; float:right;">
		<input class="btn btn-primary" type="button" value="${btn_Lift}" onclick="location='adminWinterParkLiftPrice.do'">
		<input class="btn btn-primary" type="button" value="${btn_Condo}" onclick="location='adminWinterParkCondoPrice.do'">
	</div>
	<br><br>
	<table style="width:70%; margin:auto; text-align: center" border="1">
		<tr>
			<th rowspan="2" style="text-align: center;"> 구분 </th>
			<th colspan="3" style="text-align: center;"> 금액 </th>
		</tr>
		<tr>
			<th style="text-align: center;"> 비수기 </th>
			<th style="text-align: center;"> 준성수기 </th>
			<th style="text-align: center;"> 성수기 </th>
		</tr>
		<tr>
			<th style="text-align: center;"> 2인실 </th>
			<td> 비수기가격 </td>
			<td> 준성수기가격 </td>
			<td> 성수기가격 </td>
		</tr>
		<tr>
			<th style="text-align: center;"> 4인실 </th>
			<td> 비수기가격 </td>
			<td> 준성수기가격 </td>
			<td> 성수기가격 </td>
		</tr>
		<tr>
			<th style="text-align: center;"> 8인실 </th>
			<td> 비수기가격 </td>
			<td> 준성수기가격 </td>
			<td> 성수기가격 </td>
		</tr>
	</table>
	<%@include file="/include/mainfooter.jsp" %>
</body>