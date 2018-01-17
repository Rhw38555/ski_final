<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<c:if test="${result == 0}">
	<c:if test="${result == 0}">
		<script type="text/javascript">
			<!--
			alert('실패해쩌');
			//-->
		</script>		
	</c:if>
</c:if>
<c:if test="${result != 0}">
	<meta http-equiv="refresh" content="0; url=reversePayCheckForm.do?num=${num}&check=ski">
</c:if>