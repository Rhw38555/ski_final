<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="setting.jsp" %>
 	<%@include file="/include/mainheader.jsp" %>
<!DOCTYPE html>
<center>
<html>
	<head>
		<meta charset="UTF-8">
		<script type="text/javascript">
		//<!--
		$(document).ready(function() {
			if($('#user_barcode').val()!=null)
				generateBarcode($('#user_barcode').val());
		});
		
		function generateBarcode(user_barcode) {
		    
		    var value = user_barcode;
		    var btype = "code128";
		    var renderer ="css";
		    
			var quietZone = false;
		    if ($("#quietzone").is(':checked') || $("#quietzone").attr('checked')){
		      quietZone = true;
		    }
			
		    var settings = {
		      output:renderer,
		      bgColor: "#FFFFFF",
		      color: "#000000",
		      barWidth: "1",
		      barHeight: "50",
		      moduleSize: "5",
		      posX: "10",
		      posY: "20",
		      addQuietZone: "1"
		    };
		    if ($("#rectangular").is(':checked') || $("#rectangular").attr('checked')){
		        value = {code:value, rect: true};
		      }
		      if (renderer == 'canvas'){
		        clearCanvas();
		        $("#barcodeTarget").hide();
		        $("#canvasTarget").show().barcode(value, btype, settings);
		      } else {
		        $("#canvasTarget").hide();
		        $("#barcodeTarget").html("").show().barcode(value, btype, settings);
		      }
		  }	
		//-->
		</script>	
	</head>

	<body>
		<script src="${project}member/script.js"></script>    
		<%@include file="/include/mypageaside.jsp" %>	
		<div class="container text-center">
			<header class="loginheader">
				<h1> ${page_delete} </h1>
				<p> ${msg_passwd} </p>
			</header>
			<div class="col-md-4 col-md-offset-login">
				<form name="delpasswdform" action="memberDeletePro.do" onsubmit="return delpasswdcheck()">
					<div class="main-login">
					    <div class="form-group">
					    	<input class="form-control" type="password" name="passwd" maxlength="15" placeholder="비밀번호" required>
						</div>
						<br><br>
						<div>
							<input class="btn btn-primary" type="submit" value="${btn_del}">
						<input class="btn btn-primary" type="button" value="${btn_del_cancel}" onclick="location='main.do'">	
						</div>
					</div>
				</form>
			</div>
		</div>
		<%@include file="/include/mainfooter.jsp" %>
		<script type="text/javascript">
			// 로그인폼
            $(document).ready(
            	function() {
            		delpasswdform.passwd.focus();
            	}
         	);  
		</script>
	</body>
</html>
</center>