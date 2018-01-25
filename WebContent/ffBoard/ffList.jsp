<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<%@ include file="setting.jsp"%>
<%@include file="/include/mainheader.jsp"%>
<%@include file="/include/mainnav.jsp"%>
<link href="${project}${location}style.css" rel="stylesheet" type="text/css">

<!-- 정보 리스트 -->	           
	<input type="button" value="전체 보기" onclick="location='ffList.do?division=0'">
	<input type="button" value="식음 시설" onclick="location='ffList.do?division=1'">
	<input type="button" value="부대 시설" onclick="location='ffList.do?division=2'"> 	
	<c:if test="${count == 0}">
		<table class="table">
			<tr>
				<th colspan=4 align="right">
				</th>
			</tr>
		    <tr>
	        	<td colspan="4" align="center">
				등록된 시설이 없습니다.
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
	    	<tbody>
	            <c:set var="cnt" value="1"/>
					<c:forEach var="article" items="${articles}">
						<tr>
							<th>${article.name}</th>
							<td style="margin:5%" id="apart">
								<a href="ffContent.do?num=${article.num}&pageNum=${pageNum}&division=${division}">
									<img src="${project}ff/${article.thumbnail}" style="
										width:100%;
										height:auto;
									">
								</a>
							</td>
							<td colspan="4" style="margin:5%">
								<div align="center">${article.subject}</div>
								<hr>
								${article.introduce}
							</td>
			    		</tr>
				</c:forEach>
			</tbody>
		</table>
		<br><br>
	</c:if>
	<c:if test="${count > 0}">
	<c:if test="${startPage > pageBlock}">
		<a href="ffList.do">[◀◀]</a>
		<a href="ffList.do?pageNum=${startPage-pageBlock}">[◀]</a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">	
		<c:if test="${i == currentPage}">
			<b>[${i}]</b>
		</c:if>	
		<c:if test="${i != currentPage}">
			<a href="ffList.do?pageNum=${i}">[${i}]</a>
		</c:if>	
	</c:forEach>	
	<c:if test="${pageCount > endPage}">
		<a href="ffList.do?pageNum=${startPage + pageBlock}">[▶]</a>
		<a href="ffList.do?pageNum=${pageCount}">[▶▶]</a>
	</c:if>
</c:if>