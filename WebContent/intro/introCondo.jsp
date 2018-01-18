<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<script src="${project}${folder}script.js"></script>
 
<%@include file="/include/mainheader.jsp" %>
<%@include file="/include/mainnav.jsp" %>
<%@include file="/include/introaside.jsp" %>
<h2> 리프트요금안내 </h2>
<c:if test="${ num == 0}">
<input type="button" value="${btn_Reservation}" onclick="location='reverseRoomForm.do'">
</c:if>
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
<br><br><br><br>

<h2> 입퇴실 절차 </h2>
<table border="1">
	<tr>
		<th> CHECK-IN </th>
		<th> CHECK-OUT </th>
		<th> 퇴실시 </th>
	</tr>
	<tr>
		<td>CHECK-IN 시간은<br>14시부터 22시까지이며,<br>22시 이후 입실 시<br>프론트 데스크(031-644-1261)로<br>사전 연락을 주시기 바랍니다.</td>
		<td>CHECK-OUT 시간은<br>11시까지 입니다.<br>다음 고객의 이용을 위하여<br>퇴실시간을 준수해 주시기 바랍니다.</td>
		<td>퇴실시 실내 환기 및 객실 내 비품정리,<br>객실 내 쓰레기는 집적소 분리 수거,<br>퇴실 점검 후 프론트 데스크에서<br>객실키 반납 및 요금 정산 후 퇴실하시면 됩니다.</td>
	</tr>
</table>
<br><br><br><br>

<h2> 객실 이용 시 유의사항 </h2>
<table border="1">
	<tr>
		<th> 구이류 및 향이 강한 음식은<br>객실 정비에 어려움이 있습니다. </th>
		<th> 쾌적한 환경 조성을 위하여<br>객실 내 금연 </th>
		<th> 애완동물<br>동반 투숙 금지 </th>
		<th> 화재예방을 위해,<br>휴대용 버너 사용 금지 </th>
	</tr>
	<tr>
		<th> 객실당 추가인원은 2명까지 가능하며<br>최대인원 초과시 입실 불가합니다. <p style="color: gray;"><br>추가인원 1인당 10,000원의<br>추가요금이 부과 (추가침구만 제공)</p></th>
		<th> 미성년자만의 투숙은<br>불가합니다. </th>
		<th> 객실 비품 훼손 및<br>불출금지 <p style="color: gray;"><br>투숙기간 중 객실 비품의 파손 및<br>손망실 발생시 변상하셔야 합니다</p> </th>
		<th> 고성방가 금지 <p style="color: gray;"><br>투숙기간 중 늦은 시간 고성방가나<br>타인에게 불편함을 주는 행위는<br>삼가시기 바랍니다</p> </th>
	</tr>	
</table>