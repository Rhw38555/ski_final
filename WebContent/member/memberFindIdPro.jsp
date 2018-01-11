<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%> 
<script src="${project}member/script.js"></script>
 	
<c:if test="${id=='nonId'}">
	<script type="text/javascript">
		<!--
		alert( findIderror );
		-->
	</script>
	<meta http-equiv="refresh" content="0; url=memberFindIdForm.do"/>
</c:if>
 	 	
<c:if test="${id!='nonId'}">
	<script type="text/javascript">
		<!--
		alert( findId );
		-->
	</script>
	<meta http-equiv="refresh" content="0; url=memberLoginForm.do"/>
</c:if>