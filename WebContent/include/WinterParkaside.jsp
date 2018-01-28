<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../intro/setting.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">	
		<link href="/SKI_Final/include/a_include.css" rel="stylesheet">  
	</head>

	<body>
		<script src="${project}member/script.js"></script>    
		<div id="asidebox">
		    <div class="asidebox">
		         <ul>
		             <li>
		                 <a href="WinterParkLiftPrice.do" class="aside_a">
		                     <span class="fa fa-angle-double-right text-primary"></span>요금안내
		                 </a>
		             </li>
		             <li>
		                 <a href="noticeList.do" class="aside_a">
		                     <span class="fa fa-angle-double-right text-primary"></span>공지사항
		                 </a>
		             </li>
		             <li>
		                 <a href="WinterParkTrafic.do" class="aside_a">
		                     <span class="fa fa-angle-double-right text-primary"></span>교통정보
		                 </a>
		             </li>
		         </ul>
		    </div>
	    </div>
	</body>
</html>