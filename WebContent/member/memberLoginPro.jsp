<%@page import="member.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<script src="${project}member/script.js"></script>

<h2> ${page_login} </h2>
<c:if test="${num == 0}">
	${sessionScope.memId = id}
	<c:redirect url="main.do"/>
</c:if>
<c:if test="${num == 1}">
	${sessionScope.adminId = id}
	<c:redirect url="adminMain.do"/>
</c:if>
<c:if test="${num == 2}">
	${sessionScope.barcodeadminId = id}
	<c:redirect url="adminBarcodeAccountForm.do"/>
</c:if>
<c:if test="${num == -2}">	
	<script type="text/javascript">
		<!--
		erroralert( loginiderror );
		//-->
	</script>
</c:if>
<c:if test="${num == -1}">
	<script type="text/javascript">
		<!--
		erroralert( loginpasserror );
		//-->
	</script>
</c:if>





