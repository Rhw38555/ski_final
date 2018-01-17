<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       
<html>
	<head>
	    <meta charset="utf-8"><link href="/SKI_Final/reverse/jquery-ui.css" rel="stylesheet">
	    <link href="/SKI_Final/reverse/datepicker.css" rel="stylesheet">  
	    <script src="/SKI_Final/reverse/jquery.js"></script>     
	    <script src="/SKI_Final/reverse/reserveSki.js"></script>   
		<script src="/SKI_Final/reverse/request.js"></script>
		<script src="/SKI_Final/reverse/jquery-ui.js"></script>
		<script src="/SKI_Final/reverse/jquery-ui.multidatespicker.js"></script>
		<script type="text/javascript">
			
	   </script>
	</head>
	<body>
	<form method="post" action="reverseSkiPro.do">
		<input type="hidden" id="ski_date" name="ski_date">
		<input type="hidden" id="ski_count" name="ski_count">
		<input type="hidden" id="ski_price" name="ski_price">
		
		<div class="totalbox">
			<div id="box1">
				<div class="stepbox">
			        step 1<br>
			       	날짜 선택
			    </div>
		        <div class="selectbox">
					<div id="multipick"></div>
					<div id="a"></div>
					<div id="btbox">
		                  <input type="button" id="bt1" value="다음">
		            </div>
				</div>
			</div>
			<div id="box2">
				<div class="stepbox">
	                 step 2<br>
	             	  스키권 선택
	            </div>
	            <div class="selectbox">
	               <div id="skibox"> 
	               	  <div id="skicntbox"></div>
	                  <br>            		                  
		                          총 가격 : <div id="skipricebox"> </div>
	                  <br><br>
	                  <div id="btbox">
	           			 <input type="button" id="backbt1" value="이전으로">
	                     <input type="button" id="bt2" value="다음">
	                  </div> <!-- btbox -->
	               </div> <!-- skibox -->
	            </div> <!-- selectbox -->
			</div>
			<div id="box3">
				<div class="stepbox">
               		step3<br>
               		세부사항입력
	            </div>
	            <div class="selectbox">
	            	<div id="textbox">
		               	*이용자명 <input type="text" name="name" id="name" placeholder="이름을 입력해주세요"> <br>
		               	*휴대폰번호 <input type="text" name="tel" id="tel" placeholder="-을 빼고 입력해주세요"> <br>
		               	차량번호 <input type="text" name="carnum" id="carnum" placeholder="차량번호를 입력해주세요"> <br>
	               	</div>
	            	<div id="btbox">
	               		<input type="button" id="backbt2" value="이전으로">	
	               		<input type="button" id="bt3" value="다음">
	            	</div> <!-- btbox -->
	            </div>
			</div>
		</div><!-- totalbox -->
			
		<div class="checkbox">
         <table border="1">
            <tr>
               <th colspan="2">예약 정보</th>
            </tr>
            <tbody  id="ta">
            </tbody>
         </table>
         <div id="btbox">
            <input type="button" id="resetbt" value="다시설정" onclick="reset()">
            <input type="submit" id="paybt" value="결제">
         </div> <!-- btbox -->
      </div> <!-- checkbox -->
	 </form>
	 <div id="result"></div>
	 <div id="result2"></div>
	 <div id="result3"></div>
	 <div id="result4"></div>
	</body>
</html>  
    