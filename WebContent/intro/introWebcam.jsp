<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="setting.jsp" %>
<html>
	<script src="${project}member/jquery-3.2.1.js"></script>
	<%@include file="/include/mainheader.jsp" %>
	<%@include file="/include/introaside.jsp" %> 
	<head>
		<meta charset="UTF-8">
		<script src="${project}member/script.js"></script>		
	</head>
	
	<body>
		<div class="container">
			<div class="row">
				<div class="skitotal">
					<h2> 실시간 코스 </h2>
					<div class="webbox">
						<a class="web_a" href="javascript:changeCos('a')">A코스</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a class="web_a" href="javascript:changeCos('b')">B코스</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a class="web_a" href="javascript:changeCos('c')">C코스</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
					<br><br>
					<object id="swfId" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="300" height="120">
					<param name="allowFullScreen" value="true" /> 
					<embed id="cos" style="width: 600px; height: 380px;" 
					title="동영상 프레임" type="application/x-shockwave-flash" 
					src="/SKI_Final/intro/show1.swf" allowhtmlpopupwindow="false" enablehtmlaccess="false" 
					allownetworking="internal" allowscriptaccess="never" invokeurls="false" autostart="false" allowFullScreen="true">
					</embed>
					</object>
					<img src="/SKI_Final/images/ski_cos.png"/>
					<br><br><br><br>
								
				</div> <!-- skitotal -->
			</div> <!-- row -->
		</div><!-- container -->
		
		<%@include file="/include/mainfooter.jsp" %>
	</body>
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
</html>