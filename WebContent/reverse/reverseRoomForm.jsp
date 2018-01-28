<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
   <head>
      <meta charset="utf-8">
      <title>reserveRoomForm</title>
      <link href="/SKI_Final/reverse/jquery-ui.css" rel="stylesheet">
      <link href="/SKI_Final/reverse/datepicker.css" rel="stylesheet">  
      <link href="/SKI_Final/reverse/re.css" rel="stylesheet">  
      <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
            
      <script src="/SKI_Final/reverse/jquery.js"></script>     
      <script src="/SKI_Final/reverse/reserveRoom.js"></script>   
	  <script src="/SKI_Final/reverse/request.js"></script>
	  <script src="/SKI_Final/reverse/jquery-ui.js"></script>	 
	  <script src="/SKI_Final/reverse/refoot.js"></script>	
		   
	  <%-- <%@include file="/include/mainheader2.jsp"%> --%>
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
		 
		</script>	  
   </head>

   <body onload="InitializeStaticMenu()" onbeforeunload="abc();" class="rebody">   
 	 <!-- <div class="image-container set-full-height" style="background-image: url('http://demos.creative-tim.com/material-bootstrap-wizard/assets/img/wizard-book.jpg')"> -->
 	<!--  <div class="image-container set-full-height" style="background-image: url('./reverse/img2.jpg')"> -->
	   <form name="reverseform" method="post" action="reverseRoomPro.do">
		   <input type="hidden" name="room_date" id="room_date">
		   <input type="hidden" name="room_cnt" id="room_cnt">
		   <input type="hidden" name="room_price" id="room_price">	   
		   <input type="hidden" name="room_check" id="room_check">

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
	   
	      <!-- Datepicker -->
      <div class="container">
        <div class="row">
	      <div class="totalbox">

	         <div id="box1">
	            <div class="stepbox">
	            <br>
	                <h3>step 1</h3>
	               	<h4>날짜 선택</h4>
	            </div><!-- stepbox -->
	            <div class="selectbox">
	           &nbsp;&nbsp;&nbsp;&nbsp; * 체크인/체크아웃을 선택해주세요.
	            <div class="calbox">
	           		 
	               <div id="calbox">   
	               		체크인<br><br>
	                  <div id="datepicker1"></div>
	                  <br>
	                  <div id="re"></div>
	               </div>   
	               <div id="calbox"> 
	               		체크아웃     <br><br>
	                  <div id="datepicker2"></div>
	                  <br>
	                  <div id="re2"></div>
	               </div>
	            </div>
	               <div id="btbox">
	                  <input type="button" id="bt1" value="다음">
	               </div>
	            </div><!-- selectbox -->
	         </div><!-- box1 -->
	     
	         <div id="box2">
	            <div class="stepbox">
	              <br>
	                <h3>step 2</h3>
	               	<h4>객실 선택</h4>
	            </div>
	            <div class="selectbox">
	               <div id="roomcntbox">              
	                  <div id="roomdate1" class="roomdate">
	                  	<div class="date" id="date1"></div>
		                  <div class="__count_range">
		                    2인실 (20,000) &nbsp;&nbsp;
		                    <input class="ran" id="mran2_0" type="button" value="-" count_range="m" >
		                    <input class="count" id="cnt2_0" value="0" readonly name="">
		                    <input class="ran" id="pran2_0" type="button" value="+" count_range="p" >
		                  </div>
		                  <div class="__count_range">
		                    4인실 (40,000)&nbsp;&nbsp;&nbsp;
		                    <input class="ran" id="mran4_0" value="-" count_range="m" type="button">
		                    <input class="count" id="cnt4_0" value="0" readonly name="">
		                    <input class="ran" id="pran4_0" value="+" count_range="p" type="button">
		                  </div>
		                  <div class="__count_range">
		                    8인실 (80,000)&nbsp;&nbsp;&nbsp;
		                    <input class="ran" id="mran8_0" value="-" count_range="m" type="button">
		                    <input class="count" id="cnt8_0" value="0" readonly name="">
		                    <input class="ran" id="pran8_0" value="+" count_range="p" type="button">
		                  </div>
	                  </div> <!-- roomdate1 -->
	                  <div id="roomdate2" class="roomdate">
	                  	<div class="date" id="date2"></div>
		                  <div class="__count_range">
		                    2인실 (20,000) &nbsp;&nbsp;
		                    <input class="ran" id="mran2_1" type="button" value="-" count_range="m" >
		                    <input class="count" id="cnt2_1" value="0" readonly name="">
		                    <input class="ran" id="pran2_1" type="button" value="+" count_range="p" >
		                  </div>
		                  <div class="__count_range">
		                    4인실 (40,000)&nbsp;&nbsp;&nbsp;
		                    <input class="ran" id="mran4_1" value="-" count_range="m" type="button">
		                    <input class="count" id="cnt4_1" value="0" readonly name="">
		                    <input class="ran" id="pran4_1" value="+" count_range="p" type="button">
		                  </div>
		                  <div class="__count_range">
		                    8인실 (80,000)&nbsp;&nbsp;&nbsp;
		                    <input class="ran" id="mran8_1" value="-" count_range="m" type="button">
		                    <input class="count" id="cnt8_1" value="0" readonly name="">
		                    <input class="ran" id="pran8_1" value="+" count_range="p" type="button">
		                  </div>
	                  </div><!-- roomdate2 -->
	                  <div id="roomdate3" class="roomdate">
	                  	<div class="date" id="date3"></div>
		                  <div class="__count_range">
		                    2인실 (20,000) &nbsp;&nbsp;
		                    <input class="ran" id="mran2_2" type="button" value="-" count_range="m" >
		                    <input class="count" id="cnt2_2" value="0" readonly name="">
		                    <input class="ran" id="pran2_2" type="button" value="+" count_range="p" >
		                  </div>
		                  <div class="__count_range">
		                    4인실 (40,000)&nbsp;&nbsp;&nbsp;
		                    <input class="ran" id="mran4_2" value="-" count_range="m" type="button">
		                    <input class="count" id="cnt4_2" value="0" readonly name="">
		                    <input class="ran" id="pran4_2" value="+" count_range="p" type="button">
		                  </div>
		                  <div class="__count_range">
		                    8인실 (80,000)&nbsp;&nbsp;&nbsp;
		                    <input class="ran" id="mran8_2" value="-" count_range="m" type="button">
		                    <input class="count" id="cnt8_2" value="0" readonly name="">
		                    <input class="ran" id="pran8_2" value="+" count_range="p" type="button">
		                  </div>
	                  </div><!-- roomdate3 -->        		                  
		              <div class="roomprice">
		              	<div class="roompricemention">총 가격 : &nbsp; </div> 	
			              <div id="roompricebox"> </div>
		                  <div id="btbox">
		                  	 &nbsp;
		           			 <input type="button" id="backbt1" value="이전으로">
		           			 &nbsp;
		                     <input type="button" id="bt2" value="다음">
		                     &nbsp;
		                  </div> <!-- btbox -->	              	
		              </div>
		              
	               </div> <!-- roomcntbox -->
	            </div> <!-- selectbox -->
	         </div> <!-- box2 -->
	         
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
		               			<input type="text" id="carnum" name="carnum" placeholder="차량번호(숫자)를 입력해주세요">
		               	</div>
	               	</div>
	            	<div id="btbox">
	               		<input type="button" id="backbt2" value="이전으로">
	               		&nbsp;	
	               		<input type="button" id="bt3" value="다음" onclick="reversecheck()">
	               		&nbsp;
	            	</div> <!-- btbox -->
	            </div> <!-- selectbox -->
	         </div> <!-- box3 -->
	      </div> <!-- totalbox -->
	      </div>

	      <div id="STATICMENU">
		      <div class="checkbox">
		      	<div class="checktitle">
		      		예약 정보
		      	</div>
		      	<br>
		         <table class="type04">
		            <tbody  id="ta">
		            </tbody>
		         </table>
		         <div id="btbox">
		            <input type="button" id="resetbt" value="다시설정">
		            <input type="submit" id="paybt" value="결제">
		         </div> <!-- btbox -->
		      </div><!-- checkbox -->
	      </div>
	  </div><!-- container -->
	  <div id="result"></div>
      <div id="result2"></div>
      <div id="result3"></div>
      <div id="result4"></div>
      </form>


   </body>
   
</html>