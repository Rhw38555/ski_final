<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<%@include file="/include/mainheader.jsp"%>
<%@include file="/include/mainnav.jsp"%>
<link href="${project}${location}style.css" rel="stylesheet" type="text/css">
<script src="${project}jquery-3.2.1.js"></script>


<body>
	<form method="post" action="qnaWritePro.do"
	 	name="writeform" onsubmit="return writecheck()">

		<table>
			<tr>
				<th colspan="2" align="right">
					&nbsp;&nbsp;&nbsp;
				</th>
			</tr>
			<tr>
				<th> ${str_subject} </th>
				<td>
					<input class="input" type="text" name="subject"
						maxlength="50" style="width: 286px">
				</td>
			</tr>
			<tr>
				<th> ${str_content} </th>
				<td>
					<textarea name="content" rows="10" cols="40"></textarea>
				</td>
			</tr>
			<tr>
				<th colspan="2">	
					<input class="inputbutton" type="submit" value="${btn_write}">
					<input class="inputbutton" type="button" value="${btn_cancel}"
						onclick="location='qnaList.do'">
				</th>
			</tr>
		</table>	
	</form>
</body>