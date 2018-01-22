<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
   <head>
      <meta charset="utf-8">
      <title>reserveRoomForm</title>
      <link href="/SKI_Final/reverse/jquery-ui.css" rel="stylesheet">
      <link href="/SKI_Final/reverse/datepicker.css" rel="stylesheet">  
      <link href="/SKI_Final/reverse/css/re.css" rel="stylesheet">  
      
      <script src="/SKI_Final/reverse/jquery.js"></script>     
      <script src="/SKI_Final/reverse/reserveRoom.js"></script>   
	  <script src="/SKI_Final/reverse/request.js"></script>
	  <script src="/SKI_Final/reverse/jquery-ui.js"></script>	 
	 
	  <script src="./assets/js/jquery-migrate-1.2.1.min.js"></script>
	  <script src="./assets/js/bootstrap.min.js"></script>
	  <script src="./assets/js/jquery.actual.min.js"></script>
	  <script src="./assets/js/jquery.scrollTo.min.js"></script>
	  <script src="./assets/js/script.js"></script>
		   
	  <%@include file="/include/mainnav.jsp" %>
   </head>

   <body>   
 	
	   <form method="post" action="reverseRoomPro.do">
		   <input type="hidden" name="room_date" id="room_date">
		   <input type="hidden" name="room_cnt" id="room_cnt">
		   <input type="hidden" name="room_price" id="room_price">	   
		   <input type="hidden" name="room_check" id="room_check">
	   
	      <!-- Datepicker -->
      <div class="container">
        <div class="row">
	      <div class="totalbox">
	      
	         <div id="box1">
	            <div class="stepbox">
	                step 1<br>
	               	날짜 선택
	            </div><!-- stepbox -->
	            <div class="selectbox">
	            <div class="calbox">
	               <div id="calbox">   
	                  <div id="datepicker1"></div>
	                  <div id="re"></div>
	               </div>   
	               <div id="calbox">      
	                  <div id="datepicker2"></div>
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
	               step 2<br>
	               객실 선택
	            </div>
	            <div class="selectbox">
	               <div id="roomcntbox">              
	                  <div id="roomdate1">
	                  	<div class="date" id="date1"></div>
		                  <div class="__count_range">
		                    2인실 (20,000) &nbsp;&nbsp;&nbsp;
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
	                  <div id="roomdate2">
	                  	<div class="date" id="date2"></div>
		                  <div class="__count_range">
		                    2인실 (20,000) &nbsp;&nbsp;&nbsp;
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
	                  <div id="roomdate3">
	                  	<div class="date" id="date3"></div>
		                  <div class="__count_range">
		                    2인실 (20,000) &nbsp;&nbsp;&nbsp;
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
	                  <br>            		                  
		                          총 가격 : <div id="roompricebox"> </div>
	                  <br><br>
	                  <div id="btbox">
	           			 <input type="button" id="backbt1" value="이전으로">
	                     <input type="button" id="bt2" value="다음">
	                  </div> <!-- btbox -->
	               </div> <!-- roomcntbox -->
	            </div> <!-- selectbox -->
	         </div> <!-- box2 -->
	         <div id="box3">
	            <div class="stepbox">
	               step3<br>
	               세부사항입력
	            </div>
	            <div class="selectbox">
	            	<div id="textbox">
		               	*이용자명 <input type="text" id="name" name="name" placeholder="이름을 입력해주세요"> <br>
		               	*휴대폰번호 <input type="text" id="tel" name="tel" placeholder="-을 빼고 입력해주세요"> <br>
		               	차량번호 <input type="text" id="carnum" name="carnum" placeholder="차량번호를 입력해주세요"> <br>
	               	</div>
	            	<div id="btbox">
	               		<input type="button" id="backbt2" value="이전으로">	
	               		<input type="button" id="bt3" value="다음">
	            	</div> <!-- btbox -->
	            </div> <!-- selectbox -->
	         </div> <!-- box3 -->
	      </div> <!-- totalbox -->
	      </div>
	      </div>
	      <div class="checkbox">
	         <table border="1">
	            <tr>
	               <th colspan="2">예약 정보</th>
	            </tr>
	            <tbody  id="ta">
	            </tbody>
	         </table>
	         <div id="btbox">
	            <input type="button" id="resetbt" value="다시설정">
	            <input type="submit" id="paybt" value="결제">
	         </div> <!-- btbox -->
	      </div><!-- checkbox -->
      </form>
      <div id="result"></div>
      <div id="result2"></div>
      <div id="result3"></div>
      <div id="result4"></div>
      
   </body>
   
</html>