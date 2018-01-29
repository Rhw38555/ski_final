<%@page import="java.text.SimpleDateFormat"%>
<%@page import="noticeBoard.NoticeBoardDataBean"%>
<%@page import="noticeBoard.NoticeBoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>

<%@include file="/include/adminmainheader.jsp" %>
<%@include file="/include/adminWinterParkaside.jsp" %>

<h2> ${page_content} </h2>
<br><br>
<table style="width:70%; margin:auto; text-align: center" border="1">
	<tr>
		<th style="height:50px; text-align: center; width: 20%"> ${str_subject} </th>
		<td colspan="3">
			${noticeboardDto.subject}
		</td>
	</tr>
	<tr>
		<th style="text-align: center"> ${str_content} </th>
		<td colspan="3">
			<pre style="height:300px; text-align: left; background:white;">${noticeboardDto.content}</pre>
		</td>
	</tr>
</table>
<br><br>
<div style="width:80%; margin:auto; text-align: center; float:right;">
	<input class="btn btn-primary" type="button" value="수정" onclick="location='adminNoticeModifyForm.do?pageNum=${pageNum}&num=${num}'">
	<input class="btn btn-primary" type="button" value="삭제" onclick="location='adminNoticeDeletePro.do?pageNum=${pageNum}&num=${num}'">
	<input class="btn btn-primary" type="button" value="목록" onclick="location='adminNoticeList.do?pageNum=${pageNum}'">			
</div>
<%@include file="/include/mainfooter.jsp" %>










