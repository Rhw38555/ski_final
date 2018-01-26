<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="setting.jsp" %>
 
<%@include file="/include/mainheader.jsp" %>
<%@include file="/include/introaside.jsp" %>
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
		    text-align: center;
		    color: #FFF;
		}
		.content-slider h3 {
		    margin: 0;
		    padding: 70px 0;
		}
		.demo{
			width: 800px;
		}
    </style>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
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
</head>
<body>
	<h2> 스키장 제원 </h2>
	
	1.5km 최장 중급자 코스 총연장 7,300m, 10면(주 슬로프 7면 보조슬로프 3면)의 슬로프는 선키드(에스컬레이터) 및 다양한 경사(7~30도)가
	마련되어 있어 초보자 부터 상급자 모두가 최고의 만족을 느끼실 수 있습니다.
	<br><br>
	<img src="/SKI_Final/images/안내.PNG" width="70%" height="70%"/>
	
	<br><br><br><br>
	<h2> 슬로프 </h2>
	
	초보자 부터 상급자 모두에게 최고의 만족을 드립니다. 
	<br><br>
	<div class="demo">
        <div class="item">            
            <div class="clearfix" style="max-width:474px;">
                <ul  class="image-gallery gallery list-unstyled cS-hidden">
                    <li data-thumb="/SKI_Final/images/thumb/코스1.jpg"> 
                        <img src="/SKI_Final/images/코스1.jpg" height="338px" width="474px"/>
                         </li>
                    <li data-thumb="/SKI_Final/images/thumb/코스2.jpg"> 
                        <img src="/SKI_Final/images/코스2.jpg" height="338px" width="474px"/>
                         </li>
                    <li data-thumb="/SKI_Final/images/thumb/코스3.jpg"> 
                        <img src="/SKI_Final/images/코스3.jpg" height="338px" width="474px"/>
                         </li>
                    <li data-thumb="/SKI_Final/images/thumb/코스4.jpg"> 
                        <img src="/SKI_Final/images/코스4.jpg" height="338px" width="474px"/>
                         </li>
                    <li data-thumb="/SKI_Final/images/thumb/코스5.jpg"> 
                        <img src="/SKI_Final/images/코스5.jpg" height="338px" width="474px"/>
                         </li>
                    <li data-thumb="/SKI_Final/images/thumb/코스6.jpg"> 
                        <img src="/SKI_Final/images/코스6.jpg" height="338px" width="474px"/>
                         </li>
                </ul>
            </div>
        </div>
    </div>	
	<br>
	5km 최장 중급자 코스 총연장 7,300m, 10면(주 슬로프 7면 보조슬로프 3면)의 슬로프는 선키드(에스컬레이터) 및 다양한 경사 (7~30도) 가 마련되어 있어 초보자 부터 상급자 모두가 최고의 만족을 느끼실 수 있습니다.
	
	<br><br><br><br>
	<h2> 코스정보 </h2>
	<br><br>
	<img src="/SKI_Final/images/코스정보.PNG" width="70%" height="70%"/>
	
	<br><br><br><br>
	<h2> 리프트 </h2>
	여유롭고 즐겁게 스키 및 보드를 즐기실 수 있습니다.
	<br><br>
	<div class="demo">
        <div class="item">            
            <div class="clearfix" style="max-width:474px;">
                <ul class="image-gallery gallery list-unstyled cS-hidden">
                    <li data-thumb="/SKI_Final/images/thumb/리프트1.jpg"> 
                        <img src="/SKI_Final/images/리프트1.jpg" height="338px" width="474px"/>
                         </li>
                    <li data-thumb="/SKI_Final/images/thumb/리프트2.jpg"> 
                        <img src="/SKI_Final/images/리프트2.jpg" height="338px" width="474px"/>
                         </li>
                    <li data-thumb="/SKI_Final/images/thumb/리프트3.jpg"> 
                        <img src="/SKI_Final/images/리프트3.jpg" height="338px" width="474px"/>
                         </li>
                    <li data-thumb="/SKI_Final/images/thumb/리프트4.jpg"> 
                        <img src="/SKI_Final/images/리프트4.jpg" height="338px" width="474px"/>
                         </li>
                    <li data-thumb="/SKI_Final/images/thumb/리프트5.jpg"> 
                        <img src="/SKI_Final/images/리프트5.jpg" height="338px" width="474px"/>
                         </li>
                    <li data-thumb="/SKI_Final/images/thumb/리프트6.jpg"> 
                        <img src="/SKI_Final/images/리프트6.jpg" height="338px" width="474px"/>
                         </li>
                    <li data-thumb="/SKI_Final/images/thumb/리프트7.jpg"> 
                        <img src="/SKI_Final/images/리프트7.jpg" height="338px" width="474px"/>
                         </li>
                </ul>
            </div>
        </div>
    </div>	
	<br>
	4인승 및 6인승 등 총 5기의 고속 리프트 가동으로 리프트 대기시간의 지루함 없이 여유롭고 즐겁게 스키 및 보드를 즐기실 수 있습니다.
	<br><br><br><br>
	<h2> 리프트정보 </h2>
	<br><br>
	<img src="/SKI_Final/images/리프트정보.PNG" width="70%" height="70%"/>
</body>