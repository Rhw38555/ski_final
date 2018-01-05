<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%> 
<script src="${project}member/script.js"></script>
    
<c:if test="${passwd=='nonPasswd'}">
	<script type="text/javascript">
		<!--
			alert( findPasswderror );
		-->
	</script>
	<meta http-equiv="refresh" content="0; url=memberFindPasswd.do"/>
</c:if>
	
<c:if test="${passwd!='nonPasswd'}">
	<script type="text/javascript">
		<!--
			alert( findPasswd );
		-->
	</script>
	<meta http-equiv="refresh" content="0; url=memberLoginForm.do"/>
</c:if>    