<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../intro/setting.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">	
		<style>
			@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);   
			@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
			.asidebox{
				width : 20%;
				height: 100%;
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
	</head>

	<body>
		<script src="${project}member/script.js"></script>    
		<br><br><br><br>
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
	</body>
</html>