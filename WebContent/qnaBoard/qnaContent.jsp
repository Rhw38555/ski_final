<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<%@include file="/include/mainheader.jsp"%>
<%@include file="/include/mainnav.jsp"%>
<link href="${project}${location}style.css" rel="stylesheet" type="text/css">
	
<table>
	<tr>
		<th style="width: 10%"> ${str_id} </th>
		<td style="width: 10%" align="center"> 
			${qnaDto.id} 
		</td>
		<th style="width: 10%"> ${str_subject} </th>
		<td style="width: 10%" align="center"> 
			${qnaDto.subject} 
		</td>
	</tr>
	<tr>
	<tr>
		<th> ${str_content} </th>
		<td colspan="4">
			<pre>${qnaDto.content}</pre>
		</td>
	</tr>
	<tr>
		<th colspan="4">
			<c:if test="${qnaDto.answer == null}">
				관리자의 답변을 기다리고 있습니다.
			</c:if>
			<c:if test="${qnaDto.answer != null}">
				${qnaDto.answer}
			</c:if>
		</th>
	</tr>
	<tr>
		<th colspan="4">
			<!-- 
			관리자 영역
			<input class="inputbutton" type="button" value="${btn_modify}"
				onclick="location='boardModifyForm.do?num=${boardDto.num}&pageNum=${pageNum}'">
			
			<input class="inputbutton" type="button" value="${btn_delete}"
				onclick="location='boardDeleteForm.do?num=${boardDto.num}&pageNum=${pageNum}'">
			<input class="inputbutton" type="button" value="${btn_reply}"
				onclick="location='boardWriteForm.do?num=${boardDto.num}&ref=${boardDto.ref}&re_step=${boardDto.re_step}&re_level=${boardDto.re_level}'">
			-->
			<input class="inputbutton" type="button" value="${btn_list}"
				onclick="location='qnaList.do?pageNum=${pageNum}'">			
		</th>
	</tr>

</table>