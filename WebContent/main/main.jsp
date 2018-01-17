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
	</head>

	<body onload="generateBarcode('${user_barcode}')">
	<script src="${project}member/script.js"></script> 
	<script type="text/javascript">
		//<!--
		
		$(document).ready(
			openserver()
		);
		
		var ws = null;
		function openserver() {
			if(!window.WebSocket) {
				return;
			}
			
			//ws = new WebSocket("ws://echo.websocket.org");
			//websocket/chat은 내가 맘대로
			ws = new WebSocket("ws://localhost:8080/SKI_Final/main/main.do/'${sessionScope.memId}'");
			if(!ws){
				result.innerHTML +="서버 연결 실패<br>";
			}else{
				ws.onopen = function(){//연결할때
					result.innerHTML +="서버 연결 성공<br>";
				}
				
				ws.onclose = function(){
					result.innerHTML +="서버 연결 종료<br>";
				}
				
				ws.onmessage = function(evt){//서버로 들어온 메세지 수신
					var msg = document.getElementById("msg");
					msg.innerHTML += evt.data + "<br>";
					result.innerHTML +="메세지 수신 성공<br>";
				}
			}
		}
		
		function sendmsg(){
			var result = document.getElementById("result");
			var msg = inputform.id.value + ":" + inputform.message.value;
			alert(msg);
			ws.send("하이");
			inputform.message.value="";
			inputform.message.focus();
			result.innerHTML +="메세지 송신 성공<br>";
		}
		//-->
		</script> 
    
 	<%@include file="/include/mainheader.jsp" %>
 	<%@include file="/include/mainnav.jsp" %>
		
		<section>
			<table>
				<tr>
					<th>
				<input class="admin" type="button" value="공지사항" onclick="location='adminMain.do'">
					</th>
				</tr>
				<tr>
					<th>	
				<input class="topleft" type="button" value="먹거리" onclick="location='adminMain.do'">
				<input class="topright" type="button" value="부대시설" onclick="location='adminMain.do'">
				<input class="bottomleft" type="button" value="이벤트정보" onclick="location='adminMain.do'">
				<input class="bottomright" type="button" value="할인정보" onclick="location='adminMain.do'">
					</th>
				</tr>
			</table>
		</section>
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
						<input class="button" type="button" value="WinterPark 오시는길" onclick="location='adminMain.do'">
						<div id="barcodeTarget" class="barcodeTarget"></div>
					</td>
				</tr>
			</table>
			<form name="inputform">
			<table border="1">
				<tr>
					<th>메세지</th>
					<th>
						<input type="text" name="id" size="5px"
						 placeholder="대화명">
					</th>
					<td>
					<input type="text" name="message" autofocus
						placeholder="대화를 입력하세요">
					</td>
					<th>
						<input type="button" value="전송" onclick="sendmsg()">
					</th>
					</tr>
					<tr>
						<th colspan="4">
							<div id="msg"></div>
						</th>
					</tr>
			</table>
			</form>
			<div id="result"></div>
		</aside>	
		<%@include file="/include/mainfooter.jsp" %>
	</body>
</html>

	