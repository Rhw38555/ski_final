<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../member/setting.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">	
		<link href="./include/a_include.css" rel="stylesheet">
	</head>

	<body>
		<script src="${project}member/script.js"></script>    
		<br><br><br><br>
	    <div class="asidebox">
	         <ul>
	             <li>
	                 <a href="memberModifyForm.do" class="aside_a">
	                     <span class="fa fa-angle-double-right text-primary"></span>정보수정
	                 </a>
	             </li>
	             <li>
	                 <a href="memberReservationConfirm.do" class="aside_a">
	                     <span class="fa fa-angle-double-right text-primary"></span>예약확인
	                 </a>
	             </li>
	             <li>
	                 <a href="memberUseHistory.do" class="aside_a">
	                     <span class="fa fa-angle-double-right text-primary"></span>사용내역
	                 </a>
	             </li>
	             <li>
	                 <a href="memberDeleteForm.do" class="aside_a">
	                     <span class="fa fa-angle-double-right text-primary"></span>${btn_delete}
	                 </a>
	             </li>
	         </ul>
	    </div>
	</body>
</html>