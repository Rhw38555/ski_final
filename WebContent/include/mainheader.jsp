<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
    
    
<%@ include file="../member/setting.jsp" %>
<!DOCTYPE html>
<html>
	 
	<head>
		<meta charset="UTF-8">
		
		<title>Snow tour a Travel Category Bootstrap Responsive Website Template | Home :: w3layouts</title>
		<!-- for-mobile-apps -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="Snow tour Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
		Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
				function hideURLbar(){ window.scrollTo(0,1); } </script>
		<!-- //for-mobile-apps -->
		<link href="${project}assets/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
		<!-- 
		<link href="${project}assets/css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
		 -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link href="${project}assets/css/style.css" rel="stylesheet" type="text/css" media="all" />
		<!-- Chocolat-CSS -->
		<link rel="stylesheet" href="css/chocolat.css"	  type="text/css" media="all">
		<link href="//fonts.googleapis.com/css?family=Montserrat+Alternates:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
		<link href="//fonts.googleapis.com/css?family=Noto+Sans:400,700" rel="stylesheet">
		<link href="//fonts.googleapis.com/css?family=Lato:300,400,700,900" rel="stylesheet">
		<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
		<!--//fonts-->
		<!-- Supportive-JavaScript -->
		<script src="js/modernizr.js"></script>
		<!-- //Supportive-JavaScript -->	
	</head>
	
	<sql:query var="rs" dataSource="jdbc/kh">
      select user_barcode from wp_user_barcodes where id=?
   <sql:param value="${sessionScope.memId}"/>
   </sql:query>
   
            <c:forEach var="row" items="${rs.rows}">
                  <c:set var="user_barcode" value="${row.user_barcode}"/>
            </c:forEach>
	
	<body onload="generateBarcode('${user_barcode}')">
	
	<script src="${project}member/script.js"></script>
		<!--Header-->
		<header> 
			
			<div class="header" id="home">
			<!--Top-Bar-->
			
				<div class="top-bar">
				<div class="container-fluid">
				<c:if test="${sessionScope.memId == null}">
               			<div class="member-button">
                        <input type="button" value="${btn_login}" onclick="location='memberLoginForm.do'">
                        <input type="button" value="${btn_join}" onclick="location='memberJoinForm.do'">
                  		</div>
            	</c:if>
            <c:if test="${sessionScope.memId != null}">
                    	 
                    	<div class="member-button"> 
                    	<div id="barcodeTarget" class="barcodeTarget"></div>
                    	${sessionScope.memId} ${msg_loginmain}
                        <input type="button" value="${btn_logout}" onclick="location='memberLogout.do'"> 
                        <input type="button" value="${btn_mypage}" onclick="location='memberModifyForm.do'">
                        
                        </div>
                    	
            </c:if>
					<div class="header-nav">
						<nav class="navbar navbar-default">
							<!-- Brand and toggle get grouped for better mobile display -->
							<div class="navbar-header">
								
								<h1><a class="navbar-brand" href="main.do">WinterPark<sup><i class="fa fa-snowflake-o" aria-hidden="true"></i><sup></a></h1>
							</div>
							<!-- Collect the nav links, forms, and other content for toggling -->
							<div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
								<nav class="cl-effect-15" id="cl-effect-15">
								<ul>
									<li><a href="WinterParkLiftPrice.do" data-hover="${btn_winterPark}">${btn_winterPark}</a></li>
									<li><a href="reverseRoomForm.do" data-hover="${btn_reservation}">${btn_reservation}</a></li>
									<li><a href="introSki.do" data-hover="${btn_skioom}">${btn_skioom}</a></li>
									<li><a href="ffList.do" data-hover="${btn_eat}">${btn_eat}</a></li>
									<li><a href="eventList.do" data-hover="${btn_event}">${btn_event}</a></li>
									<li><a href="qnaList.do" data-hover="${btn_qa}">${btn_qa}</a></li>
								</ul>
								</nav>
							</div>
						</nav>
					</div>
					</div>
			</div>
			<!--//Top-Bar-->
		</header>
			
		
		<!-- js -->
		<script type="text/javascript" src="${project}assets/js/jquery-2.1.4.min.js"></script>
	 	<script src="${project}member/jquery-barcode.js"></script>
		<script src="${project}assets/js/responsiveslides.min.js"></script>
		
				<script>	
						$(function () {
							$("#slider").responsiveSlides({
								auto: true,
								pager: true,
								nav: true,
								speed: 1000,
								namespace: "callbacks",
								before: function () {
									$('.events').append("<li>before event fired.</li>");
								},
								after: function () {
									$('.events').append("<li>after event fired.</li>");
								}
							});
						});
					</script>
			
		<!-- Calendar -->
					<link rel="stylesheet" href="${project}assets/css/jquery-ui.css" />
					<script src="${project}assets/js/jquery-ui.js"></script>
					  <script>
							  $(function() {
								$( "#datepicker,#datepicker1" ).datepicker();
							  });
					  </script>
				<!-- //Calendar -->
			<!-- Portfolio-Popup-Box-JavaScript -->
					<script src="${project}assets/js/jquery.chocolat.js"></script>
					<script type="text/javascript">
						$(function() {
							$('.w3portfolioaits-item a').Chocolat();
						});
					</script>
				<!-- //Portfolio-Popup-Box-JavaScript -->
				<!-- Tour-Locations-JavaScript -->
					<script src="${project}assets/js/classie.js"></script>
					<script src="${project}assets/js/helper.js"></script>
					<script src="${project}assets/js/grid3d.js"></script>
					<script>
						new grid3D( document.getElementById( 'grid3d' ) );
					</script>
				<!-- //Tour-Locations-JavaScript -->
					<script src="${project}assets/js/SmoothScroll.min.js"></script>
				<!-- smooth scrolling-bottom-to-top -->
						<script type="text/javascript">
							$(document).ready(function() {
							/*
								var defaults = {
								containerID: 'toTop', // fading element id
								containerHoverID: 'toTopHover', // fading element hover id
								scrollSpeed: 1200,
								easingType: 'linear' 
								};
							*/								
							$().UItoTop({ easingType: 'easeOutQuart' });
							});
						</script>
						<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
				<!-- //smooth scrolling-bottom-to-top -->
				<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
			});
		</script>
		<!-- start-smoth-scrolling -->
			`			
	</body>
</html>
	