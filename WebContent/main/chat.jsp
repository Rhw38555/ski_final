<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<script src="/SKI_Final/member/jquery-3.2.1.js"></script>
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
	<body onload="openserver()">
		<h2> Web Socket </h2>
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
		
	</body>
</html>