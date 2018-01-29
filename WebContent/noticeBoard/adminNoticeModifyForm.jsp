<%@page import="noticeBoard.NoticeBoardDataBean"%>
<%@page import="noticeBoard.NoticeBoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%@ include file="setting.jsp" %>
<link href="${project}noticeBoard/style.css" rel="stylesheet" type="text/css" >
<script src="${project}noticeBoard/script.js"></script>

<%@include file="/include/adminmainheader.jsp" %>
<%@include file="/include/adminWinterParkaside.jsp" %>

<h2> ${page_modify} </h2>
<br><br>
	<body onload="modifyfocus()">
		<form method="post" action="adminNoticeModifyPro.do" name="modifyform" onsubmit="return modifycheck()">

		<input type="hidden" name="num" value="${num}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		
			<table style="width:70%; margin:auto; text-align: center" border="1">
				<tr>
					<th style="text-align: center;"> ${str_subject}</th>
					<td>
						<input class="input" type="text" name="subject" maxlength="50" value="${noticeboardDto.subject}" style="width:260px">
					</td>
				</tr>
					<tr>
						<th style="text-align: center;"> ${str_content} </th>
						<td>
						<textarea name="content" rows="10" cols="35">${noticeboardDto.content}</textarea>
					</td>
				</tr>					
			</table>	
			<div style="width:70%; margin:auto; text-align: center; float:right;">
				<input class="btn btn-primary" type="submit" value="${btn_mod}">
				<input class="btn btn-primary" type="reset" value="취소">
				<input class="btn btn-primary" type="button" value="${btn_mod_cancel}" onclick="location='adminNoticeList.do?pageNum=${pageNum}'">
			</div>	
		</form>
		<%@include file="/include/mainfooter.jsp" %>
	</body>






