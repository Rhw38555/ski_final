<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../member/setting.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">	
		<style>
			@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);   
			@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
			.asidebox{
				width : 30%;
				height: 1000px;
				float : left;
				font-family: 'Noto Sans KR', normal;
				padding-left : 50px;
				padding-top : 30px;
				font-size : 20px;	
				line-height : 40px;							
			} 
			.asidebox > ul{
				list-style:none;
			}			
			.aside_a{				
				color: gray;	
				margin-bottom : 15px;		
			}			
			.aside_a:hover{				
				color: orange;
				text-decoration : underline; 
			}
			.aside_a .fa{				
				padding-right : 20px;
			}
		</style>
		 <script type="text/javascript">
			 		 
		</script>
	</head>

	<body onload="viewfocus()">
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