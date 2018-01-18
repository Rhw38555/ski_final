<%@page import="noticeBoard.NoticeBoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="${project}noticeBoard/script.js"></script>    

<%@include file="/include/adminmainheader.jsp" %>
<%@include file="/include/adminmainnav.jsp" %>
<%@include file="/include/adminWinterParkaside.jsp" %>

<h2> ${page_delete} </h2>

<c:if test="${result == 0}">
	<script type="text/javascript">
		<!--
		alert( deleteerror );
		//-->
	</script>
	<meta http-equiv="refresh" content="0; url=adminNoticeList.do?pageNum=${pageNum}">
</c:if>
<c:if test="${result == 1}">	
	<c:redirect url="adminNoticeList.do?pageNum=${pageNum}"/>		
</c:if>
	











