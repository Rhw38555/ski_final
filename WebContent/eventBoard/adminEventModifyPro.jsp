<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
	
<c:if test="${result == 0}">
	<script type="text/javascript">
		<!--
		erroralert(modifyerror);
		//-->
	</script>
	error
	<meta http-equiv="refresh" content="2; url=adminEventList.do">
</c:if>
<c:if test="${result == 1}">		
	<c:redirect url="adminEventList.do"/>	
</c:if>	