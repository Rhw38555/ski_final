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
      <script src="/SKI_Final/reverse/jquery.js"></script>     
      <script src="/SKI_Final/reverse/reserveRoomChange.js"></script>   
	  <script src="/SKI_Final/reverse/request.js"></script>
	  <script src="/SKI_Final/reverse/jquery-ui.js"></script>	    
   </head>
   <script type="text/javascript">
	      
   </script>
   <c:set var="roomcheck" value="${fn:split( re.get(0).room_check, '/')}" />
   <c:set var="cnt" value="0"/>
   <c:forEach var="rs" items="${re}">
   		<c:set var="cnt" value="${cnt+1}"/>
   </c:forEach>
   <body>   
	   <form method="post" action="reverseChangeRoomPro.do" onsubmit="return finalcheck()">
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
	   	   
	      <!-- Datepicker -->
	      <div class="totalbox">
	         <div id="box1">
	            <div class="stepbox">
	               step 1<br>
	               날짜 선택
	            </div>
	            <div class="selectbox">
	               <div id="calbox">   
	                  <div id="datepicker1"></div>
	                  <div id="re">
							${roomcheck[0]}
	                  </div>
	               </div>   
	               <div id="calbox">      
	                  <div id="datepicker2"></div>
	                  <div id="re2">
	                  		${roomcheck[1]}
	                  </div>
	               </div>
	            </div>
	         </div>
	         <div id="box2">
	            <div class="stepbox">
	               step 2<br>
	               객실 선택
	            </div>
	            <div class="selectbox">
	               <div id="roomcntbox">              
	                  <div id="roomdate1">
	                  	<div class="date" id="date1">
							<fmt:formatDate value="${re.get(0).room_date}"
									type="both" pattern="yyyy-MM-dd"/>
	                  	</div>
		                  <div class="__count_range">
		                    2인실 (20,000) &nbsp;&nbsp;&nbsp;
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
	                  </div>
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
		                  	</div>
			                  <div class="__count_range">
			                    2인실 (20,000) &nbsp;&nbsp;&nbsp;
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
		                  </div>
	                 
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
		                  	</div>
			                  <div class="__count_range">
			                    2인실 (20,000) &nbsp;&nbsp;&nbsp;
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
		                  </div>	       
	                  <br>            		                  
		                          총 가격 : <div id="roompricebox">${re.get(0).room_price}</div>
	                  <br><br>
	               </div> <!-- roomcntbox -->
	            </div> <!-- selectbox -->
	         </div> <!-- box2 -->
	         <div id="box3">
	            <div class="stepbox">
	               step3<br>
	               세부사항입력
	            </div>
	            <div class="selectbox">
	            	<div id="textbox">
		               	*이용자명 <input type="text" id="name" name="name" placeholder="이름을 입력해주세요" 
		               		value="${re.get(0).name}" onkeyup="name_keyup()"> <br>
		               	*휴대폰번호 <input type="text" id="tel" name="tel" placeholder="-을 빼고 입력해주세요" 
		               		value="${re.get(0).tel}" onkeyup="tel_keyup()"> <br>
		               	차량번호 <input type="text" id="carnum" name="carnum" placeholder="차량번호를 입력해주세요" 
		               		value="${re.get(0).carnum}" onkeyup="carnum_keyup()"> <br>
	               	</div>
	            </div>
	         </div>
	      </div>
	      <div class="checkbox">
	         <table border="1">
	            <tr>
	               <th colspan="4">예약 정보</th>
	            </tr>
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
	            	</tr>
	            	
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
            		</tr>
	            	
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
	      </div>
      </form>
      <div id="result"></div>
      <div id="result2"></div>
      <div id="result3"></div>
      <div id="result4"></div>
   </body>
</html>