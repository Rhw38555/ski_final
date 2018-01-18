<%@page import="java.text.SimpleDateFormat"%>
<%@page import="noticeBoard.NoticeBoardDataBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="noticeBoard.NoticeBoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link href="${project}noticeBoard/style.css" rel="stylesheet" type="text/css">

<%@include file="/include/mainheader.jsp" %>
<%@include file="/include/mainnav.jsp" %>
<%@include file="/include/WinterParkaside.jsp" %>

<h2> ${page_list} ( ${str_count} : ${count} ) </h2>

<table>
	<tr>
		<th style="width: 8%;"> 
			${str_num} 
		</th>
		<th style="width: 40%;"> 
			${str_subject}
		</th>	
	</tr>
	<c:if test="${count == 0}">
		<tr>
			<td colspan="2" align="center">
				${msg_list_x}
			</td>
		</tr>
	</c:if>
	<c:if test="${count != 0}">
		<c:forEach var="article" items="${articles}">
			<tr>	
				<td align="center">
					${number}
					<c:set var="number" value="${number - 1}"/>						
				</td>
				<td>
					<a href="noticeContent.do?num=${article.num}&pageNum=${pageNum}">
						${article.subject}
					</a>	
				</td>
			</tr>	
		</c:forEach>		
	</c:if>
</table>
<br>
<c:if test="${count > 0}">
	<c:if test="${startPage > pageBlock}">
		<a href="noticeList.do">[◀◀]</a>
		<a href="noticeList.do?pageNum=${startPage-pageBlock}">[◀]</a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">	
		<c:if test="${i == currentPage}">
			<b>[${i}]</b>
		</c:if>	
		<c:if test="${i != currentPage}">
			<a href="noticeList.do?pageNum=${i}">[${i}]</a>
		</c:if>	
	</c:forEach>	
	<c:if test="${pageCount > endPage}">
		<a href="noticeList.do?pageNum=${startPage + pageBlock}">[▶]</a>
		<a href="noticeList.do?pageNum=${pageCount}">[▶▶]</a>
	</c:if>
</c:if>


