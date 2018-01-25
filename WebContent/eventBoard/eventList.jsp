<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<%@ include file="setting.jsp"%>
<%@include file="/include/mainheader.jsp"%>
<%@include file="/include/mainnav.jsp"%>
<link href="${project}${location}style.css" rel="stylesheet" type="text/css">

<style>
.img
{
	max-width : 100%;
	height : auto;
}
</style>

<c:set var="adminId" value="1" scope="session"/>
<!-- 정보 리스트 -->	            	
	<c:if test="${count == 0}">
		<table class="table">
			<tr>
				<th colspan="4" align="right">
				</th>
			</tr>
		    <tr>
	        	<td colspan="4" align="center">
				이벤트가 없습니다
				</td>
			</tr>
		</table>
	</c:if>
	<c:if test="${count != 0}">
		<table class="table">
			<tr>
				<th colspan="4" align="right">
				</th>
			</tr>
	    	<tbody>
	            <c:set var="cnt" value="1"/>
	            <tr>
					<c:forEach var="article" items="${articles}">
						<c:if test="${cnt == 5}">
					    	<tr><c:set var="cnt" value="1"/></tr>
					    	<!-- <tr><td style="border:0px solid #fff;"></td></tr> -->
						</c:if>
						<c:if test="${cnt <= 4}">
							<td id="apart"
							align="center">
								<a href="eventContent.do?num=${article.num}&pageNum=${pageNum}">
									<img src="${project}event/${article.thumbnail}"
									class="img"><br>
									${article.subject}
								</a>
							</td>
						</c:if>
						<c:set var="cnt" value="${cnt+1}"/>
					</c:forEach>
			    </tr>
			</tbody>
		</table>
		<br><br>
	</c:if>
	<c:if test="${count > 0}">
	<c:if test="${startPage > pageBlock}">
		<a href="eventList.do">[◀◀]</a>
		<a href="eventList.do?pageNum=${startPage-pageBlock}">[◀]</a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">	
		<c:if test="${i == currentPage}">
			<b>[${i}]</b>
		</c:if>	
		<c:if test="${i != currentPage}">
			<a href="eventList.do?pageNum=${i}">[${i}]</a>
		</c:if>	
	</c:forEach>	
	<c:if test="${pageCount > endPage}">
		<a href="eventList.do?pageNum=${startPage + pageBlock}">[▶]</a>
		<a href="eventList.do?pageNum=${pageCount}">[▶▶]</a>
	</c:if>
</c:if>