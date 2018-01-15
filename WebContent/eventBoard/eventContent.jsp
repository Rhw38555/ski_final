<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link href="${project}${location}style.css" rel="stylesheet" type="text/css">
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
			<input class="inputbutton" type="button" value="${btn_list}"
				onclick="location='eventList.do?pageNum=${pageNum}'">			
		</th>
	</tr>
</table>