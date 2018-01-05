<%@page import="member.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<script src="${project}member/script.js"></script>

<h2> ${page_login} </h2>

<c:if test="${result == 1}">
	<c:if test="${id == 'admin'}">
		${sessionScope.memId = admin}
		<c:redirect url="adminMain.do"/>
	</c:if>
	${sessionScope.memId = id}
	<c:redirect url="main.do"/>
</c:if>
<c:if test="${result == -1}">
	<script type="text/javascript">
		<!--
		erroralert( loginpasserror );
		//-->
	</script>
</c:if>
<c:if test="${result == 0}">	
	<script type="text/javascript">
		<!--
		erroralert( loginiderror );
		//-->
	</script>
</c:if>








