<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../intro/setting.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">	
		<link href="./include/a_include.css" rel="stylesheet">	
	</head>

	<body>
	<script src="${project}${folder}script.js"></script>    
		
		<div class="asidebox">
	         <ul>
	         	 <li>
	         	 	<div id="te">스키장</div>
	         	 </li>
	             <li>
	                 <a href="adminintroSki.do" class="aside_a">
	                     <span class="fa fa-angle-double-right text-primary"></span>스키장 안내 및 제원
	                 </a>
	             </li>
	             <li>
	                 <a href="adminintroWebcam.do" class="aside_a">
	                     <span class="fa fa-angle-double-right text-primary"></span>실시간웹캠
	                 </a>
	             </li>
	             <li>
	         	 	<div id="te">콘도</div>
	         	 </li>
	             <li>
	                 <a href="adminintroCondo.do" class="aside_a">
	                     <span class="fa fa-angle-double-right text-primary"></span>콘도소개
	                 </a>
	             </li>
	             <li>
	                 <a href="adminintroCondoView2.do" class="aside_a">
	                     <span class="fa fa-angle-double-right text-primary"></span>객실 미리보기
	                 </a>
	             </li>
	         </ul>
	    </div>
	</body>
</html>