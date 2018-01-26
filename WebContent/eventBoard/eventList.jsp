<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<%@ include file="setting.jsp"%>
<%@include file="/include/mainheader2.jsp"%>
<link href="${project}${location}style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
<script src="//cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>

<style>
.img
{
	max-width : 100%;
	height : auto;
}
.selector {
	align: center;
}
</style>

<!-- 정보 리스트 -->	            	
	<c:if test="${count == 0}">
		<table class="table">
		    <tr>
	        	<td colspan="4" align="center">
				이벤트가 없습니다
				</td>
			</tr>
		</table>
	</c:if>
	<c:if test="${count != 0}">
		<div class="container">
			<div class="row">
				<div class='list-group gallery'>
					<c:forEach var="article" items="${articles}">
		            <div class='col-sm-4 col-xs-6 col-md-3 col-lg-3'>
		                <a class="thumbnail fancybox" rel="ligthbox" href="eventContent.do?num=${article.num}&pageNum=${pageNum}">
		                    <img class="img-responsive" alt="" src="${project}event/${article.thumbnail}" />
		                    <div class='text-right'>
		                        <small class='text-muted'>${article.subject}</small>
		                    </div> <!-- text-right / end -->
		                </a>
		            </div> <!-- col-6 / end -->
		            </c:forEach>
		        </div> <!-- list-group / end -->
			</div> <!-- row / end -->
		</div> <!-- container / end -->
		<br><br>
	</c:if>
<div align="center">
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
</div>