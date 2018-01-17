<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>

	<c:if test="${result == 0}">
		<script type="text/javascript">
			<!--
			alert( deleteerror );
			//-->
		</script>
		<meta http-equiv="refresh" content="0; url=adminFFList.do?pageNum=${pageNum}&division=${division}">
	</c:if>
	<c:if test="${result == -1}">
		<script type="text/javascript">
			<!--
			alert( replyerror );
			//-->
		</script>
		<meta http-equiv="refresh" content="0; url=adminFFList.do?pageNum=${pageNum}&division=${division}">
	</c:if>
	<c:if test="${result == 1}">
		<c:redirect url="adminFFList.do?pageNum=${pageNum}&division=${division}"/>			
	</c:if>