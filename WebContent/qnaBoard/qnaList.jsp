<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<%@ include file="setting.jsp"%>
<link href="${project}${location}style.css" rel="stylesheet" type="text/css">

<!-- 정보 리스트 -->	          
 
	<c:if test="${count == 0}">
		<table class="table">
			<tr>
				<th colspan=4 align="right">
				<!-- 유저 글 등록 -->
					<c:if test="${sessionScope.memId != null}">
						<a href="qnaWriteForm.do">1:1문의 등록</a>
					</c:if>
				</th>
			</tr>
		    <tr>
	        	<td colspan="4" align="center">
				등록된 문의가 없습니다.
				</td>
			</tr>
		</table>
	</c:if>
	<c:if test="${count != 0}">
		<table class="table">
			<tr>
				<th colspan=4 align="right">
					<c:if test="${sessionScope.memId != null}">
						<a href="QnaWriteForm.do">1:1문의 등록</a>
					</c:if>
				</th>
			</tr>
			<tr>
				<th style="width: 8%;"> 
					${str_num} 
				</th>
				<th style="width: 40%;"> 
					${str_subject}
				</th>
				<th style="width: 10%;">
					${str_current_status}
				</th>
			</tr>
	    	<tbody>
	            <tr>
					<c:forEach var="article" items="${articles}">
						<tr>	
							<td align="center">
								${number}
								<c:set var="number" value="${number - 1}"/>						
							</td>
							<td>
								<a href="qnaContent.do?num=${article.num}&pageNum=${pageNum}">
									${article.subject}
								</a>	
							</td>
							<td align="center">
								${article.current_status}
							</td>
						</tr>	
					</c:forEach>
			    </tr>
			</tbody>
		</table>
		<br><br>
	</c:if>
	<c:if test="${count > 0}">
	<c:if test="${startPage > pageBlock}">
		<a href="qnaList.do">[◀◀]</a>
		<a href="qnaList.do?pageNum=${startPage-pageBlock}">[◀]</a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">	
		<c:if test="${i == currentPage}">
			<b>[${i}]</b>
		</c:if>	
		<c:if test="${i != currentPage}">
			<a href="qnaList.do?pageNum=${i}">[${i}]</a>
		</c:if>	
	</c:forEach>	
	<c:if test="${pageCount > endPage}">
		<a href="qnaList.do?pageNum=${startPage + pageBlock}">[▶]</a>
		<a href="qnaList.do?pageNum=${pageCount}">[▶▶]</a>
	</c:if>
</c:if>