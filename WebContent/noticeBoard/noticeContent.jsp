<%@page import="java.text.SimpleDateFormat"%>
<%@page import="noticeBoard.NoticeBoardDataBean"%>
<%@page import="noticeBoard.NoticeBoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>

<%@include file="/include/mainheader.jsp" %>
<%@include file="/include/WinterParkaside.jsp" %>
<body>
<h2> ${page_content} </h2>
<br><br>
	<table style="width:70%; margin:auto; text-align: center" border="1">
		<tr>
			<th style="text-align: center; width: 30%"> ${str_subject} </th>
			<td colspan="3">
				${noticeboardDto.subject}
			</td>
		</tr>
		<tr>
			<th style="text-align: center" > ${str_content} </th>
			<td colspan="3">
				<pre style="height:300px; text-align: left; background:white;">${noticeboardDto.content}</pre>
			</td>
		</tr>
	</table>
	<br><br>
	<div style="width:70%; margin:auto; text-align: center; float:right;">
		<input class="btn btn-primary" type="button" value="${btn_list}" onclick="location='noticeList.do?pageNum=${pageNum}'">			
	</div>
<%@include file="/include/mainfooter.jsp" %>
</body>




















