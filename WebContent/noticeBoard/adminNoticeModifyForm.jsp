<%@page import="noticeBoard.NoticeBoardDataBean"%>
<%@page import="noticeBoard.NoticeBoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%@ include file="setting.jsp" %>
<link href="${project}noticeBoard/style.css" rel="stylesheet" type="text/css" >
<script src="${project}noticeBoard/script.js"></script>

<h2> ${page_modify} </h2>

	<body onload="modifyfocus()">
		<form method="post" action="adminNoticeModifyPro.do" name="modifyform" onsubmit="return modifycheck()">

		<input type="hidden" name="num" value="${num}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		
			<table>
				<tr>
					<th> ${str_subject}</th>
					<td>
						<input class="input" type="text" name="subject" maxlength="50" value="${noticeboardDto.subject}" style="width:260px">
					</td>
				</tr>
					<tr>
						<th> ${str_content} </th>
						<td>
						<textarea name="content" rows="10" cols="35">${noticeboardDto.content}</textarea>
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input class="inputbutton" type="submit" value="${btn_mod}">
						<input class="inputbutton" type="reset" value="${btn_cancel}">
						<input class="inputbutton" type="button" value="${btn_mod_cancel}" onclick="location='adminNoticeList.do?pageNum=${pageNum}'">
					</th>
				</tr>
			</table>
		</form>
	</body>






