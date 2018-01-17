<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link href="${project}noticeBoard/style.css" rel="stylesheet" type="text/css">
<script src="${project}noticeBoard/script.js"></script>

<h2> ${page_write} </h2>

<body onload="writefocus()">
	<form method="post" action="adminNoticeWritePro.do" name="writeform" onsubmit="return writecheck()">
		<table>
			<tr>
				<th colspan="2" align="right">
					<a href="adminNoticeList.do">${str_list}</a>&nbsp;&nbsp;&nbsp;
				</th> 
			</tr>
			<tr>
				<th> ${str_subject} </th>
				<td>
					<input class="input" type="text" name="subject" maxlength="50" style="width: 286px">
				</td>
			</tr>
			<tr>
				<th> ${str_content} </th>
				<td>
					<textarea name="content" rows="10" cols="38"></textarea>
				</td>
			</tr>
			<tr>
				<th colspan="2">	
					<input class="inputbutton" type="submit" value="${btn_write}">
					<input class="inputbutton" type="reset" value="${btn_cancel}">
					<input class="inputbutton" type="button" value="${btn_list}" onclick="location='adminNoticeList.do'">
				</th>
			</tr>
		</table>	
	</form>
</body>
    
    
    
    
    
    
    
    
    
    
    