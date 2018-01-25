<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../member/setting.jsp" %>
<!-- 로그인 -->
<!-- 오른쪽 정렬-->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<!-- js -->
		<script type="text/javascript" src="${project}assets/js/jquery-2.1.4.min.js"></script>
	 	<script src="${project}member/jquery-barcode.js"></script>
		<script src="${project}assets/js/responsiveslides.min.js"></script>
					<script>
				$(document).ready(
					function(){
						joinform.id.focus();
						shortemail.style.display = "none";
						shortemail2.style.display = "none";
					}		
				);

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
	</head>

	<body>
		<div class="content-block" id="footer">
			<div class="container">
				<div class="row">
					<div class="col-xs-6">&copy; Copyright Flusk 2014</div>
					<div class="col-xs-6 text-right">winter_park</a></div>
				</div>
			</div>
		</div><!-- #footer -->
		
		
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
			
		
			<!-- Portfolio-Popup-Box-JavaScript -->
					<script src="${project}assets/js/jquery.chocolat.js"></script>
					<script type="text/javascript">
						$(function() {
							$('.w3portfolioaits-item a').Chocolat();
						});
					</script>
				<!-- //Portfolio-Popup-Box-JavaScript -->
				<!-- Tour-Locations-JavaScript -->
					<script src="./assets/js/classie.js"></script>
					<script src="./assets/js/helper.js"></script>
					<script src="./assets/js/grid3d.js"></script>
					<script>
						new grid3D( document.getElementById( 'grid3d' ) );
					</script>
				<!-- //Tour-Locations-JavaScript -->
					<script src="./assets/js/SmoothScroll.min.js"></script>
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
		<script type="text/javascript" src="./assets/js/move-top.js"></script>
		<script type="text/javascript" src="./assets/js/easing.js"></script>
		<script type="text/javascript" src="./assets/js/bootstrap-3.1.1.min.js"></script>

		<div class="copyright-agile">
			<p>&copy; 2017 inom ski. All rights reserved | Design by winter_park</a></p>
		</div>
		<script src="./assets/js/jquery-2.1.3.min.js"></script>
		<script src="./assets/js/jquery-migrate-1.2.1.min.js"></script>
		<script src="./assets/js/bootstrap.min.js"></script>
		<script src="./assets/js/jquery.actual.min.js"></script>
		<script src="./assets/js/jquery.scrollTo.min.js"></script>
		<script src="./assets/js/script.js"></script>

	</body>

</html>
	