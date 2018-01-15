<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<%@ include file="setting.jsp"%>
<link href="${project}${location}style.css" rel="stylesheet" type="text/css">

<c:set var="adminId" value="admin" scope="session"/>
<!-- 정보 리스트 -->	           
	<input type="button" value="전체 보기" onclick="location='adminFFList.do?division=0'">
	<input type="button" value="식음 시설" onclick="location='adminFFList.do?division=1'">
	<input type="button" value="부대 시설" onclick="location='adminFFList.do?division=2'">
	<h2>
	<c:if test="${division == 0}">식음/부대시설 전체</c:if>
	<c:if test="${division == 1}">식음 시설</c:if>
	<c:if test="${division == 2}">부대 시설</c:if> 
	</h2>	
	<c:if test="${count == 0}">
		<table class="table">
			<tr>
				<th colspan="6" align="right">
					<c:if test="${sessionScope.adminId != null}">
						<a href="adminFFWriteForm.do">신규 시설 추가</a>
					</c:if>
				</th>
			</tr>
		    <tr>
	        	<td colspan="6" align="center">
				등록된 시설이 없습니다.
				</td>
			</tr>
		</table>
	</c:if>
	<c:if test="${count != 0}">
		<table class="table">
			<tr>
				<th colspan="6" align="right">
					<c:if test="${sessionScope.adminId != null}">
						<a href="adminFFWriteForm.do">신규 시설 추가</a>
					</c:if>
				</th>
			</tr>
	    	<tbody>
	            <c:set var="cnt" value="1"/>
					<c:forEach var="article" items="${articles}">
						<tr>
							<th>${article.name}</th>
							<td style="margin:5%" id="apart">
								<a href="adminFFContent.do?num=${article.num}&pageNum=${pageNum}&division=${division}">
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
		<a href="adminFFList.do?division=${division}">[◀◀]</a>
		<a href="adminFFList.do?pageNum=${startPage-pageBlock}&division=${division}">[◀]</a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">	
		<c:if test="${i == currentPage}">
			<b>[${i}]</b>
		</c:if>	
		<c:if test="${i != currentPage}">
			<a href="adminFFList.do?pageNum=${i}&division=${division}">[${i}]</a>
		</c:if>	
	</c:forEach>	
	<c:if test="${pageCount > endPage}">
		<a href="adminFFList.do?pageNum=${startPage + pageBlock}&division=${division}">[▶]</a>
		<a href="adminFFList.do?pageNum=${pageCount}&division=${division}">[▶▶]</a>
	</c:if>
</c:if>