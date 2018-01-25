<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
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
	<script src="/SKI_Final/reverse/reserveRoomChange.js"></script>   
	<script src="/SKI_Final/reverse/request.js"></script>
	<script src="/SKI_Final/reverse/jquery-ui.js"></script>	  
	  
	<script src="./assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="./assets/js/bootstrap.min.js"></script>
	<script src="./assets/js/jquery.actual.min.js"></script>
	<script src="./assets/js/jquery.scrollTo.min.js"></script>
	<script src="./assets/js/script.js"></script>  
	  <%@include file="/include/mainnav.jsp" %>
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
		window.addEventListener("beforeunload", function (e) {
			var confirmationMessage = "\o/";	
			(e || window.event).returnValue = confirmationMessage; //Gecko + IE			
				return confirmationMessage; //Webkit, Safari, Chrome
				modcount();
		});
		</script>	
	</head>
	<body onload="InitializeStaticMenu()" class="rebody"> 	 
	
	<div class="container">
		<div class="row">
			<div class="pageselbox">
				<div id="topdiv">
					&nbsp;&nbsp;<span class="glyphicon glyphicon-home" aria-hidden="true"> 콘도 예약 변경 페이지</span>
				</div> 
				<br>
				<div id="topdiv">
					&nbsp;&nbsp;<span class="glyphicon glyphicon-asterisk" aria-hidden="true"> 야호</span>
				</div>
			</div>	
		</div>	   
	</div>
		
		<form method="post" action="reverseChangeRoomPro.do" onsubmit="return finalcheck()">
			<c:set var="roomcheck" value="${fn:split( re.get(0).room_check, '/')}" />
			<c:set var="cnt" value="0"/>
			<c:forEach var="rs" items="${re}">
				<c:set var="cnt" value="${cnt+1}"/>
			</c:forEach> 
			<input type="hidden" id="finalcnt" name="finalcnt" value="0">
			<input type="hidden" name="num" id="num" value="${re.get(0).num}">
			<input type="hidden" id="reset_checkin" value="${roomcheck[0]}">
			<input type="hidden" id="reset_checkout" value="${roomcheck[1]}">
			<input type="hidden" id="reset_name" value="${re.get(0).name}">
			<input type="hidden" id="reset_room_price" value="${re.get(0).room_price}">
			<input type="hidden" id="reset_carnum" value="${re.get(0).carnum}">
			<input type="hidden" id="reset_tel" value="${re.get(0).tel}">
			<input type="hidden" id="reset_room_date1" value="${re.get(0).room_date}">
			<input type="hidden" id="reset_room2_cnt0" value="${re.get(0).room_2}">
			<input type="hidden" id="reset_room4_cnt0" value="${re.get(0).room_4}">
			<input type="hidden" id="reset_room8_cnt0" value="${re.get(0).room_8}">
			<input type="hidden" id="roomdate0" value="${roomcheck[0]}">
			<input type="hidden" id="roomdate1" value="${roomcheck[1]}">
			<input type="hidden" id="datecnt" value="${cnt}">
			<input type="hidden" id="roomorigindate" value="${roomcheck[0]}">		
			<input type="hidden" class="roomdateval" id="roomdateval0" value="0">
			<input type="hidden" class="roomdateval" id="roomdateval1" value="0">
			<input type="hidden" class="roomdateval" id="roomdateval2" value="0">		
			<input type="hidden" name="room_date" id="room_date">
			<input type="hidden" name="room_cnt" id="room_cnt">
			<input type="hidden" name="room_price" id="room_price">
			<input type="hidden" name="room_check" id="room_check">
			<c:if test="${cnt > 1}">
				<input type="hidden" id="reset_room_date2" value="${re.get(1).room_date}">
				<input type="hidden" id="reset_room2_cnt1" value="${re.get(1).room_2}">
				<input type="hidden" id="reset_room4_cnt1" value="${re.get(1).room_4}">
				<input type="hidden" id="reset_room8_cnt1" value="${re.get(1).room_8}">
			</c:if>
			<c:if test="${cnt > 2}">
				<input type="hidden" id="reset_room_date3" value="${re.get(2).room_date}">
				<input type="hidden" id="reset_room2_cnt2" value="${re.get(2).room_2}">
				<input type="hidden" id="reset_room4_cnt2" value="${re.get(2).room_4}">
				<input type="hidden" id="reset_room8_cnt2" value="${re.get(2).room_8}">
			</c:if>	   		
			
			  
			<!-- Datepicker -->
		<div class="container">
        	<div class="row">	
				<div class="totalbox">
					<div id="box1">
						<div class="stepbox">
						 <br>
		                <h3>step 1</h3>
		               	<h4>날짜 선택</h4>
						</div> <!-- stepbox -->
						<div class="selectbox">
						 <div class="calbox">
							<div id="calbox">  
								체크인<br><br> 
								<div id="datepicker1"></div>
								<div id="re">
									${roomcheck[0]}
								</div>
							</div>  <!-- calbox -->
							<div id="calbox">      
								체크아웃     <br><br>
								<div id="datepicker2"></div>
								<div id="re2">
									${roomcheck[1]}
								</div>
							</div> <!-- calbox -->
						</div><!-- calbox -->
						</div> <!-- selectbox -->
					</div> <!-- box1 -->
	
					<div id="box2">
						<div class="stepbox">
							<br>
			                <h3>step 2</h3>
			               	<h4>객실 선택</h4>
						</div>
						<div class="selectbox">
							<div id="roomcntbox">              
								<div id="roomdate1">
									<div class="date" id="date1">
										<fmt:formatDate value="${re.get(0).room_date}"
											type="both" pattern="yyyy-MM-dd"/>
									</div>
								<div class="__count_range">
									2인실 (20,000) &nbsp;&nbsp;
									<input class="ran" id="mran2_0" type="button" value="-" count_range="m" >
									<input class="count" id="cnt2_0" value="${re.get(0).room_2}" readonly name="">
									<input class="ran" id="pran2_0" type="button" value="+" count_range="p" >
								</div>
								<div class="__count_range">
									4인실 (40,000)&nbsp;&nbsp;&nbsp;
									<input class="ran" id="mran4_0" value="-" count_range="m" type="button">
									<input class="count" id="cnt4_0" value="${re.get(0).room_4}" readonly name="">
									<input class="ran" id="pran4_0" value="+" count_range="p" type="button">
								</div>
								<div class="__count_range">
									8인실 (80,000)&nbsp;&nbsp;&nbsp;
									<input class="ran" id="mran8_0" value="-" count_range="m" type="button">
									<input class="count" id="cnt8_0" value="${re.get(0).room_8}" readonly name="">
									<input class="ran" id="pran8_0" value="+" count_range="p" type="button">
								 </div>
								</div> <!-- roomdate1 -->
								<div id="roomdate2">
									<div class="date" id="date2">
										<c:if test="${cnt > 1}">
											<fmt:formatDate value="${re.get(1).room_date}"
											type="both" pattern="yyyy-MM-dd"/>
											<c:set var="room_02" value="${re.get(1).room_2}"/>
											<c:set var="room_04" value="${re.get(1).room_4}"/>
											<c:set var="room_08" value="${re.get(1).room_8}"/>
										</c:if>	
										<c:if test="${cnt < 1}">
											<c:set var="room_02" value="0"/>
											<c:set var="room_04" value="0"/>
											<c:set var="room_08" value="0"/>
										</c:if>
									</div> <!-- date2 -->
									<div class="__count_range">
										2인실 (20,000) &nbsp;&nbsp;
										<input class="ran" id="mran2_1" type="button" value="-" count_range="m" >
										<input class="count" id="cnt2_1" value="${room_02}" readonly name="">
										<input class="ran" id="pran2_1" type="button" value="+" count_range="p" >
									</div>
									<div class="__count_range">
										4인실 (40,000)&nbsp;&nbsp;&nbsp;
										<input class="ran" id="mran4_1" value="-" count_range="m" type="button">
										<input class="count" id="cnt4_1" value="${room_04}" readonly name="">
										<input class="ran" id="pran4_1" value="+" count_range="p" type="button">
									</div>
									<div class="__count_range">
										8인실 (80,000)&nbsp;&nbsp;&nbsp;
										<input class="ran" id="mran8_1" value="-" count_range="m" type="button">
										<input class="count" id="cnt8_1" value="${room_08}" readonly name="">
										<input class="ran" id="pran8_1" value="+" count_range="p" type="button">
									</div>
								</div><!-- roomdate2 -->						
								<div id="roomdate3">
									<div class="date" id="date3">
										<c:if test="${cnt > 2}">
											<fmt:formatDate value="${re.get(2).room_date}"
											type="both" pattern="yyyy-MM-dd"/>
											<c:set var="room_12" value="${re.get(2).room_2}"/>
											<c:set var="room_14" value="${re.get(2).room_4}"/>
											<c:set var="room_18" value="${re.get(2).room_8}"/>
										</c:if>	
										<c:if test="${cnt < 2}">
											<c:set var="room_12" value="0"/>
											<c:set var="room_14" value="0"/>
											<c:set var="room_18" value="0"/>
										</c:if>  	
									</div> <!-- date3 -->
									<div class="__count_range">
										2인실 (20,000) &nbsp;&nbsp;
										<input class="ran" id="mran2_2" type="button" value="-" count_range="m" >
										<input class="count" id="cnt2_2" value="${room_12}" readonly name="">
										<input class="ran" id="pran2_2" type="button" value="+" count_range="p" >
									</div>
									<div class="__count_range">
										4인실 (40,000)&nbsp;&nbsp;&nbsp;
										<input class="ran" id="mran4_2" value="-" count_range="m" type="button">
										<input class="count" id="cnt4_2" value="${room_14}" readonly name="">
										<input class="ran" id="pran4_2" value="+" count_range="p" type="button">
									</div>
									<div class="__count_range">
										8인실 (80,000)&nbsp;&nbsp;&nbsp;
										<input class="ran" id="mran8_2" value="-" count_range="m" type="button">
										<input class="count" id="cnt8_2" value="${room_18}" readonly name="">
										<input class="ran" id="pran8_2" value="+" count_range="p" type="button">
									</div>
								</div><!-- roomdate3 -->	       
							  
							<div class="roomprice">        		                  
								<div class="roompricemention">총 가격 : &nbsp; </div>
								<div id="roompricebox">${re.get(0).room_price}</div>
							<br><br>
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
									<input type="text" id="name" name="name" placeholder="이름을 입력해주세요" 
									value="${re.get(0).name}" onkeyup="name_keyup()">
								</div>
								<div class="textbox">
			               			<div class="textmention">*휴대폰번호</div>
									<input type="text" id="tel" name="tel" placeholder="-을 빼고 입력해주세요" 
									value="${re.get(0).tel}" onkeyup="tel_keyup()"> <br>
								</div>
								<div class="textbox">
			               			<div class="textmention">차량번호</div>
									<input type="text" id="carnum" name="carnum" placeholder="차량번호를 입력해주세요" 
									value="${re.get(0).carnum}" onkeyup="carnum_keyup()"> <br>
								</div>
							</div>
						</div><!-- selectbox -->
					</div> <!-- box3 -->
				</div><!-- totalbox -->
			</div>
		</div>
			
		<div id="STATICMENU">	
			<div class="checkbox">
				<div class="checktitle">
		      		예약 정보
		      	</div>
		      	<br>
				<table class="type04">
					<tbody  id="ta">
						<tr>   	
							<th> 체크인 </th>	            		
							<td id="check_in" colspan="3"> ${roomcheck[0]} </td>
						</tr>
						<tr>
							<th> 체크아웃 </th>
							<td id="check_out" colspan="3"> ${roomcheck[1]} </td>
						</tr>
						<tr>
							<td> 날짜 </td>
							<td> 2인실 </td>
							<td> 4인실 </td>
							<td> 8인실 </td>
						</tr>
						<tr id="roomroom_0">
							<th id="room_date_0">  
								<fmt:formatDate value="${re.get(0).room_date}"
								type="both" pattern="yyyy-MM-dd"/>
							</th>
							<td id="room2_0"> ${re.get(0).room_2 } </td>
							<td id="room4_0"> ${re.get(0).room_4 } </td>
							<td id="room8_0"> ${re.get(0).room_8 } </td>
						</tr> <!-- roomroom_0 -->				
						<tr id="roomroom_1">
							<th id="room_date_1">  
								<c:if test="${cnt > 1}">
									<fmt:formatDate value="${re.get(1).room_date}"
									type="both" pattern="yyyy-MM-dd"/>
									<c:set var="room2_1" value="${re.get(1).room_2 }"/>
									<c:set var="room4_1" value="${re.get(1).room_4 }"/>
									<c:set var="room8_1" value="${re.get(1).room_8 }"/>
								</c:if>
								<c:if test="${cnt < 1 }">
									<c:set var="room2_1" value="0"/>
									<c:set var="room4_1" value="0"/>
									<c:set var="room8_1" value="0"/>
								</c:if>
							</th>
							<td id="room2_1"> ${room_2} </td>
							<td id="room4_1"> ${room_4} </td>
							<td id="room8_1"> ${room_8} </td>
						</tr> <!-- roomroom_1 -->
						
						<tr id="roomroom_2">
							<th id="room_date_2">  
								<c:if test="${cnt > 2}">
									<fmt:formatDate value="${re.get(2).room_date}"
									type="both" pattern="yyyy-MM-dd"/>
									<c:set var="room2_2" value="${re.get(2).room_2}"/>
									<c:set var="room4_2" value="${re.get(2).room_4 }"/>
									<c:set var="room8_2" value="${re.get(2).room_8 }"/>
								</c:if>
								<c:if test="${cnt < 2 }">
									<c:set var="room2_2" value="0"/>
									<c:set var="room4_2" value="0"/>
									<c:set var="room8_2" value="0"/>
								</c:if>	            			
							</th>
							<td id="room2_2"> ${room2_2} </td>
							<td id="room4_2"> ${room4_2} </td>
							<td id="room8_2"> ${room8_2} </td>
						</tr> <!-- roomroom_2 -->
						<tr>
							<th> 이름 </th>
							<td colspan="3" id="nametd"> ${re.get(0).name} </td>
						</tr>
						<tr>
							<th> 전화번호 </th>
							<td colspan="3" id="teltd"> ${re.get(0).tel} </td>
						</tr>
						<tr>
							<th> 차량번호 </th>
							<td colspan="3" id="carnumtd"> 
								<c:if test="${re.get(0).carnum != null}">
									${re.get(0).carnum} 
								</c:if>
							</td>
						</tr>		            	
					</tbody>
				</table>
				<div id="btbox">
					<input type="button" id="resetbt" value="다시설정">
					<input type="button" id="back" value="변경취소">
					<input type="submit" id="paybt" value="변경">
				</div> <!-- btbox -->
			</div> <!-- checkbox -->
		</div><!--  -->
		</form>
		  <br><br>
		<div id="result"></div>
		<div id="result2"></div>
		<div id="result3"></div>
		<div id="result4"></div>
	</body>
</html>