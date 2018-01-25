<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<%@include file="/include/adminmainheader.jsp"%>
<%@include file="/include/adminmainnav.jsp"%>

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
			<input class="inputbutton" type="button" value="${btn_modify}"
				onclick="location='adminEventModifyForm.do?num=${eventDto.num}&pageNum=${pageNum}'">
			<input class="inputbutton" type="button" value="${btn_delete}"
				onclick="location='adminEventDeleteForm.do?num=${eventDto.num}&pageNum=${pageNum}'">
			<input class="inputbutton" type="button" value="${btn_list}"
				onclick="location='adminEventList.do?pageNum=${pageNum}'">
		</th>
	</tr>
</table>