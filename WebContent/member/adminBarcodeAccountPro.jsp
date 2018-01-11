<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="setting.jsp"%>
	<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
	<body>
	<script src="${project}member/script.js"></script>
		<c:if test="${result == 0}">
			<script type="text/javascript">
				
			</script>
		</c:if>
		<c:if test="${result != 0}">
			<script type="text/javascript">
				alert("성공");
			</script>
			<meta http-equiv="refresh" content="1; url='adminBarcodeAccountForm.do'">

		</c:if>	
	</body>
</html>