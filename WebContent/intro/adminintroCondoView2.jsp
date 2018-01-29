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
    <style>
    	ul{
			list-style: none outside none;
		    padding-left: 0;
            margin: 0;
		}
        .demo .item{
            margin-bottom: 60px;
        }
		.content-slider li{
		    background-color: #ed3020;
		   /* text-align: center;*/
		    color: #FFF;
		    padding-left : 20%;
		}
		/*
		.content-slider h3 {
		    margin: 0;
		    padding: 70px 0;
		}
		*/
		.demo{
			margin-left : 10%;
		}
		
		
		.skitotal{
			margin-left : 5%; 
		}
		
		
		.skitotal h2{
			margin-left : 40%;
			/*text-align : center;*/
			margin-top : 150px;
			margin-bottom : 30px;
			padding-bottom : 10px;
			border-bottom : 1px solid gray;
			width : 250px; 
			color : #747474;
			
		}
		.clearfix{
			/*margin-left : 10%;*/
		}
		
		.image-gallery img{
			width : 800px;
			height :450px;
			margin-left : 4%;
		}
		
		.skitotal p{
			margin-bottom : 30px;
			
			text-align : center;
			margin-right : 10%;
			
		}
		
		
		
		#img1{
			width : 800px;
			heigth : 450px;
			margin-left : 3%;
		}
		
		#img2, #img3{
			width : 1000px;
			heigth : 500px;
			margin-left : 5%;
		}
		
    </style>
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
	                thumbItem:9,
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
	    <%@include file="/include/adminmainheader.jsp" %>
		<%@include file="/include/adminintroaside.jsp" %>
	</head>

	<body>
		<div class="container">
			<div class="row">
				<div class="skitotal">
				<br><br><br><br>
				<a href="adminintroCondoView2.do">2인실</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="adminintroCondoView4.do">4인실</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="adminintroCondoView8.do">8인실</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<h2> 2인실 소개 </h2>
				
				<br><br>
					
				<div class="demo">
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
				
				</div>
			</div>
			
		</div>
		
		<%@include file="/include/mainfooter.jsp" %>		
	</body>
 </html>