<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="${project}noticeBoard/script.js"></script>

<%@include file="/include/adminmainheader.jsp" %>
<%@include file="/include/adminWinterParkaside.jsp" %>

<h2> ${page_write} </h2>
<br><br>
<body onload="writefocus()">
	<form method="post" action="adminNoticeWritePro.do" name="writeform" onsubmit="return writecheck()">
		<table style="width:70%; margin:auto; text-align: center" border="1">
			<tr>
				<th colspan="2" >
					<a href="adminNoticeList.do" style="float:right;">${str_list}</a>&nbsp;&nbsp;&nbsp;
				</th> 
			</tr>
			<tr>
				<th style="text-align: center;"> ${str_subject} </th>
				<td>
					<input class="input" type="text" name="subject" maxlength="50" style="width: 286px">
				</td>
			</tr>
			<tr>
				<th style="text-align: center;"> ${str_content} </th>
				<td>
					<textarea name="content" rows="10" cols="38"></textarea>
				</td>
			</tr>	
		</table>	
	</form>
	<div style="width:70%; margin:auto; text-align: center; float:right;">
		<input class="btn btn-primary" type="submit" value="${btn_write}">
		<input class="btn btn-primary" type="reset" value="${btn_cancel}">
		<input class="btn btn-primary" type="button" value="${btn_list}" onclick="location='adminNoticeList.do'">
	</div>
	<%@include file="/include/mainfooter.jsp" %>
</body>
    
    
    
    
    
    
    
    
    
    
    