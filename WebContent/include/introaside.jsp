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
	</head>

	<body>
	<script src="${project}${folder}script.js"></script> 
		<br><br><br><br>
		<div class="asidebox">
		<br><br>
			<ul>
			<pre>스키장</pre>
				<li>
					<a href="introSki.do" class="aside_a">
						<span class="fa fa-angle-double-right text-primary"></span>스키장 안내 및 제원
					</a>
				</li>
				<li>
					<a href="introWebcam.do" class="aside_a">
						<span class="fa fa-angle-double-right text-primary"></span>실시간웹캠
					</a>
				</li>
			<pre>콘도</pre>
				<li>
					<a href="introCondo.do" class="aside_a">
						<span class="fa fa-angle-double-right text-primary"></span>콘도소개
					</a>
				</li>
				<li>
					<a href="introCondoView2.do" class="aside_a">
						<span class="fa fa-angle-double-right text-primary"></span>객실 미리보기
					</a>
				</li>
			</ul>
		</div>
	</body>
</html>