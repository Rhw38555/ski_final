<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<%@ include file="setting.jsp"%>
<%@include file="/include/adminmainheader.jsp" %>
<link href="ffBoard/ffboot.css" rel="stylesheet" type="text/css">

<c:set var="adminId" value="admin" scope="session"/>
<!-- 정보 리스트 -->
	<div>
	<c:if test="${sessionScope.adminId != null}">
		<a href="adminFFWriteForm.do" text-align="right">신규 시설 추가</a>
	</c:if>   
	<input type="button" value="전체 보기" onclick="location='adminFFList.do?division=0'">
	<input type="button" value="식음 시설" onclick="location='adminFFList.do?division=1'">
	<input type="button" value="부대 시설" onclick="location='adminFFList.do?division=2'">
	</div>
	<h2>
	<c:if test="${division == 0}">식음/부대시설 전체</c:if>
	<c:if test="${division == 1}">식음 시설</c:if>
	<c:if test="${division == 2}">부대 시설</c:if> 
	</h2>	
	<c:if test="${count == 0}">
		<h2>등록된 시설이 없습니다.</h2>
	</c:if>
	<c:if test="${count != 0}">
		<div class="container">
		    <div class="row">
		    </div>
		    <hr>
		    <!-- Begin of rows -->
		    <c:forEach var="article" items="${articles}">
			    <div class="row carousel-row">
			        <div class="col-xs-8 col-xs-offset-2 slide-row">
			            <div id="carousel-1" class="carousel slide slide-carousel" data-ride="carousel">		            
			              <!-- Wrapper for slides -->
			              <div class="carousel-inner">
			                <div class="item active">
			                    <img class="thumbImage" src="${project}ff/${article.thumbnail}" alt="Image">
			                </div>
			              </div>
			            </div>
			            <div class="slide-content">
			                <h4>${article.name} - ${article.subject}</h4>
			                    <pre>${article.introduce}</pre>
			            </div>
			            <div class="slide-footer">
			                <span class="pull-right buttons">
			                    <button class="btn btn-sm btn-primary"
			                    onclick="location='adminFFContent.do?num=${article.num}&pageNum=${pageNum}&division=${division}'">
			                                     자세히 보기</button>
			                </span>
			            </div>
			        </div>
			    </div>
		    </c:forEach>
		</div>
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
<%@include file="/include/mainfooter.jsp" %>