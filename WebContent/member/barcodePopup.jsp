<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<script src="${project}member/jquery-3.2.1.js"></script>
	<script src="${project}member/jquery-barcode.js"></script>
	
	<body>
		<input type="hidden" id="user_barcode" value="${user_barcode}">
		<div id="barcodeTarget" class="barcodeTarget"></div>
	</body>
	<script type="text/javascript">
	//<!--
	 $(document).ready(
		function(){
			if($('#user_barcode').val()){			
				generateBarcode($('#user_barcode').val());
				zoomIn();
				
			}
		}
	);
	
	
	$(document).on(
		'click','#barcodeTarget',
		function(event){
			self.close();			
		}
	);
	
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
	 var scale = 1;
	 function zoomIn(){
		 scale *=8.5;
		 zoom();
	 }
	 function zoom(){
		 document.body.style.zoom= scale;
	 }
	//-->
	</script>
	
</html>