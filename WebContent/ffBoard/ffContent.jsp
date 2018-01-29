<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<%@include file="/include/mainheader.jsp"%>
<html>
<head>
	<script src="${project}jquery-3.2.1.js"></script>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <link rel="stylesheet"  href="/SKI_Final/intro/css/lightslider.css"/>
    <style>
    	.span3{
    		width:100%;
    		align:center;
    	}
    	.well{
    		width:100%;
    		height:auto;
    		align:center;
    	}
    	.text-right{
    		align:right;
    	}
    	.btn .btn-large{
    		align:center;
    	}
    	.icon-ok{
    		align:center;
    	}
    	ul{
			list-style: none outside none;
		    padding-left: 0;
            margin: 0;
		}
        .demo .item{
            margin-bottom: 60px;
            max-width: 100%;
            align: center;
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
			max-width: 100%;
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
    	 
   		function loadmap(location) {
   			var img = new Image();
   			img.src = location;
   			var OpenWindow=window.open('','_blank', 'width='+img.width+', height='+img.height+', menubars=no, scrollbars=auto');
   			OpenWindow.document.write("<style>body{margin:0px;padding:0px;}</style><img src='"+location+"' style='width:100%;height:auto;' onclick='window.close()'>");
   		}
    </script>
</head>
<body>
	<img src="${project}ff/${ffDto.location}" hidden="true">
	 <div class="span3">
       	<div class="well">
       		<div class="text-right">${ffDto.division} - ${ffDto.category}</div>
       		<h2 class="text-info" align="center">${ffDto.name}</h2>
       		<div class="text-right">
	       		<p><span class="label label-info"><a href="#view" onclick="loadmap('${project}ff/${ffDto.location}')">시설 위치 약도</a></span></p>
	       		<p>${ffDto.introduce}</p>
       		</div>
       		<hr>
       		<div class="demo">
	        <div class="item" align="center">            
		            <div class="clearfix">
		                <ul  class="image-gallery gallery list-unstyled cS-hidden">
		                <c:forEach var="tempimage" items="${img}">
		                    <li data-thumb="${project}ff/${tempimage}"> 
		                        <img src="${project}ff/${tempimage}" style="max-width:100%"/>
		                    </li>
		                </c:forEach>
		                </ul>
		            </div>
		        </div>
		    </div>
       		<hr>
            <div class="text-center"><p><a class="btn btn-large" href="ffList.do?pageNum=${pageNum}&division=${division}"><i class="icon-ok"></i> 뒤로가기 </a></p></div>
       	</div>
   </div>
</body>
<%@include file="/include/mainfooter.jsp" %>
</html>