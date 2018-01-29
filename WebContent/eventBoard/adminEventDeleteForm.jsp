<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="setting.jsp"%>
<%@include file="/include/adminmainheader.jsp"%>

<link href="${project}${location}style.css" rel="stylesheet" type="text/css">

	<form method="post" action="adminEventDeletePro.do">
		<input type="hidden" name="num" value="${num}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		
		<table>
			<tr>
				<th colspan="2">
					${msg_del_check}
				</th>
			</tr>
			<tr>
				<th colspan="2">
					<input class="inputbutton" type="submit" value="삭제">
					<input class="inputbutton" type="button" value="취소"
						onclick="location='adminEventList.do?num=${num}&pageNum=${pageNum}&division=${division}'">
				</th>
			</tr>
		</table>	
	</form>
<%@include file="/include/mainfooter.jsp" %>