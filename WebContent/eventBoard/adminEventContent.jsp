<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<%@include file="/include/adminmainheader.jsp"%>

<style>
.img {
	max-width : 100%;
	height : auto;
}
</style>

<table class="table">
	<tr>
		<th> ${str_subject} </th>
		<td align="center">
			${eventDto.subject}
		</td>
	</tr>
	<tr>
		<th colspan="2"> ${str_content} </th>
	</tr>
	<tr>
		<th colspan="2">
			<img src="${project}event/${eventDto.image}" class="img">
		</th>
	</tr>
	<tr>
		<th colspan="2">
			<input class="inputbutton" type="button" value="수정"
				onclick="location='adminEventModifyForm.do?num=${eventDto.num}&pageNum=${pageNum}'">
			<input class="inputbutton" type="button" value="삭제"
				onclick="location='adminEventDeleteForm.do?num=${eventDto.num}&pageNum=${pageNum}'">
			<input class="inputbutton" type="button" value="목록"
				onclick="location='adminEventList.do?pageNum=${pageNum}'">
		</th>
	</tr>
</table>