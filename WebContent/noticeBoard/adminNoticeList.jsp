<%@page import="java.text.SimpleDateFormat"%>
<%@page import="noticeBoard.NoticeBoardDataBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="noticeBoard.NoticeBoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link href="${project}noticeBoard/style.css" rel="stylesheet" type="text/css">

<%@include file="/include/adminmainheader.jsp" %>
<%@include file="/include/adminWinterParkaside.jsp" %>

<h2> ${str_notice} </h2>
<div align="left">${page_list} ( ${str_count} : ${count} )</div>
<table>
	<tr>
		<th colspan="3" align="right">
			<a href="adminNoticeWriteForm.do">
				${str_write}
			</a>&nbsp;&nbsp;&nbsp;
		</th> 
	</tr>
	<tr>
		<th style="width: 8%;">
			${str_del}
		</th>
		<th style="width: 8%;"> 
			${str_num} 
		</th>
		<th style="width: 40%;"> 
			${str_subject}
		</th>	
	</tr>
	<c:if test="${count == 0}">
		<tr>
			<td colspan="3" align="center">
				${msg_list_x}
			</td>
		</tr>
	</c:if>
	<c:if test="${count != 0}">
		<c:forEach var="article" items="${articles}">
			<tr>	
				<td>
					<input class="inputbutton" type="button" value="${btn_del}" onclick="location='adminNoticeDeletePro.do?pageNum=${pageNum}&num=${article.num}'">
				</td>
				<td align="center">
					${number}
					<c:set var="number" value="${number - 1}"/>						
				</td>
				<td>
					<a href="adminNoticeContent.do?num=${article.num}&pageNum=${pageNum}">
						${article.subject}
					</a>	
				</td>
			</tr>	
		</c:forEach>		
	</c:if>
</table>
<br>
<!-- 검색기능 -->

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












