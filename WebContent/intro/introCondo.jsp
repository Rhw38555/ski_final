<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="setting.jsp" %>
 

<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <link rel="stylesheet"  href="/SKI_Final/intro/css/lightslider.css"/>
    
	    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	    
	    <script type="text/javascript" src="${project}assets/js/jquery-2.1.4.min.js"></script>
	    <script src="${project}member/jquery-barcode.js"></script>
	    <script src="/SKI_Final/intro/js/lightslider.js"></script> 
	    <script>   
	    	 $(document).ready(function() {
				$("#content-slider").lightSlider({
	                loop:true,
	              	auto:true,
	                keyPress:true
	            });
	            $('.image-gallery').lightSlider({
	                gallery:true,
	                item:1,
	                thumbItem:3,
	                slideMargin: 0,
	                speed:500,
	                auto:true,
	                loop:true,
	                onSliderLoad: function() {
	                    $('.image-gallery').removeClass('cS-hidden');
	                }  
	            });
			});
	    </script>
	    <%@include file="/include/mainheader.jsp" %>
		<%@include file="/include/introaside.jsp" %>
	</head>

	<body>
		<div class="container">
			<div class="row">
				<div class="skitotal">
				<br><br><br><br>
				<h2> 콘도 소개 </h2>
					<p style="padding-right:3%;">윈터파크 콘도는 천혜의 자연환경, 어디서나 볼 수 있는 전망 좋은 객실과 
					<br>
					깨끗하고 편리한 부대시설, 교육장 및 야외활동을 위한 다양한 시설들이 완벽하게 준비가 되어 있습니다.
					</p>
					<br><br><br><br><br>	<br>		
				<img src="/SKI_Final/images/condoIntro.jpg" id="img1"/>
				<br><br>				
				<h2> 콘도 </h2>
				<p style="padding-left:8%;"> 총규모 55실 지하1층, 지상4층 (25평형 55실, 30평형 55실, 35평형 55실 ) </p> 
				<br><br>
				<div class="demo" style="margin-right:20px;">
				
			        <div class="item">            
			            <div class="clearfix">
			                <ul  class="image-gallery gallery list-unstyled cS-hidden">
			                    <li data-thumb="/SKI_Final/images/thumb/condoIntro2.jpg"> 
			                        <img src="/SKI_Final/images/condoIntro2.jpg"/>
			                    </li>
			                    <li data-thumb="/SKI_Final/images/thumb/condoIntro3.jpg"> 
			                        <img src="/SKI_Final/images/condoIntro3.jpg"/>
			                    </li>
			                    <li data-thumb="/SKI_Final/images/thumb/condoIntro4.jpg"> 
			                        <img src="/SKI_Final/images/condoIntro4.jpg"/>
			                    </li>
			                    
			                </ul>
			            </div>
			        </div>
			    </div>	
				
				<br>
				<h2> 콘도 가격 정보 </h2>	
				<br><br>			
				<img src="/SKI_Final/images/condoPrice.png" id="img2" style="padding-right:2%;"/>
				
				</div>
			</div>
			
		</div>
		<br><br><br><br><br><br>			
	</body>
	<%@include file="/include/mainfooter.jsp" %>
 </html>