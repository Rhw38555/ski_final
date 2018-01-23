<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../member/setting.jsp" %>

<!DOCTYPE html>
<html>
	 <script src="${project}member/jquery-3.2.1.js"></script>
	 <script src="${project}member/jquery-barcode.js"></script>
	<head>
		<meta charset="UTF-8">
		<!-- 
		<style type="text/css">
			body{
				text-align: center;
			}
			aside {
				width : 199px;	
				height : 280px;				
				float : left;
			}
			section {
				width : 1300px;			
				height : 1000px;
				float : left;
			}
			.topleft, .topright, .bottomleft, .bottomright{
				width : 200px;
				height : 200px;
				margin : 50px;
			}
			.admin {
				width : 500px;
				height : 200px;
				margin : 50px;
			}
			.button {
				width : 190px;
				height : 100px;
			}
			footer {
				clear : left;
				height : 50px;
			}	
			header, aside, section, footer {
				border : 1px solid black;
				margin : 0px;
			}
		</style>
		 -->
	</head>

	<body>
	<script src="${project}member/script.js"></script> 
	
    <%@include file="/include/mainnav.jsp" %>
 	<%@include file="/include/mainheader.jsp" %>
 	
	<div class="content-block" id="portfolio">
		<div class="container">
			<section class="block-body">
				<div class="row">
					<div class="col-sm-4 blog-post">
						<a href="adminMain.do" class="recent-work" style="background-image:url(assets/images/newsletter-bg.png)">
							<h2 style="color:white">먹거리</h2>
						</a>
					</div>
					<div class="col-sm-4 blog-post">
						<a href="adminMain.do" class="recent-work" style="background-image:url(assets/images/newsletter-bg.png)">
							<h2 style="color:white">부대시설</h2>
						</a>
					</div>
					<div class="col-sm-4 blog-post">
						<a href="adminMain.do" class="recent-work" style="background-image:url(assets/images/newsletter-bg.png)">
							<h2 style="color:white">이벤트 정보</h2>
						</a>
					</div>
					
				</div>
				<div class="row">
					<div class="col-sm-4 blog-post">
						<a href="adminMain.do" class="recent-work" style="background-image:url(assets/images/newsletter-bg.png)">
							<h2 style="color:white">할인 정보</h2>
						</a>
					</div>
					<div class="col-sm-4 blog-post">
						<a href="adminMain.do" class="recent-work" style="background-image:url(assets/images/newsletter-bg.png)">
							<h2 style="color:white">공지사항</h2>
						</a>
					</div>
					<div class="col-sm-4 blog-post">
						<a href="adminMain.do" class="recent-work" style="background-image:url(assets/images/newsletter-bg.png)">
							<h2 style="color:white">통합예약</h2>
						</a>
					</div>
				</div>
			</section>
		</div>
	</div><!-- #portfolio -->
			

		<aside>
			<table border="1">
				<tr>
					<td>
						<c:set var="wfKor" value="${wfKor}"/>
						<c:if test="${fn:contains(wfKor, '구름')}">
							<img src="/SKI_Final/images/구름.PNG" width="140px" height="100px"/>
						</c:if>
						<c:if test="${fn:contains(wfKor, '눈')}">
							<img src="/SKI_Final/images/눈.PNG" width="140px" height="100px"/>
						</c:if>
						<c:if test="${fn:contains(wfKor, '맑음')}">
							<img src="/SKI_Final/images/맑음.PNG" width="140px" height="100px"/>
						</c:if>
						<c:if test="${fn:contains(wfKor, '비')}">
							<img src="/SKI_Final/images/비.PNG" width="140px" height="100px"/>
						</c:if>
						<c:if test="${fn:contains(wfKor, '흐림')}">
							<img src="/SKI_Final/images/흐림.PNG" width="140px" height="100px"/>
						</c:if>
					<br>
						 최저온도 : ${tmn}
					<br>
						 최고온도 : ${tmx}
					<br>
						${wfKor}
							
					</td>
				</tr>
				
				<tr>
					<td>
						<input class="button" type="button" value="WinterPark 오시는길" onclick="location='WinterParkTrafic.do'">
						
					</td>
				</tr>
			</table>
		<br><br>
		<div id="result"></div>
		</div>
		</aside>	
		<%@include file="/include/mainfooter.jsp" %>
	</body>
</html>