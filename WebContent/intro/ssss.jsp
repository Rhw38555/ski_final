<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
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
            $('#image-gallery').lightSlider({
                gallery:true,
                item:1,
                thumbItem:9,
                slideMargin: 0,
                speed:500,
                auto:true,
                loop:true,
                onSliderLoad: function() {
                    $('#image-gallery').removeClass('cS-hidden');
                }  
            });
		});
    </script>
</head>
<body>
	<div class="demo">
        <div class="item">            
            <div class="clearfix" style="max-width:474px;">
                <ul id="image-gallery" class="gallery list-unstyled cS-hidden">
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
        <div class="item">
            <ul id="content-slider" class="content-slider">
                <li>
                    <img src="/SKI_Final/images/리프트1.jpg"/>
                </li>
                <li>
                    <h3>2</h3>
                </li>
                <li>
                    <h3>3</h3>
                </li>
                <li>
                    <h3>4</h3>
                </li>
                <li>
                    <h3>5</h3>
                </li>
                <li>
                    <h3>6</h3>
                </li>
            </ul>
        </div>

    </div>	
</body>
