<%@page import="java.text.SimpleDateFormat"%>
<%@page import="noticeBoard.NoticeBoardDataBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="noticeBoard.NoticeBoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>

<%@include file="/include/adminmainheader.jsp" %>
<%@include file="/include/adminWinterParkaside.jsp" %>
<body>
<h2> ${page_list} </h2>
<h4 style="text-align: center"">( ${str_count} : ${count} )</h4>
<br><br>
<table style="width:50%; margin:auto; text-align: center" border="1">
	<tr>
		<th colspan="3">
			<a href="adminNoticeWriteForm.do" style="float:right;">
				${str_write}
			</a>
		</th> 
	</tr>
	<tr>
		<th style="text-align: center; width: 8%">
			${str_del}
		</th>
		<th style="text-align: center; width: 8%"> 
			${str_num} 
		</th>
		<th style="text-align: center; width: 40%"> 
			${str_subject}
		</th>	
	</tr>
	<c:if test="${count == 0}">
		<tr>
			<td colspan="3" align="center">
				${msg_adminlist_x}
			</td>
		</tr>
	</c:if>
	<c:if test="${count != 0}">
		<c:forEach var="article" items="${articles}">
			<tr>	
				<td>
					<input class="btn btn-primary" type="button" value="${btn_del}" onclick="location='adminNoticeDeletePro.do?pageNum=${pageNum}&num=${article.num}'">
				</td>
				<td align="center">
					${number}
					<c:set var="number" value="${number - 1}"/>						
				</td>
				<td>
					<a href="adminNoticeContent.do?num=${article.num}&pageNum=${pageNum}" style="float: left;">
						${article.subject}
					</a>	
				</td>
			</tr>	
		</c:forEach>		
	</c:if>
</table>
<br>
<!-- 검색기능 -->
<div style="width:80%; margin:auto; text-align: center; float:right;">
<c:if test="${count > 0}">
	<c:if test="${startPage > pageBlock}">
		<a href="adminNoticeList.do">[◀◀]</a>
		<a href="adminNoticeList.do?pageNum=${startPage-pageBlock}">[◀]</a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">	
		<c:if test="${i == currentPage}">
			<b>[${i}]</b>
		</c:if>	
		<c:if test="${i != currentPage}">
			<a href="adminNoticeList.do?pageNum=${i}">[${i}]</a>
		</c:if>	
	</c:forEach>	
	<c:if test="${pageCount > endPage}">
		<a href="adminNoticeList.do?pageNum=${startPage + pageBlock}">[▶]</a>
		<a href="adminNoticeList.do?pageNum=${pageCount}">[▶▶]</a>
	</c:if>
</c:if>
</div>
<%@include file="/include/mainfooter.jsp" %>
</body>











