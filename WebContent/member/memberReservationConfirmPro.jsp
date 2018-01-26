<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<script src="${project}member/script.js"></script>

<c:if test="${result == 0}">
	<script type="text/javascript">
		
	
	
	</script>
</c:if>
<c:if test="${result != 0}">
	<c:redirect url="memberReservationConfirm.do"/>
</c:if>	