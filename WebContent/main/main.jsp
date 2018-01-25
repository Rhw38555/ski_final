<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../member/setting.jsp" %>

<!DOCTYPE html>
<html>
	 
	<head>
		<meta charset="UTF-8">
		<style type="text/css">
			#msg{
				height : 300px;
				width : 100%;
				overflow: auto;
				text-align : left;
			}
			blockquote{
			    border-left:none
			}
			
			.quote-badge{
			    background-color: rgba(0, 0, 0, 0.2);   
			}
			
			.quote-box{			    
			    overflow: hidden;
			    margin-top: -50px;
			    padding-top: -100px;
			    border-radius: 17px;
			    background-color: #4ADFCC;
			    margin-top: 25px;
			    color:white;
			    width: 325px;
			    box-shadow: 2px 2px 2px 2px #E0E0E0;			    
			}
			
			.quotation-mark{			    
			    margin-top: -10px;
			    font-weight: bold;
			    font-size:100px;
			    color:white;
			    font-family: "Times New Roman", Georgia, Serif;		    
			}
			
			.quote-text{			    
			    font-size: 19px;
			    margin-top: -65px;
			}
		</style>
		<script src="${project}member/jquery-3.2.1.js"></script>
	 	<script src="${project}member/jquery-barcode.js"></script>
		<script type="text/javascript">
		//<!--
		$(document).ready(function() {
			if($('#user_barcode').val()!=null)
				generateBarcode($('#user_barcode').val());
			
			openserver();
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

	<body>
	<script src="${project}member/script.js"></script> 

 		<%@include file="/include/mainheader.jsp"%>
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
				<input type="hidden" id="user_barcode" value="${user_barcode}">
				
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
								<div id="msg">
									<div id="starter"></div>
								</div>								
							</th>
						</tr>
					</table>			
				</form>			
			</section>
		</div>
	</div>
	<!-- //Locations -->
				
				
			
			</section>
		</div>
	</div><!-- #portfolio -->
			


		<%@include file="/include/mainfooter.jsp" %>
	</body>
</html>