<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="setting.jsp"%>
<%@include file="/include/adminmainheader.jsp"%>
<%@include file="/include/adminmainnav.jsp"%>
<link href="${project}${location}style.css" rel="stylesheet" type="text/css">

	<form method="post" action="adminFFDeletePro.do">
		<input type="hidden" name="num" value="${num}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<input type="hidden" name="division" value="${division}">
		
		<table>
			<tr>
				<th colspan="2">
					삭제하시겠습니까?
				</th>
			</tr>
			<tr>
				<th colspan="2">
					<input class="inputbutton" type="submit" value="${btn_del}">
					<input class="inputbutton" type="button" value="${btn_del_cancel}"
						onclick="location='adminFFList.do?pageNum=${pageNum}&division=${division}'">
				</th>
			</tr>
		</table>	
	</form>