<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="setting.jsp" %>

<!DOCTYPE html>
<center>
<html>
	<head>
		<meta charset="UTF-8">
		<style type="text/css">
			body{
				text-align: center;
			}
			header {
				height : 50px;
			}
			section {
				width : 1300px;			
				height : 500px;
				float : left;
			}
			header, section {
				border : 1px solid black;
				margin : 0px;
			}
		</style>	
		
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

	<body onload="passwdfocus()">
<script src="${project}member/script.js"></script>    
	
		<header>${page_delete}</header>
		<%@include file="/include/mypageaside.jsp" %>
		<section>
		<form name="delpasswdform" method="post" action="memberDeletePro.do"
			onsubmit="return delpasswdcheck()">
			<input type="hidden" id="user_barcode" value="${user_barcode}">
			<table>
				<tr>
					<th colspan="2">
						${msg_passwd}
					</th>	
				</tr>
				<tr>
					<th> ${str_passwd} </th>
					<td>
						<input class="input" type="password" name="passwd"
							maxlength="15">
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input class="inputbutton" type="submit" value="${btn_del}">
						<input class="inputbutton" type="button" value="${btn_del_cancel}" onclick="location='main.do'">	
					</th>
				</tr>
			</table>
		</form>
		</section>
	</body>
</html>
</center>