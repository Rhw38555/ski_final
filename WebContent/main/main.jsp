<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../member/setting.jsp" %>

<!DOCTYPE html>
<html>
	    <script src="${project}member/jquery-3.2.1.js"></script>
	    <script src="${project}member/jquery-barcode.js"></script>
	   <head>
      <meta charset="UTF-8">
      <link href="./main/a_main.css" rel="stylesheet">
      <script type="text/javascript">
      //<!--      
      $(document).ready(
		function(){
			var result = "GUEST" +Math.floor(Math.random() * 100000);
			$('#hiddenid').val(result);
			
			}	  
	  );
      
	  $(document).on(
			'click','#msgbt',
			function(event) {
				
				var chatcontent = $("#message").val();
		         $("#starter").append(chatcontent);
		         $("#msg").scrollTop($("#msg")[0].scrollHeight); // 스크롤바 아래로 갱신!   
		         var id = $('#hiddenid').val();
		         var msg = id + ":/관리자" + inputform.message.value;
		         $("#msg").html($("#msg").html()+"<div id='chat_msg'><div id='send_mem'>"+ id +" : "+ inputform.message.value  + "</div></div>");
		         ws.send(msg);
		         inputform.message.value="";
		         inputform.message.focus();	
			}
	 );  
     
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
                                 var chatId = '';                   
                                //if(sender == 'admin') chatId = 'send_admin';
                                //else chatId = 'send_mem';
                                $("#msg").html($("#msg").html() 
                                     +"<div id='chat_msg'><div id='send_admin'><pre>" +sender + content.replace("/" + $("#hiddenid").val(), " : ")  + "<pre></div></div>");
                                 var sendmsg = sender+"/"+ content.replace("/" + $("#hiddenid").val(), "");
                                 notifyMe(sendmsg);
                                 //sender == 'admin'
                                 // ().css();
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
         $("#msg").html($("#msg").html()+"<div id='chat_msg'><div id='send_mem'><pre>"+ id +" : "+ inputform.message.value  + "</pre></div></div>");
         ws.send(msg);
         inputform.message.value="";
         inputform.message.focus();
         //result.innerHTML +="메세지 송신 성공<br>";
      }     
      
      function notifyMe(sendmsg) {
        if (!"Notification" in window) {
          alert("This browser does not support desktop notification");
        }
        else if (Notification.permission === "granted") {
         var msg = sendmsg.split("/");
          var notification = new Notification(msg[0]+"님의 메세지 도착",{body: msg[1]});
          setTimeout(notification.close.bind(notification),4000);
          notification.onclick = function(event){
             event.preventDefault();
             alert("메세지 도착");
             inputform.message.focus();
             notification.close();
          }
        }
        else if (Notification.permission !== 'denied') {
          Notification.requestPermission(function (permission) {
          
            if(!('permission' in Notification)) {
              Notification.permission = permission;
            }
       
            if (permission === "granted") {
              var notification = new Notification("Hi there!");
            }
          });
        }
      }
      
      //-->
      </script>
   </head>

   <body onload="openserver()" class="body">
   <script src="${project}member/script.js"></script> 

    <%@include file="/include/mainheader.jsp" %>

    <br><br><br><br><br><br><br>
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
               <br><br>
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
                           <img src="/SKI_Final/images/weather-icon-cloudy.png" />
                        </c:if>
                        <c:if test="${fn:contains(wfKor, '눈')}">
                           <img src="/SKI_Final/images/weather-icon-snow.png"/>
                        </c:if>
                        <c:if test="${fn:contains(wfKor, '맑음')}">
                           <img src="/SKI_Final/images/weather-icon-sun.png" />
                        </c:if>
                        <c:if test="${fn:contains(wfKor, '비')}">
                           <img src="/SKI_Final/images/weather-icon-rain.png" />
                        </c:if>
                        <c:if test="${fn:contains(wfKor, '흐림')}">
                           <img src="/SKI_Final/images/weather-icon-fade.png" />
                        </c:if>
                        <br><br>
                     <div>최저온도 : ${tmn}</div>                     
                     <div>최고온도 : ${tmx}</div>                      
                     <div>${wfKor} </div>                                    
                     </li>
                  </ul>              
               </div><!-- weather -->
              <br><br>
              <div id="result"></div>      
            </div><!-- weatherbox -->
            <!--  
            <style>
               
            </style>
            -->
            <div class="chatbox">
               <form name="inputform">
                  <table id="chatTable">                    
                     <tr>
                     	<th colspan="2" style="text-align: center;">
                     		궁금한 사항이 있으면 물어보세요.
                     	</th>
                     </tr>
                     <tr>
                        <th colspan="2">                  
                           <div id="msg" style="overflow:auto;">	                           
	                           	<div id="starter"></div>       
	                           	
                           </div>            
                     	</th>
                     </tr>
                     <tr>  
                        <td>                      	
                           <textarea id="msgtx" cols="32" rows="5" name="message" autofocus placeholder="대화를 입력하세요">
						</textarea>
                           <input type="hidden" id="hiddenid">
                        </td>
                        <th>
                           <input type="button" id="msgbt" class="btn btn-default" value="전송">
                        </th>
                     </tr>
                  </table>
               </form>  
            </div>  <!-- chatbox -->
         </div> <!-- weather_chat -->
      </div> <!-- middlebox -->
   </div>   <!-- totalbox -->   
   <%@include file="/include/mainfooter.jsp" %>
   </body>
</html>

