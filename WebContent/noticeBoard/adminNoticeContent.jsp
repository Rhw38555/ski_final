<%@page import="java.text.SimpleDateFormat"%>
<%@page import="noticeBoard.NoticeBoardDataBean"%>
<%@page import="noticeBoard.NoticeBoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link href="${project}noticeBoard/style.css" rel="stylesheet" type="text/css">

<%@include file="/include/adminmainheader.jsp" %>
<%@include file="/include/adminmainnav.jsp" %>
<%@include file="/include/adminWinterParkaside.jsp" %>

<h2> ${page_content} </h2>
<table>
	<tr>
		<th> ${str_subject} </th>
		<td colspan="3">
			${noticeboardDto.subject}
		</td>
	</tr>
	<tr>
		<th> ${str_content} </th>
		<td colspan="3">
			<pre>${noticeboardDto.content}</pre>
		</td>
	</tr>
	<tr>
		<th colspan="4">
			<input class="inputbutton" type="button" value="${btn_mod}" onclick="location='adminNoticeModifyForm.do?pageNum=${pageNum}&num=${num}'">
			<input class="inputbutton" type="button" value="${btn_del}" onclick="location='adminNoticeDeletePro.do?pageNum=${pageNum}&num=${num}'">
			<input class="inputbutton" type="button" value="${btn_list}" onclick="location='adminNoticeList.do?pageNum=${pageNum}'">			
		</th>
	</tr>

</table>





















