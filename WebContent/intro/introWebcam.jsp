<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="setting.jsp" %>
 
<script src="${project}member/jquery-3.2.1.js"></script>
<%@include file="/include/mainheader.jsp" %>
<%@include file="/include/introaside.jsp" %> 
<head>
		<meta charset="UTF-8">
		<style>
    		h2{
			margin-left : 40%;
			/*text-align : center;*/
			margin-top : 150px;
			margin-bottom : 30px;
			padding-bottom : 10px;
			border-bottom : 1px solid gray;
			width : 250px; 
			color : #747474;
			
		}
		</style>
		<script src="${project}member/script.js"></script>		
	</head>
<center>
<h2> 실시간 코스 </h2>
<a href="javascript:changeCos('a')">A코스</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="javascript:changeCos('b')">B코스</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="javascript:changeCos('c')">C코스</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br><br>
<object id="swfId" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="300" height="120">
<param name="allowFullScreen" value="true" /> 
<embed id="cos" style="width: 600px; height: 380px;" 
title="동영상 프레임" type="application/x-shockwave-flash" 
src="/SKI_Final/intro/show.swf" allowhtmlpopupwindow="false" enablehtmlaccess="false" 
allownetworking="internal" allowscriptaccess="never" invokeurls="false" autostart="false" allowFullScreen="true">
</embed>
</object>
<img src="/SKI_Final/images/ski_cos.png"/>
<br><br>
<div class="copyright-agile">
			<p>&copy; 2017 inom ski. All rights reserved | Design by winter_park</p>
</div>
<script type="text/javascript">
   
   function changeCos(cosName){
	   if(cosName=="a"){
		   $('#cos').attr('src',"/SKI_Final/intro/show1.swf");
	   }else if(cosName=="b"){
		   $('#cos').attr('src',"/SKI_Final/intro/show2.swf");
	   }else if(cosName=="c"){
		   $('#cos').attr('src',"/SKI_Final/intro/show3.swf");
	   }
   }
   </script>