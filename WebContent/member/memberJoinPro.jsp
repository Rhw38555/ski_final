<%@page import="member.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<script src="${project}member/script.js"></script>

<h2> ${page_input} </h2>

<c:if test="${result == 0}">
	<script type="text/javascript">
		<!--
		erroralert( inputerror );
		//-->
	</script>
</c:if>
<c:if test="${result != 0}">
	<c:redirect url="memberJoinView.do"/>
</c:if>	

