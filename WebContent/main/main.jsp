<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../member/setting.jsp" %>

<!DOCTYPE html>
<html>
    <script src="${project}member/jquery-3.2.1.js"></script>
    <script src="${project}member/jquery-barcode.js"></script>
   <head>
      <meta charset="UTF-8">
      <style type="text/css">
			#msg{
				height : 300px;
				width : 600px;
				overflow: auto;
				text-align : left;
			}
			.weatherbox{
				margin-left : 20%;
				float : left;
				padding : 20px;
			}
			.weather {
				font-size : 20px;
				border : 1px solid black;
				height : 300px;
				width : 250px;
				font-family: 'Noto Sans KR', normal;
			}
			.weather > ul{
				list-style:none;
			}	
			.weather img{
				height : 150px;
				width : 150px;
				margin-left : 20%;	
			}
	       .middlebox{
		      	padding : 20px;
		      	margin-top : 100px;
	       }
	       .middlebox input[type='button']{       	
		      	width : 300px;
		      	height : 100px;
		      	background-color : transparent;
		      	border : 4px solid #BDBDBD;
		      	font-color : #BDBDBD;
		      	font-size : 20px; 
	       }
	       .chatbox{
	      		margin-left : 40%;
	       }
	       #totalbox{
	      	
	       }
	       #weather_chat{
		       	padding-bottom : 200px;
		      	padding-top : 100px;
	       }
	       
		 .body{
		  		background-color : #FCFCFC;
		  }
      </style>
      <script type="text/javascript">
      //<!--      
      var ws = null;
      function openserver(){
         var result = document.getElementById("result");
         if(!window.WebSocket){
            //result.innerHTML +="지원하지 않는 브라우저 입니다.<br>";
            return;
         }
         
         //ws = new WebSocket("ws://echo.websocket.org");
         //websocket/chat은 내가 맘대로
         ws = new WebSocket("ws://localhost:8080/SKI_Final/websocket/chat/'${sessionScope.memId}'");
         if(!ws){
            //result.innerHTML +="서버 연결 실패<br>";
         }else{
            ws.onopen = function(){
               //result.innerHTML +="서버 연결 성공<br>";
            }
            
            ws.onclose = function(){
               //result.innerHTML +="서버 연결 종료<br>";
            }
            
            ws.onmessage = function(evt) {
               var msg = document.getElementById("msg");
               var message = evt.data.split(":")
               var sender = message[0];
               var content = message[1];

                if (content == "") {
                        
                 } 
                else {                     
                     if (content.match("/")) {
                         if (content.match(("/" + $("#hiddenid").val()))) {
                             var temp = content.replace("/" + $("#hiddenid").val(), " : ").split(":");
                             if (temp[1].trim() == "") {                               
                             } else {
                                 $("#msg").html($("#msg").html() 
                                     + sender + content.replace("/" + $("#hiddenid").val(), " : ")  + "<br>");
                             }
                         } else {
                            
                         }
                     } else {
                        if($('#hiddenid').val()== sender){
                           $("#msg").html($("#msg").html() + sender + " : " + content );   
                        }
                     }
                     
                 }//content=="" else
            }
         }
      }
           
      function sendmsg(id){
         var chatcontent = $("#message").val();
         $("#starter").append(chatcontent);
         $("#msg").scrollTop($("#msg")[0].scrollHeight); // 스크롤바 아래로 갱신!   
         
         var msg = id + ":/admin" + inputform.message.value;
         $("#msg").html($("#msg").html()+ id +" : "+ inputform.message.value  + "<br>");
         ws.send(msg);
         inputform.message.value="";
         inputform.message.focus();
         //result.innerHTML +="메세지 송신 성공<br>";
      }     
      //-->
      </script>
   </head>

   <body onload="openserver()" class="body">
   <script src="${project}member/script.js"></script> 
    <%@include file="/include/mainheader.jsp" %>
          <aside>
          <div class="weather">
            <ul>
               <li>
                  <c:set var="wfKor" value="${wfKor}"/>
                  <c:if test="${fn:contains(wfKor, '구름')}">
                     <img src="/SKI_Final/images/구름.PNG" width="70px" height="50px"/>
                  </c:if>
                  <c:if test="${fn:contains(wfKor, '눈')}">
                     <img src="/SKI_Final/images/눈.PNG" width="70px" height="50px"/>
                  </c:if>
                  <c:if test="${fn:contains(wfKor, '맑음')}">
                     <img src="/SKI_Final/images/맑음.PNG" width="70px" height="50px"/>
                  </c:if>
                  <c:if test="${fn:contains(wfKor, '비')}">
                     <img src="/SKI_Final/images/비.PNG" width="70px" height="50px"/>
                  </c:if>
                  <c:if test="${fn:contains(wfKor, '흐림')}">
                     <img src="/SKI_Final/images/흐림.PNG" width="70px" height="50px"/>
                  </c:if>
               <br>
                   최저온도 : ${tmn}
               <br>
                   최고온도 : ${tmx}
               <br>
                  ${wfKor}
                     
               </li>
            </ul>   
         </div>
      <br><br>
      <div id="result"></div>
      
      </aside>

             <!--Slider-->
         <div class="slider">
            <div class="callbacks_container">
               <ul class="rslides" id="slider">
                  <li>
                     <div class="slider-img slider-img1 "></div>
                  </li>
                  <li>
                     <div class="slider-img slider-img2"></div>
                  </li>
                  <li>
                     <div class="slider-img slider-img3"></div>

                  </li>
                  <li>
                     <div class="slider-img slider-img4"></div>
                  </li>
               </ul>
            </div>
            <div class="clearfix"></div>
         </div>
    
         <!-- Locations -->
   <div class="wthreelocationsaits" id="locations">
      <div class="container">
      <div class="location-w3-head">
         
         </div>
         <section class="grid3d vertical" id="grid3d">
            <div class="grid-wrap">
               <div class="grid">
                  <figure class="col-md-4 effect-zoe"><img src="/SKI_Final/images/fork.jpg" alt="Odyssey"><figcaption><h4>먹거리</h4></figcaption></figure>
               </div>
               <div class="grid">
                  <figure class="col-md-4 effect-zoe"><img src="/SKI_Final/images/market.png" alt="Odyssey"><figcaption><h4>부대시설</h4></figcaption></figure>
               </div>
               <div class="grid">
                  <figure class="col-md-4 effect-zoe"><img src="/SKI_Final/images/event.jpg" alt="Odyssey"><figcaption><h4>이벤트</h4></figcaption></figure>
               </div>
               <div class="grid">
                  <figure class="col-md-4 effect-zoe"><img src="/SKI_Final/images/discount.jpg" alt="Odyssey"><figcaption><h4>할인정보</h4></figcaption></figure>
               </div>
               <div class="grid">
                  <figure class="col-md-4 effect-zoe"><img src="/SKI_Final/images/notice.png" alt="Odyssey"><figcaption><h4>공지사항</h4></figcaption></figure>
               </div>
               <div class="grid">
                  <figure class="col-md-4 effect-zoe"><img src="/SKI_Final/images/calendar.jpg" alt="Odyssey"><figcaption><h4>예약하기</h4></figcaption></figure>
               </div>
            </div>
            
            <center>
            <form name="inputform">
            <table border="1">
            <tr>
               <th>메세지</th>   
               <td>
               <input type="text" name="message" autofocus
                  placeholder="대화를 입력하세요">
               <input type="hidden" id="hiddenid" value="${sessionScope.memId}">
               </td>
               <th>
                  <input type="button" value="전송" onclick="sendmsg('${sessionScope.memId}')">
               </th>
            </tr>
            <tr>
               <th colspan="3">
    <br><br><br><br><br>
    	<div id="totalbox">

                  
	    <!--Slider-->
	    <div class="slider">
	       <div class="callbacks_container">
	          <ul class="rslides" id="slider">
	             <li>
	                <div class="slider-img slider-img1 "></div>
	             </li>
	             <li>
	                <div class="slider-img slider-img2"></div>
	             </li>
	             <li>
	                <div class="slider-img slider-img3"></div>
	             </li>
	             <li>
	                <div class="slider-img slider-img4"></div>
	             </li>
	          </ul>
	       </div>
	       <div class="clearfix"></div>
	    </div>	         
	    
	    <div id="middlebox">      
			<div class="middlebox">
				<div>
					<input type="button" value="먹거리" onclick="location=''">
					<input type="button" value="부대시설" onclick="location=''">
					<input type="button" value="이벤트" onclick="location=''">
					<input type="button" value="할인정보" onclick="location=''">
					<input type="button" value="공지사항" onclick="location=''">
					<input type="button" value="통합예약" onclick="location=''">
				</div>
			</div>
			
			<div id="weather_chat">
				<div class="weatherbox">
		          <div class="weather">		          
		            <ul>
		               <li>
		                  <c:set var="wfKor" value="${wfKor}"/>
		                  <c:if test="${fn:contains(wfKor, '구름')}">
		                     <img src="/SKI_Final/images/구름.PNG" />
		                  </c:if>
		                  <c:if test="${fn:contains(wfKor, '눈')}">
		                     <img src="/SKI_Final/images/눈.PNG"/>
		                  </c:if>
		                  <c:if test="${fn:contains(wfKor, '맑음')}">
		                     <img src="/SKI_Final/images/맑음.PNG" />
		                  </c:if>
		                  <c:if test="${fn:contains(wfKor, '비')}">
		                     <img src="/SKI_Final/images/비.PNG" />
		                  </c:if>
		                  <c:if test="${fn:contains(wfKor, '흐림')}">
		                     <img src="/SKI_Final/images/흐림.PNG" />
		                  </c:if>
		               <div>최저온도 : ${tmn}</div>                 	 
		               <div>최고온도 : ${tmx}</div>                   	
		               <div>${wfKor} </div>                                    
		               </li>
		            </ul>	           
		         </div><!-- weather -->
			     <br><br>
			     <div id="result"></div>      
				</div><!-- weatherbox -->
				
				<div class="chatbox">
					<form name="inputform">
						<table border="1">
							<tr>
								<th>메세지</th>   
								<td>
									<input type="text" name="message" autofocus placeholder="대화를 입력하세요">
									<input type="hidden" id="hiddenid" value="${sessionScope.memId}">
								</td>
								<th>
									<input type="button" value="전송" onclick="sendmsg('${sessionScope.memId}')">
								</th>
							</tr>
							<tr>
								<th colspan="3">	                  
									<div id="msg">
									<div id="starter"></div>
								</div>	                     
							</th>
							</tr>
						</table>
					</form>  
				</div>  
			</div> 
		</div>
	</div>	<!-- totalbox -->   
   <%@include file="/include/mainfooter.jsp" %>
   </body>
</html>


