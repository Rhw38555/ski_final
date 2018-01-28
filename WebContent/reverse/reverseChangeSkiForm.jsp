<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
       
<html>
	<head>
	    <meta charset="utf-8">
	    <link href="/SKI_Final/reverse/jquery-ui.css" rel="stylesheet">
	    <link href="/SKI_Final/reverse/datepicker.css" rel="stylesheet">  
	    <link href="/SKI_Final/reverse/re.css" rel="stylesheet">  
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	    
	    <script src="/SKI_Final/reverse/jquery.js"></script>     
	    <script src="/SKI_Final/reverse/reserveSkiChange.js"></script>   
		<script src="/SKI_Final/reverse/request.js"></script>
		<script src="/SKI_Final/reverse/jquery-ui.js"></script>
		<script src="/SKI_Final/reverse/jquery-ui.multidatespicker.js"></script>
	
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
		 /*
		window.addEventListener("beforeunload", function (e) {
			var confirmationMessage = "\o/";	
			(e || window.event).returnValue = confirmationMessage; //Gecko + IE			
				return confirmationMessage; //Webkit, Safari, Chrome
				modcount();
		});
*/
		
		
		</script>
	</head>
	<body onload="InitializeStaticMenu()" class="rebody"> 	 
	
	<div class="container">
		<div class="row">
			<div class="pageselbox">
				<div id="topdiv">
					&nbsp;&nbsp;<span class="glyphicon glyphicon-asterisk" aria-hidden="true"> 스키권 예약변경 페이지입니다</span>
				</div> 
				<br>
			</div>	
		</div>	   
	</div>
	
	<form name="reverseform" method="post" action="reverseChangeSkiPro.do" onsubmit="return finalcheck()">
		<c:set var="cnt" value="0"/>
	    <c:forEach var="rs" items="${re}">
	   		<c:set var="cnt" value="${cnt+1}"/>
	    </c:forEach>
		<input type="hidden" id="datecnt" value="${cnt}">
		<input type="hidden" id="finalcnt" name="finalcnt" value="0">
		<input type="hidden" name="num" id="num" value="${re.get(0).num}">
		<input type="hidden" id="reset_name" value="${re.get(0).name}">
		<input type="hidden" id="reset_ski_price" value="${re.get(0).ski_price}">
		<input type="hidden" id="reset_carnum" value="${re.get(0).carnum}">
		<input type="hidden" id="reset_tel" value="${re.get(0).tel}">
		
		<input type="hidden" id="reset_ski_date1" value="">
		<input type="hidden" id="reset_ski2_cnt0" value="${re.get(0).ski_morning}">
		<input type="hidden" id="reset_ski4_cnt0" value="${re.get(0).ski_night}">
		<input type="hidden" id="reset_ski8_cnt0" value="${re.get(0).ski_day}">
		<input type="hidden" class="skidateval" id="skidateval0" value="0">
		<input type="hidden" class="skidateval" id="skidateval1" value="0">
		<input type="hidden" class="skidateval" id="skidateval2" value="0">
		<c:if test="${cnt > 1}"> <!--스키예약 이틀 이상 했을 경우--> 
			<input type="hidden" id="reset_ski_date2" value="">
			<input type="hidden" id="reset_ski2_cnt1" value="${re.get(1).ski_morning}">
			<input type="hidden" id="reset_ski4_cnt1" value="${re.get(1).ski_night}">
			<input type="hidden" id="reset_ski8_cnt1" value="${re.get(1).ski_day}">
			<c:set var="ski_2_1" value="${re.get(1).ski_morning}"/>
			<c:set var="ski_4_1" value="${re.get(1).ski_night}"/>
			<c:set var="ski_8_1" value="${re.get(1).ski_day}"/>
			<c:set var="ski2_1" value="${re.get(1).ski_morning }"/>
			<c:set var="ski4_1" value="${re.get(1).ski_night }"/>
			<c:set var="ski8_1" value="${re.get(1).ski_day }"/>
		</c:if>
		<c:if test="${cnt < 2}">
			<c:set var="ski_2_1" value="0"/>
			<c:set var="ski_4_1" value="0"/>
			<c:set var="ski_8_1" value="0"/>
			
			<c:set var="ski2_1" value="0"/>
			<c:set var="ski4_1" value="0"/>
			<c:set var="ski8_1" value="0"/>
		</c:if>
		<c:if test="${cnt > 2}"> <!--스키예약 3일 다 했을 경우--> 
			<input type="hidden" id="reset_ski_date3" value="">
			<input type="hidden" id="reset_ski2_cnt2" value="${re.get(2).ski_morning}">
			<input type="hidden" id="reset_ski4_cnt2" value="${re.get(2).ski_night}">
			<input type="hidden" id="reset_ski8_cnt2" value="${re.get(2).ski_day}">
			<c:set var="ski_2_2" value="${re.get(2).ski_morning}"/>
			<c:set var="ski_4_2" value="${re.get(2).ski_night}"/>
			<c:set var="ski_8_2" value="${re.get(2).ski_day}"/>
			
			<c:set var="ski2_2" value="${re.get(2).ski_morning}"/>
			<c:set var="ski4_2" value="${re.get(2).ski_night }"/>
			<c:set var="ski8_2" value="${re.get(2).ski_day }"/>
		</c:if>	 
		<c:if test="${cnt < 3}">
			<c:set var="ski_2_2" value="0"/>
			<c:set var="ski_4_2" value="0"/>
			<c:set var="ski_8_2" value="0"/>
			
			<c:set var="ski2_2" value="0"/>
			<c:set var="ski4_2" value="0"/>
			<c:set var="ski8_2" value="0"/>
		</c:if>  
		<input type="hidden" id="ski_date" name="ski_date">
		<input type="hidden" id="ski_count" name="ski_count">
		<input type="hidden" id="ski_price" name="ski_price">											
										
		<div class="container">
		    <div class="row">	
				<div class="totalbox">
					<div id="box1">
						<div class="stepbox">
					       <br>
			                <h3>step 1</h3>
			               	<h4>날짜 선택</h4>
					    </div>
				        <div class="selectbox">
							<div id="multipick" class="multipickchange"></div>
							<div id="a"></div>
						</div>
					</div><!-- box1 -->
					<div id="box2">
						<div class="stepbox">
							<br>
							<h3>step 2</h3>
							<h4>스키권 선택</h4>
						</div>
						<div class="selectbox">
							<div id="skicntbox">              
								<div id="skidate0">
									<div class="date" id="date0">
									</div>
									<div class="__count_range">
										오전권 (20,000) &nbsp;&nbsp;
										<input class="ran" id="mran2_0" type="button" value="-" count_range="m" >
										<input class="count" id="cnt2_0" value="${re.get(0).ski_morning}" readonly name="">
										<input class="ran" id="pran2_0" type="button" value="+" count_range="p" >
									</div>
									<div class="__count_range">
										야간권 (30,000)&nbsp;&nbsp;&nbsp;
										<input class="ran" id="mran4_0" value="-" count_range="m" type="button">
										<input class="count" id="cnt4_0" value="${re.get(0).ski_night}" readonly name="">
										<input class="ran" id="pran4_0" value="+" count_range="p" type="button">
									</div>
									<div class="__count_range">
										종일권 (40,000)&nbsp;&nbsp;&nbsp;
										<input class="ran" id="mran8_0" value="-" count_range="m" type="button">
										<input class="count" id="cnt8_0" value="${re.get(0).ski_day}" readonly name="">
										<input class="ran" id="pran8_0" value="+" count_range="p" type="button">
									</div>
								</div> <!-- skidate0 -->
								<div id="skidate1">
									<div class="date" id="date1">
										
									</div>
									<div class="__count_range">
										오전권 (20,000) &nbsp;&nbsp;
										<input class="ran" id="mran2_1" type="button" value="-" count_range="m" >
										<input class="count" id="cnt2_1" value="${ski_2_1}" readonly name="">
										<input class="ran" id="pran2_1" type="button" value="+" count_range="p" >
									</div>
									<div class="__count_range">
										야간권 (30,000)&nbsp;&nbsp;&nbsp;
										<input class="ran" id="mran4_1" value="-" count_range="m" type="button">
										<input class="count" id="cnt4_1" value="${ski_4_1}" readonly name="">
										<input class="ran" id="pran4_1" value="+" count_range="p" type="button">
									</div>
									<div class="__count_range">
										종일권 (40,000)&nbsp;&nbsp;&nbsp;
										<input class="ran" id="mran8_1" value="-" count_range="m" type="button">
										<input class="count" id="cnt8_1" value="${ski_8_1}" readonly name="">
										<input class="ran" id="pran8_1" value="+" count_range="p" type="button">
									</div>
								</div><!-- skidate1 -->
							
								<div id="skidate2">
									<div class="date" id="date2">
										
									</div>
									<div class="__count_range">
										오전권 (20,000) &nbsp;&nbsp;
										<input class="ran" id="mran2_2" type="button" value="-" count_range="m" >
										<input class="count" id="cnt2_2" value="${ski_2_2}" readonly name="">
										<input class="ran" id="pran2_2" type="button" value="+" count_range="p" >
									</div>
									<div class="__count_range">
										야간권 (30,000)&nbsp;&nbsp;&nbsp;
										<input class="ran" id="mran4_2" value="-" count_range="m" type="button">
										<input class="count" id="cnt4_2" value="${ski_4_2}" readonly name="">
										<input class="ran" id="pran4_2" value="+" count_range="p" type="button">
									</div>
									<div class="__count_range">
										종일권 (40,000)&nbsp;&nbsp;&nbsp;
										<input class="ran" id="mran8_2" value="-" count_range="m" type="button">
										<input class="count" id="cnt8_2" value="${ski_8_2}" readonly name="">
										<input class="ran" id="pran8_2" value="+" count_range="p" type="button">
									</div>
								</div> <!-- skidate2 -->                    
								<br>            		                  
								<div id="skipricemention">총 가격 : &nbsp; </div> 
								<div id="skipricebox"> ${re.get(0).ski_price} </div> 
								<br><br>
								
							</div> <!-- skicntbox -->
						</div> <!-- selectbox -->
					</div> <!-- box2 -->
		            <div id="box3">
		               <div class="stepbox">
							<br>
							<h3>step3</h3>
							<h4>세부사항입력</h4>
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
		            </div><!-- box3 -->
		         </div> <!-- totalbox -->
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
						<td> 날짜 </td>
						<td> 오전권 </td>
						<td> 야간권 </td>
						<td> 종일권 </td>
					</tr>
					<tr id="skiski_0">
						<th id="ski_date_0">  
						</th>
						<td id="ski2_0"> ${re.get(0).ski_morning} </td>
						<td id="ski4_0"> ${re.get(0).ski_night} </td>
						<td id="ski8_0"> ${re.get(0).ski_day} </td>
					</tr>			
					<tr id="skiski_1">
						<th id="ski_date_1">  
						</th>
						<td id="ski2_1"> ${ski2_1} </td>
						<td id="ski4_1"> ${ski4_1} </td>
						<td id="ski8_1"> ${ski8_1} </td>
					</tr>			
					<tr id="skiski_2">
						<th id="ski_date_2">                       
						</th>
						<td id="ski2_2"> ${ski2_2} </td>
						<td id="ski4_2"> ${ski4_2} </td>
						<td id="ski8_2"> ${ski8_2} </td>
					</tr>			
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
		</div>
		
		</form>
		<div id="result"></div>
		<div id="result2"></div>
		<div id="result3"></div>
		<div id="result4"></div>
		<div id="fmtdate">
			<div id="fmtdate1">
				<fmt:formatDate value="${re.get(0).ski_date}"
					type="both" pattern="yyyy-MM-dd"/>
			</div>
			<div id="fmtdate2">
			<c:if test="${cnt > 1}">
				<fmt:formatDate value="${re.get(1).ski_date}"
					type="both" pattern="yyyy-MM-dd"/>
			</c:if>
			</div>
			<div id="fmtdate3">
			<c:if test="${cnt > 2}">	
				<fmt:formatDate value="${re.get(2).ski_date}"
					type="both" pattern="yyyy-MM-dd"/>
			</c:if>
			</div>
		</div>
	</body>
</html>  
    
