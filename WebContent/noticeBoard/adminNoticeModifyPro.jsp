<%@page import="noticeBoard.NoticeBoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<link href="${project}noticeBoard/style.css" rel="stylesheet" type="text/css" >
<script src="${project}noticeBoard/script.js"></script>

<%@include file="/include/adminmainheader.jsp" %>
<%@include file="/include/adminWinterParkaside.jsp" %>

<h2> ${page_modify} </h2>

<c:if test="${result == 0}">
	<script type="text/javascript">
		<!--
		erroralert(modifyerror);
		//-->
	</script>
	<meta http-equiv="refresh" content="0; url=adminNoticeList.do?pageNum=${pageNum}">
</c:if>
<c:if test="${result == 1}">		
	<c:redirect url="adminNoticeList.do?pageNum=${pageNum}"/>	
</c:if>	

