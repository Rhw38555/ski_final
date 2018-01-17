<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="/JQueryEx/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="/JQueryEx/jquery-barcode.js"></script>
<h2>스타트</h2>

<html>
  <head>
    <style>
    
    </style>
    
    
    <script type="text/javascript">
    
      function generateBarcode() {
        //var value = $("#barcodeValue").val();	//바코드 밑에 달리는 내용
        //var btype = $("input[name=btype]:checked").val();// 바코드 타입만드는부분
        //var renderer = $("input[name=renderer]:checked").val();// css로 결정
        var value = "money_100000";
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
         
    </script>
  </head>
  
  <body onload="generateBarcode()">
  
    
	    		<div id="barcodeTarget" class="barcodeTarget"></div>
	    	
  
  </body>
</html>