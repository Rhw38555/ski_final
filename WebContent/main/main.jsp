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
	
    <%@include file="/include/mainnav.jsp" %>
 	<%@include file="/include/mainheader.jsp" %>
 	
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