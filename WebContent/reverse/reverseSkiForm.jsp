<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       
<html>
	<head>
	    <meta charset="utf-8"><link href="/SKI_Final/reverse/jquery-ui.css" rel="stylesheet">
	    <link href="/SKI_Final/reverse/datepicker.css" rel="stylesheet">  
	    <link href="/SKI_Final/reverse/re.css" rel="stylesheet">  
	     <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	    
	    <script src="/SKI_Final/reverse/jquery.js"></script>     
	    <script src="/SKI_Final/reverse/reserveSki.js"></script>   
		<script src="/SKI_Final/reverse/request.js"></script>
		<script src="/SKI_Final/reverse/jquery-ui.js"></script>
		<script src="/SKI_Final/reverse/jquery-ui.multidatespicker.js"></script>
		
		<script type="text/javascript">
		 var stmnLEFT = 10; // 오른쪽 여백 
		 var stmnGAP1 = 0; // 위쪽 여백 
		 var stmnGAP2 = 150; // 스크롤시 브라우저 위쪽과 떨어지는 거리 
		 var stmnBASE = 150; // 스크롤 시작위치 
		 var stmnActivateSpeed = 35; //스크롤을 인식하는 딜레이 (숫자가 클수록 느리게 인식)
		 var stmnScrollSpeed = 20; //스크롤 속도 (클수록 느림)
		 var stmnTimer; 
		 
		 function RefreshStaticMenu() { 
		  var stmnStartPoint, stmnEndPoint; 
		  stmnStartPoint = parseInt(document.getElementById('STATICMENU').style.top, 10); 
		  stmnEndPoint = Math.max(document.documentElement.scrollTop, document.body.scrollTop) + stmnGAP2; 
		  if (stmnEndPoint < stmnGAP1) stmnEndPoint = stmnGAP1; 
		  if (stmnStartPoint != stmnEndPoint) { 
		   stmnScrollAmount = Math.ceil( Math.abs( stmnEndPoint - stmnStartPoint ) / 15 ); 
		   document.getElementById('STATICMENU').style.top = parseInt(document.getElementById('STATICMENU').style.top, 10) + ( ( stmnEndPoint<stmnStartPoint ) ? -stmnScrollAmount : stmnScrollAmount ) + 'px'; 
		   stmnRefreshTimer = stmnScrollSpeed; 
		   }
		  stmnTimer = setTimeout("RefreshStaticMenu();", stmnActivateSpeed); 
		  } 
		 function InitializeStaticMenu() {
		  document.getElementById('STATICMENU').style.right = stmnLEFT + 'px';  //처음에 오른쪽에 위치. left로 바꿔도.
		  document.getElementById('STATICMENU').style.top = document.body.scrollTop + stmnBASE + 'px'; 
		  RefreshStaticMenu();
		  }
		window.addEventListener("beforeunload", function (e) {
			var confirmationMessage = "\o/";	
			(e || window.event).returnValue = confirmationMessage; //Gecko + IE			
				return confirmationMessage; //Webkit, Safari, Chrome
				modcount();
		});
		</script>
	</head>	
	<body onload="InitializeStaticMenu()" class="rebody">
		<form method="post" action="reverseSkiPro.do">
			<input type="hidden" id="ski_date" name="ski_date">
			<input type="hidden" id="ski_count" name="ski_count">
			<input type="hidden" id="ski_price" name="ski_price">
		
		     <div class="container">
				<div class="row">
					<div class="pageselbox">
						<a href="reverseRoomForm.do">
							<span class="glyphicon glyphicon-home" aria-hidden="true"> 콘도예약</span>
						</a> 
						<br>
						<a href="reverseSkiForm.do">
							<span class="glyphicon glyphicon-asterisk" aria-hidden="true"> 스키예약</span>
						</a>
					</div>	
				</div>	   
			</div>	
		
	 <div class="container">
        <div class="row">
			<div class="totalbox">
				<div id="box1">
					<div class="stepbox">
					  <br>
	                <h3>step 1</h3>
	               	<h4>날짜 선택</h4>
					</div>
					<div class="selectbox">
					 &nbsp;&nbsp;&nbsp;&nbsp; * 최대 3일까지 선택 가능합니다. <br>
					<div class="calbox" id="skicalbox">
						<div id="multipick"></div>
						<div id="a" class="a"></div>
					</div>	
						<div id="btbox">
							<input type="button" id="bt1" value="다음">
						</div> <!-- btbox -->
					</div> <!-- selectbox -->
				</div> <!-- box1 -->
				<div id="box2">
					<div class="stepbox">
		                <br>
		                <h3>step 2</h3>
		               	<h4>스키권 선택</h4>
					</div>
					<div class="selectbox">
						<div id="skibox"> 
							<div id="skicntbox">
							</div> <br>            		                  
								<div class="skipricemention">총 가격 : &nbsp; </div> 
								<div id="skipricebox"> </div> <br><br>
							<div id="btbox">
								 &nbsp;
			           			 <input type="button" id="backbt1" value="이전으로">
			           			 &nbsp;
			                     <input type="button" id="bt2" value="다음">
			                     &nbsp;
							</div> <!-- btbox -->
						</div> <!-- skibox -->
					</div> <!-- selectbox -->
				</div><!-- box2 -->
				<div id="box3">
					<div class="stepbox">
						<br>
		                <h3>step 3</h3>
		               	<h4>세부사항 입력</h4>
					</div>
					<div class="selectbox">
						<div id="textbox">
			               	<div class="textbox">
			               		<div class="textmention">*이용자명</div> 
			               		<input type="text" id="name" name="name" placeholder="이름을 입력해주세요">
			               	</div> 
			               	<div class="textbox">
			               		<div class="textmention">*휴대폰번호</div>  
			               			<input type="text" id="tel" name="tel" placeholder="-을 빼고 입력해주세요">
			               	</div>
			               	<div class="textbox">
			               		<div class="textmention">차량번호</div>  
			               			<input type="text" id="carnum" name="carnum" placeholder="차량번호를 입력해주세요">
			               	</div>
						</div> <!-- textbox -->
						<div id="btbox">
							<input type="button" id="backbt2" value="이전으로">	
							<input type="button" id="bt3" value="다음">
						</div> <!-- btbox -->
					</div><!-- selectbox -->
				</div><!-- box3 -->
			</div><!-- totalbox -->
		</div>
	</div>
		 <div id="STATICMENU">
			<div class="checkbox">
				<div class="checktitle">
		      		예약 정보
		      	</div>
				<table class="type04">
					<tbody  id="ta">
					</tbody>
				</table>
				<div id="btbox">
					<input type="button" id="resetbt" value="다시설정">
					<input type="submit" id="paybt" value="결제">
				</div> <!-- btbox -->
			</div> <!-- checkbox -->
		</div>
		</form> <!-- form -->
		<div id="result"></div>
		<div id="result2"></div>
		<div id="result3"></div>
		<div id="result4"></div>
		
	</body>
</html>  
    