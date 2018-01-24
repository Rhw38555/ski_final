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
			#msg
				{
					height : 200px;
					width : 300px;
					overflow: auto;
					text-align : left;
				}
			
		</style>
		<script type="text/javascript">
		//<!--
		
		var ws = null;
		var requestPermissionButton = $("#requestPermissionButton");
		var notificationButton = $("#notificationButton");
		var notificationMessage = $("#notificationMessage");
		var iconDataURI = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAKBJREFUeNpiYBjpgBFd4P///wJAaj0QO9DEQiAg5ID9tLIcmwMYsDgABhqoaTHMUHRxpsGYBv5TGqTIZsDkYWLo6gc8BEYdMOqAUQeMOoAqDgAWcgZAfB9EU63SIAGALH8PZb+H8v+jVz64KiOK6wIg+ADEArj4hOoCajiAqMpqtDIadcCoA0YdQIoDDtCqQ4KtBY3NAYG0csQowAYAAgwAgSqbls5coPEAAAAASUVORK5CYII=";
		
		
		function openserver(){
			var result = document.getElementById("result");
			if(!window.WebSocket){
				//result.innerHTML +="지원하지 않는 브라우저 입니다.<br>";
				return;
			}
			
			//ws = new WebSocket("ws://echo.websocket.org");
			//websocket/chat은 내가 맘대로
			ws = new WebSocket("ws://localhost:8080/SKI_Final/websocket/chat/'${sessionScope.adminId}'");
			if(!ws){
				//result.innerHTML +="서버 연결 실패<br>";
			}else{
				ws.onopen = function(){
					//result.innerHTML +="서버 연결 성공<br>";
				}
				
				ws.onclose = function(){
					//result.innerHTML +="서버 연결 종료<br>";
				}
				
				ws.onmessage = function(evt){
					var msg = document.getElementById("msg");
					var message = evt.data.split(":")
					var sender = message[0];
					var content = message[1];
					
					
					 if (content == "") {
				            
				        } else {
				        	
				            if (content.match("/")) {
				                if (content.match(("/" + $("#hiddenid").val()))) {
				                    var temp = content.replace("/" + $("#hiddenid").val(), " : ").split(":");
				                    if (temp[1].trim() == "") {
				                    	
				                    } else {
				                        $("#msg").html($("#msg").html() + sender + content.replace("/" + $("#hiddenid").val(), " : ")  + "<br>" );
				                    }
				                } else {
				                	
				                }
				            } else {
				            	if($('#hiddenid').val()== sender){
				            		$("#msg").html($("#msg").html() + sender + " : " + content );	
				            	}
				            }
				            
				        }//content=="" else
					
					
					//msg.innerHTML += evt.data + "<br>";
					//result.innerHTML +="메세지 수신 성공<br>";
				}
			}
		}
		
		
		function sendmsg(id){
			var chatcontent = $("#message").val();
			$("#starter").append(chatcontent);
			$("#msg").scrollTop($("#msg")[0].scrollHeight); // 스크롤바 아래로 갱신!	
			
			var msg = id + ":/" +inputform.id.value + inputform.message.value;
			$("#msg").html($("#msg").html() + id +" : "+ inputform.message.value + "<br>" );
			ws.send(msg);
			inputform.message.value="";
			inputform.message.focus();
			//result.innerHTML +="메세지 송신 성공<br>";
		}
		
		
		//데스크탑 알림 권한 요청 버튼을 누르면,
		requestPermissionButton.on("click", function () {
			//데스크탑 알림 권한 요청
		    Notification.requestPermission(function (result) {

		        //요청을 거절하면,
		        if (result === 'denied') {
		            return;
		        }
		        //요청을 허용하면,
		        else {
		            //데스크탑 알림 권한 요청 버튼을 비활성화
		            requestPermissionButton.attr('disabled', 'disabled');
		            //데스크탑 메시지 입력폼을 활성화
		            notificationMessage.removeAttr('disabled');
		            //데스크탑 메시지 요청 버튼을 활성화
		            notificationButton.removeAttr('disabled');
		            return;
		        }
		    });
		});


		//데스크탑 알림 버튼을 누르면,
		notificationButton.on("click", function () {
		    var message = notificationMessage.val();
		    
		    //메시지를 입력한 경우에만,
		    if (message !== null && message.length > 0) {
		        
		        var options = {
		            body: message,
		            icon: iconDataURI
		        }
		       
		        //데스크탑 알림 요청
		        var notification = new Notification("데스크탑 알림 예제 타이틀", options);
		        
		        //알림 후 5초 뒤,
		        setTimeout(function () {
		            //얼람 메시지 닫기
		            notification.close();
		        }, 5000);
		    }
		});
		//-->
		</script>
		<!-- 
		<style type="text/css">
			body{
				text-align: center;
			}
			aside {
				width : 199px;	
				height : 280px;				
				float : left;
			}
			section {
				width : 1300px;			
				height : 1000px;
				float : left;
			}
			.topleft, .topright, .bottomleft, .bottomright{
				width : 200px;
				height : 200px;
				margin : 50px;
			}
			.admin {
				width : 500px;
				height : 200px;
				margin : 50px;
			}
			.button {
				width : 190px;
				height : 100px;
			}
			footer {
				clear : left;
				height : 50px;
			}	
			header, aside, section, footer {
				border : 1px solid black;
				margin : 0px;
			}
		</style>
		 -->
	</head>

	<body onload="openserver()">
	<script src="${project}member/script.js"></script> 
	
    <%@include file="/include/adminmainnav.jsp" %>
 	<%@include file="/include/adminmainheader.jsp" %>
 	
	<div class="content-block" id="portfolio">
		<div class="container">
			<section class="block-body">
				<div class="row">
					<div class="col-sm-4 blog-post">
						<a href="adminMain.do" class="recent-work" style="background-image:url(assets/images/newsletter-bg.png)">
							<h2 style="color:white">먹거리</h2>
						</a>
					</div>
					<div class="col-sm-4 blog-post">
						<a href="adminMain.do" class="recent-work" style="background-image:url(assets/images/newsletter-bg.png)">
							<h2 style="color:white">부대시설</h2>
						</a>
					</div>
					<div class="col-sm-4 blog-post">
						<a href="adminMain.do" class="recent-work" style="background-image:url(assets/images/newsletter-bg.png)">
							<h2 style="color:white">이벤트 정보</h2>
						</a>
					</div>
					
				</div>
				<div class="row">
					<div class="col-sm-4 blog-post">
						<a href="adminMain.do" class="recent-work" style="background-image:url(assets/images/newsletter-bg.png)">
							<h2 style="color:white">할인 정보</h2>
						</a>
					</div>
					<div class="col-sm-4 blog-post">
						<a href="adminMain.do" class="recent-work" style="background-image:url(assets/images/newsletter-bg.png)">
							<h2 style="color:white">공지사항</h2>
						</a>
					</div>
					<div class="col-sm-4 blog-post">
						<a href="adminMain.do" class="recent-work" style="background-image:url(assets/images/newsletter-bg.png)">
							<h2 style="color:white">통합예약</h2>
						</a>
					</div>
				</div>
				
				<form name="inputform">
				<button id="requestPermissionButton" class="btn btn-warning btn-lg btn-block">데스크탑 알림 권한 요청</button>
				<hr />
				<div id="notificationBlock" class="form-group">
				    <label class="control-label">알림 메시지</label>
				    <div class="input-group">
				        <span class="input-group-addon">메시지</span>
				        <input id="notificationMessage" type="text" class="form-control" disabled/>
				        <span class="input-group-btn">
				            <button id="notificationButton" class="btn btn-info" type="button" disabled>알림</button>
				        </span>
				    </div>
				</div>
				<table border="1">
				<tr>
					<th>메세지</th>
					<th>
						<input type="text" name="id" size="5px"
						 placeholder="대화명">
						 <input type="hidden" id="hiddenid" value="${sessionScope.adminId}">
					</th>
					<td>
					<input type="text" name="message" autofocus
						placeholder="대화를 입력하세요">
					</td>
					<th>
						<input type="button" value="전송" onclick="sendmsg('${sessionScope.adminId}')">
					</th>
				</tr>
				<tr>
					<th colspan="4">
					<div id="msg">
						<div id="starter"></div>
					</div>
					</th>
				</tr>
			</table>
			</form>
			
			</section>
		</div>
	</div><!-- #portfolio -->
			

		<aside>
			<table border="1">
				<tr>
					<td>
						<c:set var="wfKor" value="${wfKor}"/>
						<c:if test="${fn:contains(wfKor, '구름')}">
							<img src="/SKI_Final/images/구름.PNG" width="140px" height="100px"/>
						</c:if>
						<c:if test="${fn:contains(wfKor, '눈')}">
							<img src="/SKI_Final/images/눈.PNG" width="140px" height="100px"/>
						</c:if>
						<c:if test="${fn:contains(wfKor, '맑음')}">
							<img src="/SKI_Final/images/맑음.PNG" width="140px" height="100px"/>
						</c:if>
						<c:if test="${fn:contains(wfKor, '비')}">
							<img src="/SKI_Final/images/비.PNG" width="140px" height="100px"/>
						</c:if>
						<c:if test="${fn:contains(wfKor, '흐림')}">
							<img src="/SKI_Final/images/흐림.PNG" width="140px" height="100px"/>
						</c:if>
					<br>
						 최저온도 : ${tmn}
					<br>
						 최고온도 : ${tmx}
					<br>
						${wfKor}
							
					</td>
				</tr>
				
				<tr>
					<td>
						<input class="button" type="button" value="WinterPark 오시는길" onclick="location='WinterParkTrafic.do'">
						
					</td>
				</tr>
				
			</table>
			
		<br><br>
		<div id="result"></div>
		
		</aside>
			
		<%@include file="/include/mainfooter.jsp" %>
	</body>
</html>