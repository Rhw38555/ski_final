<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>

<c:if test="${result == 0}">
	<script type="text/javascript">
		<!--
		erroralert( writeerror );
		//-->
	</script>
</c:if>
<c:if test="${result == 1}">
	<c:redirect url="adminQnaList.do"/>
</c:if>	