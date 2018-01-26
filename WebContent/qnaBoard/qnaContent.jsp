<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<%@include file="/include/mainheader2.jsp"%>
<!doctype html>
<html>
	<head>
		<style>
			.qna_around{
				align: center;
				max-width: 50%;
				margin-left: 25%;
			}
			.qna_answer{
				text-align: left;
			}
			.qna_subject{
				text-align: center;	
			}
			.qna_content{
				text-align: left;
			}
			.btn_center{
				text-align: center;
			}
		</style>
		<link href="${project}${location}style.css" rel="stylesheet" type="text/css">	
	</head>
	<body>
		<div class="qna_around">
			<div class="qna_subject">
				${qnaDto.subject}
			</div>
			<hr>
			<div class="qna_content">
				<pre>${qnaDto.content}</pre>
			</div>
			<hr>
			<div class="qna_answer">
			<c:if test="${qnaDto.answer == null}">
				<pre>관리자의 답변을 기다리고 있습니다.</pre>
			</c:if>
			<c:if test="${qnaDto.answer != null}">
				<pre>${qnaDto.answer}</pre>
			</c:if>
			</div>
		</div>
		<div align="center">
			<input class="inputbutton" type="button" value="${btn_list}"
				onclick="location='qnaList.do?pageNum=${pageNum}'">
		</div>	
	</body>
</html>

		