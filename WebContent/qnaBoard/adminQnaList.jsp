<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<%@ include file="setting.jsp"%>
<link href="${project}${location}style.css" rel="stylesheet" type="text/css">

<c:set var="adminId" value="1" scope="session"/>
<!-- 정보 리스트 -->	           
	<input type="button" value="전체 보기" onclick="location='adminQnaList.do'">
	<input type="button" value="접수대기 문의 보기" onclick="location='adminQnaList.do?current_status=접수대기'">
	<input type="button" value="진행중 문의 보기" onclick="location='adminQnaList.do?current_status=처리중'">
	
	<c:if test="${count == 0}">
		<table class="table">
			<tr>
				<th colspan=4 align="right">
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
								<a href="adminQnaContent.do?num=${article.num}&pageNum=${pageNum}&current_status=${article.current_status}">
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
		<a href="adminQnaList.do?setcurrent_status=${setcurrent_status}">[◀◀]</a>
		<a href="adminQnaList.do?pageNum=${startPage-pageBlock}&current_status=${current_status}">[◀]</a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">	
		<c:if test="${i == currentPage}">
			<b>[${i}]</b>
		</c:if>	
		<c:if test="${i != currentPage}">
			<a href="adminQnaList.do?pageNum=${i}&current_status=${current_status}">[${i}]</a>
		</c:if>	
	</c:forEach>	
	<c:if test="${pageCount > endPage}">
		<a href="adminQnaList.do?pageNum=${startPage + pageBlock}&current_status=${current_status}">[▶]</a>
		<a href="adminQnaList.do?pageNum=${pageCount}&current_status=${current_status}">[▶▶]</a>
	</c:if>
</c:if>