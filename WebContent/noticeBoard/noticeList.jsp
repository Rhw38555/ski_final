<%@page import="java.text.SimpleDateFormat"%>
<%@page import="noticeBoard.NoticeBoardDataBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="noticeBoard.NoticeBoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<%@include file="/include/mainheader.jsp" %>
<%@include file="/include/WinterParkaside.jsp"%>

<body>
	<div class="container">
		<div class="row">
			<div class="intrototal">
				<h2> ${page_list} </h2>
				<h4>( ${str_count} : ${count} )</h4>
				<br><br>
				<div class="noticetablebox">
					<table>
						<tr>
							<th id="top" style="text-align: center; width: 8%"> 
								${str_num} 
							</th>
							<th id="top" style="text-align: center; width: 40%"> 
								${str_subject}
							</th>	
						</tr>
						<c:if test="${count == 0}">
							<tr>
								<td colspan="2" style="text-align: center;">
									${msg_list_x}
								</td>
							</tr>
						</c:if>
						<c:if test="${count != 0}">
							<c:forEach var="article" items="${articles}">
								<tr>	
									<td>
										${number}
										<c:set var="number" value="${number - 1}"/>						
									</td>
									<td>
										<a href="noticeContent.do?num=${article.num}&pageNum=${pageNum}" style="float: left;">
											${article.subject}
										</a>	
									</td>
								</tr>	
							</c:forEach>		
						</c:if>
					</table>
				</div>
				<br>
				<div style="width:80%; margin:auto; text-align: center; float:right;">
					<c:if test="${count > 0}">
						<c:if test="${startPage > pageBlock}">
							<a href="noticeList.do">[◀◀]</a>
							<a href="noticeList.do?pageNum=${startPage-pageBlock}">[◀]</a>
						</c:if>
						<c:forEach var="i" begin="${	startPage}" end="${endPage}">	
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
				</div>
			</div>
		</div>
	</div>
	<%@include file="/include/mainfooter.jsp" %>
</body>


