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
				<h2> 리프트요금안내 </h2>
				<br><br>
				<div class="introbtbox">
					<input class="btn btn-primary" type="button" value="${btn_Lift}" onclick="location='WinterParkLiftPrice.do'">
					<input class="btn btn-primary" type="button" value="${btn_Condo}" onclick="location='WinterParkCondoPrice.do'">
				</div>	
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
				</div>
			</div>
		</div>
	</div>
	
	<%@include file="/include/mainfooter.jsp" %>
</body>