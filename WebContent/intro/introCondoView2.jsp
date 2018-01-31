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
				<br><br><br>
				<h2> 2인실 소개 </h2>
				
				<br><br>
					
				<div class="demo" style="margin-right:40px;">
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
				<h2> 4인실 소개 </h2>
				
				<br><br>
					
				<div class="demo">
			        <div class="item">            
			            <div class="clearfix">
			                <ul  class="image-gallery gallery list-unstyled cS-hidden">
			                    <li data-thumb="/SKI_Final/images/thumb/condoIntro5.jpg"> 
			                        <img src="/SKI_Final/images/condoIntro5.jpg"/>
			                    </li>
			                    <li data-thumb="/SKI_Final/images/thumb/condoIntro6.jpg"> 
			                        <img src="/SKI_Final/images/condoIntro6.jpg"/>
			                    </li>
			                    <li data-thumb="/SKI_Final/images/thumb/condoIntro7.jpg"> 
			                        <img src="/SKI_Final/images/condoIntro7.jpg"/>
			                    </li>
			                    
			                </ul>
			            </div>
			        </div>
			    </div> <!-- 4인실 demo -->
			    <br><br>
			    <h2> 8인실 소개 </h2>
				
				<br><br>
					
				<div class="demo">
			        <div class="item">            
			            <div class="clearfix">
			                <ul  class="image-gallery gallery list-unstyled cS-hidden">
			                    <li data-thumb="/SKI_Final/images/thumb/condoIntro8.jpg"> 
			                        <img src="/SKI_Final/images/condoIntro8.jpg"/>
			                    </li>
			                    <li data-thumb="/SKI_Final/images/thumb/condoIntro9.jpg"> 
			                        <img src="/SKI_Final/images/condoIntro9.jpg"/>
			                    </li>
			                    <li data-thumb="/SKI_Final/images/thumb/condoIntro10.jpg"> 
			                        <img src="/SKI_Final/images/condoIntro10.jpg"/>
			                    </li>
			                    
			                </ul>
			            </div>
			        </div>
			    </div>	<!-- 8인실 demo -->
				</div> <!-- skitotal -->
			</div><!-- row -->
		</div><!-- container -->
		
		<%@include file="/include/mainfooter.jsp" %>		
	</body>
 </html>