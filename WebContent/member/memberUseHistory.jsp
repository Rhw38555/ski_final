<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="setting.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link href="./member/a_re.css" rel="stylesheet">
		<script src="${project}member/script.js"></script> 
		<script src="${project}member/jquery-3.2.1.js"></script>
		<%@include file="/include/mainheader.jsp"%>			
	</head>
	
	<body onload="memberUseHistoryCheck('${user_barcode}')">
		<br><br><br><br><br><br><br>
			
		<%@include file="/include/mypageaside.jsp" %>	
		<input type="hidden" id="user_barcode" value="${user_barcode}">
		<div class="checkform">	
			<table border="1"> 
				<tbody id="findtr"></tbody>
			</table>
			<br><br>
		<form class="form" name="inputPrice">
			바코드 잔액 : 
			<input type="text" name="currentPrice">
			<input type="hidden" name="hiddenId" value="${sessionScope.memId}">
			<br>
			<input type="text" name="price"> 
			<div style="float:right">
			<input type="button" value="충전하기" onclick="userBarcodeCharge()">
			</div>		
		</form>
		</div>
	</body>
	
	<script type="text/javascript">
	//<!--
		
	//-->
	</script>
</html>
