<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="setting.jsp"%>
<link href="${project}${location}style.css" rel="stylesheet" type="text/css">

<form method="post" action="adminQnaModifyPro.do">
<input type="hidden" name="num" value="${qnaDto.num}">
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
			<textarea name="answer" rows="10" cols="30" placeholder="답변을 입력하세요."></textarea>
		</th>
	</tr>
	<tr>
		<th colspan="4">
			<input class="inputbutton" type="submit" value="${btn_write}">
			<input class="inputbutton" type="button" value="${btn_list}"
				onclick="location='adminQnaList.do?pageNum=${pageNum}'">			
		</th>
	</tr>
</table>
</form>