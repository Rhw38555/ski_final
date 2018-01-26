<%@page import="noticeBoard.NoticeBoardDBBean"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="${project}noticeBoard/script.js"></script>

<%@include file="/include/adminmainheader.jsp" %>
<%@include file="/include/adminWinterParkaside.jsp" %>

<h2> ${page_write} </h2>

<c:if test="${result == 0}">
	<script type="text/javascript">
		<!--
		erroralert( writeerror );
		//-->
	</script>
</c:if>
<c:if test="${result == 1}">
	<c:redirect url="adminNoticeList.do"/>
</c:if>		
	


