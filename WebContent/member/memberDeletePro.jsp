<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<script src="${project}member/script.js"></script>

<c:if test="${resultCheck == 1}">
	<c:if test="${result == 0}">
		<script type="text/javascript">
			<!--
			erroralert( deleteerror );
			//-->
		</script>
	</c:if>
	<c:if test="${result != 0}">	
		${sessionScope.memId = null}
		<c:redirect url="memberDeleteView.do"/>
	</c:if>
</c:if>
<c:if test="${resultCheck == -1}">
	<script type="text/javascript">
		<!--
		erroralert( loginpasserror );
		//-->
	</script>
</c:if>