<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="setting.jsp"%>
<%@include file="/include/adminmainheader.jsp"%>
<%@include file="/include/adminmainnav.jsp"%>
<link href="${project}${location}style.css" rel="stylesheet" type="text/css">

	<form method="post" action="adminQnaDeletePro.do">
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
					<input class="inputbutton" type="submit" value="${btn_del}">
					<input class="inputbutton" type="button" value="${btn_del_cancel}"
						onclick="location='adminQnaList.do?pageNum=${pageNum}'">
				</th>
			</tr>
		</table>	
	</form>