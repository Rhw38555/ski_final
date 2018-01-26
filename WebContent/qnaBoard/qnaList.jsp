<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<%@ include file="setting.jsp"%>
<%@include file="/include/mainheader2.jsp"%>

<style>
	.al-ct{
		text-align:right;
	}
	.th-num{
		align: center;
		 
	}
	.th-sub{
		align: center;
		
	}
	.th-cs{
		align: center;
	}
	.table{
		align: center;
	}
</style>

<!-- 정보 리스트 -->	          
 	<c:if test="${sessionScope.memId != null}">
		<div class="al-ct"><a href="qnaWriteForm.do">1:1문의 등록</a>&nbsp;&nbsp;</div>
	</c:if>
	<c:if test="${count == 0}">
		<table class="table">
		    <tr>
	        	<td colspan="3" align="center">
				등록된 문의가 없습니다.
				</td>
			</tr>
		</table>
	</c:if>
	<c:if test="${count != 0}">
		<table class="table">
			<tr>
				<td align="center"> 
					${str_num}
				</td>
				<td align="center"> 
					${str_subject}
				</td>
				<td align="center">
					${str_current_status}
				</td>
			</tr>
	    	<tbody>
	            <tr>
					<c:forEach var="article" items="${articles}">
						<tr>	
							<td align="center">
								${number}
								<c:set var="number" value="${number - 1}"/>						
							</td>
							<td align="center">
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
	<div align="center">
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
	</div>