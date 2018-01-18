<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="setting.jsp" %>
 
<%@include file="/include/adminmainheader.jsp" %>
<%@include file="/include/adminmainnav.jsp" %>
<%@include file="/include/adminintroaside.jsp" %>  
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
	<h2> 콘도 미리보기 </h2>
	<input type="button" value="2인실" onclick="location='adminintroCondoView2.do'">
	<input type="button" value="4인실" onclick="location='adminintroCondoView4.do'">
	<input type="button" value="8인실" onclick="location='adminintroCondoView8.do'">
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
</body>