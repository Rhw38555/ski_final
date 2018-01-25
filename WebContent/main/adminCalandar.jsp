<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<HEAD>
       <TITLE>캘린더</TITLE>
       <meta http-equiv="content-type" content="text/html; charset=utf-8">
       <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
       <script src="/SKI_Final/jquery-3.2.1.js"></script>
       <script type="text/javaScript" language="javascript">
       google.charts.load('current', {'packages':['corechart']});
       google.charts.setOnLoadCallback(drawChartRoom);
       google.charts.setOnLoadCallback(drawChartSki);
       
       function drawChartRoom() {
    	 var room2 = parseInt('${chartroom2}');
    	 var room4 = parseInt('${chartroom4}');
    	 var room8 = parseInt('${chartroom8}');
     	  
         var data = google.visualization.arrayToDataTable([
           ['구분', '개수'],
           ['2인실', room2 ],
           ['4인실', room4 ],
           ['8인실', room8 ]
         ]);

         var options = {
           title: "${monthplus}" + '월 room 예약 현황'
         };

         var chart = new google.visualization.PieChart(document.getElementById('roomchart'));

         chart.draw(data, options);
       }
       
       function drawChartSki() {
    	  var ski_morning = parseInt('${chartski_morning}');
    	  var ski_night = parseInt('${chartski_night}');
    	  var ski_day = parseInt('${chartski_day}');
     	 
     	  var data = google.visualization.arrayToDataTable([
               ['구분', '개수'],
               ['주간권', ski_morning ],
               ['야간권', ski_night ],
               ['종일권', ski_day ]
             ]);

             var options = {
               title: "${monthplus}" + '월 ski 예약 현황'
             };

             var chart = new google.visualization.PieChart(document.getElementById('skichart'));

             chart.draw(data, options);
     	  
       }

       /* 레이어 팝업 */
       /* 
       $('document').ready(
    	function() {
    		$('.layerPopup').click(function(){
    	           var $href = $('.layerPopup').attr('href');
    	           layer_popup($href);
    	           alert( $href );
    	    });
    	});
        */
        
       /*  
       $(document).on(
               'onclick','.layerPopup',
               function(event) {
            	   alert( 'abcd11' );

               }
                        
               );
        */
        
       </script>
       <style TYPE="text/css">
             body {
             scrollbar-face-color: #F6F6F6;
             scrollbar-highlight-color: #bbbbbb;
             scrollbar-3dlight-color: #FFFFFF;
             scrollbar-shadow-color: #bbbbbb;
             scrollbar-darkshadow-color: #FFFFFF;
             scrollbar-track-color: #FFFFFF;
             scrollbar-arrow-color: #bbbbbb;
             margin-left:"0px"; margin-right:"0px"; margin-top:"0px"; margin-bottom:"0px";
             }
 
             td {font-family: "돋움"; font-size: 9pt; color:#595959;}
             th {font-family: "돋움"; font-size: 9pt; color:#000000;}
             select {font-family: "돋움"; font-size: 9pt; color:#595959;}
 
 
             .divDotText {
             overflow:hidden;
             text-overflow:ellipsis;
             }
 
            A:link { font-size:9pt; font-family:"돋움";color:#000000; text-decoration:none; }
            A:visited { font-size:9pt; font-family:"돋움";color:#000000; text-decoration:none; }
            A:active { font-size:9pt; font-family:"돋움";color:red; text-decoration:none; }
            A:hover { font-size:9pt; font-family:"돋움";color:red;text-decoration:none;}
       </style>
</HEAD>
<body>
	<form name="calendarForm" id="calendarForm" action="" method="post">
		<div id="content" style="width:100%;">
			<table width="100%"	border="0" cellspacing="1" cellpadding="1">
				<tr>
					<td align="right">
						<input type="button" value="오늘" onclick="location='adminCalandar.do'">
					</td>
				</tr>
			</table>
			<!-- 날짜 네비게이션 -->
			<table width="100%" border="0" cellspacing="1" cellpadding="1" id="navi" bgcolor="#F3F9D7" style="border:1px solid #CED99C">
				<tr>
					<td height="60">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="10">
								</td>
							</tr>
							<tr>
								<td align="center">
									<a href="adminCalandar.do?year=${yearminus}&amp;month=${month}" target="_self">
										<b>&lt;&lt;</b><!-- 이전 해 -->
									</a>
									<c:if test="${month > 0}">
										<a href="adminCalandar.do?year=${year}&amp;month=${monthminus}" target="_self">
											<b>&lt;</b><!-- 이전 달 -->
										</a>
									</c:if>
									<c:if test="${month < 0}">
										<b>&lt;</b>
									</c:if>
									&nbsp;&nbsp;
									${year}년
									
									${month+1}월
									&nbsp;&nbsp;
									<c:if test="${month < 11}">
										<a href="adminCalandar.do?year=${year}&amp;month=${monthplus}" target="_self">
											<!-- 다음달 --><b>&gt;</b>
										</a>
									</c:if>
									<c:if test="${month > 11}">	
										<b>&gt;</b>
									</c:if>
									<a href="adminCalandar.do?year=${yearplus}&amp;month=${month}" target="_self">
										<!-- 다음해 --><b>&gt;&gt;</b>
									</a>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<br>
			<table width="100%" border="0" cellspacing="1" cellpadding="1" bgcolor="#FFFFFF">
				<thead>
					<tr bgcolor="#CECECE">
						<td width="14%">
							<div align="center">
								<font color="red">일</font>
							</div>
						</td>
						<td width="14%">
							<div align="center">
								월
							</div>
						</td>
						<td width="14%">
							<div align="center">
								화
							</div>
						</td>
						<td width="14%">
							<div align="center">
								수
							</div>
						</td>
						<td width="14%">
							<div align="center">
								목
							</div>
						</td>
						<td width="14%">
							<div align="center">
								금
							</div>
						</td>
						<td width="14%">
							<div align="center">
								<font color="#529dbc">토</font>
							</div>
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
					<!-- 최초 빈공간 표시 -->
					<c:set var="newLine" value="${newLine}"/>
					<c:forEach begin="${start}" end="${startDay}">
						<td>
							&nbsp;
							<c:set var="newLine" value="${newLine+1}"/>
						</td>
					</c:forEach>
					<!-- 일 출력 -->
					<c:set var="t" value="1"/>
					<c:forEach begin="${startDay}" end="${endDay}">
						
						<fmt:formatNumber value="${monthplus}" var="mp"/>
						<fmt:formatNumber value="${t}" var="i"/>
						<c:set var="room2" value="0"/>
						<c:set var="room4" value="0"/>
						<c:set var="room8" value="0"/>
						<c:set var="ski_morning" value="0"/>
						<c:set var="ski_night" value="0"/>
						<c:set var="ski_day" value="0"/>
						<c:set var="color" value=""/>
						<c:if test="${newLine == 0}">
							<c:set var="color" value="RED"/>
						</c:if>
						<c:if test="${newLine == 6}">
							<c:set var="color" value="#529DBC"/>
						</c:if>
						<c:if test="${newLine >= 1 && newLine <= 5}">
							<c:set var="color" value="BLACK"/>
						</c:if>
						<c:set var="sUseDate" value="${year}"/>

						<c:set var="zero" value="0"/>
						
						<c:if test="${fn:length(mp) == 1}">
							<c:set var="sUseDate" value="${sUseDate}${zero}${mp}"/>
						</c:if>
						<c:if test="${fn:length(mp) != 1}">
							<c:set var="sUseDate" value="${sUseDate}${mp}"/>
						</c:if>
						<c:if test="${fn:length(i) == 1}">
							<c:set var="sUseDate" value="${sUseDate}${zero}${i}"/>
						</c:if>
						<c:if test="${fn:length(i) != 1}">
							<c:set var="sUseDate" value="${sUseDate}${i}"/>
						</c:if>
						<c:set var="iUseDate" value="${sUseDate}"/>
						<c:set var="tempDate" value="${fn:substring(sUseDate, 4, 8)}"/>
						<c:set var="tempDate" value="${tempDate}${year}"/>
						
						<c:set var="backColor" value="#EFEFEF"/>
						<c:if test="${iUseDate == intToday}">
							<c:set var="backColor" value="#C9C9C9"/>
						</c:if>
						<c:forEach var="rDto" items="${roomDto}">
							<fmt:formatDate var="tdate" value="${rDto.room_date}" pattern="MM/DD/YYYY"/>
							<c:set var="rdate" value="${fn:split(tdate, '/')[1]}"/>
							<c:if test="${rdate == t}">
								<c:if test="${rDto.room_2 != 0}">
									<c:set var="room2" value="${room2+rDto.room_2}"/>
								</c:if>
								<c:if test="${rDto.room_4 != 0}">
									<c:set var="room4" value="${room4+rDto.room_4}"/>
								</c:if>
								<c:if test="${rDto.room_8 != 0}">
									<c:set var="room8" value="${room8+rDto.room_8}"/>
								</c:if>
							</c:if>
						</c:forEach>
						<c:forEach var="sDto" items="${skiDto}">
							<fmt:formatDate var="tdate" value="${sDto.ski_date}" pattern="MM/DD/YYYY"/>
							<c:set var="sdate" value="${fn:split(tdate, '/')[1]}"/>
							<c:if test="${sdate == t}">
								<c:if test="${sDto.ski_morning != 0}">
									<c:set var="ski_morning" value="${ski_morning + sDto.ski_morning}"/>
								</c:if>
								<c:if test="${sDto.ski_night != 0}">
									<c:set var="ski_night" value="${ski_night + sDto.ski_night}"/>
								</c:if>
								<c:if test="${sDto.ski_day != 0}">
									<c:set var="ski_day" value="${ski_day + sDto.ski_day}"/>
								</c:if>
							</c:if>
						</c:forEach>
						
						<td valign="top" align="left" height="90px"
						bgcolor="${backColor}" nowrap>
							<font color="${color}">
								<b>${t}</b>
								<br>
							</font>
							
							<c:if test="${room2 == 0}">
							</c:if>
							<c:if test="${room2 != 0}">
							2인실 : <b>${room2}</b>
							</c:if>
							
							<br>
							
							<c:if test="${room4 == 0}">
							</c:if>
							<c:if test="${room4 != 0}">
							4인실 : <b>${room4}</b>
							</c:if>
							
							<br>
							
							<c:if test="${room8 == 0}">
							</c:if>
							<c:if test="${room8 != 0}">
							8인실 : <b>${room8}</b>
							</c:if>
							
							<br>
							
							<br>
							<c:if test="${ski_morning == 0}">
							</c:if>
							<c:if test="${ski_morning != 0}">
								ski 주간권 : <b>${ski_morning}</b>
							</c:if>
							<br>
							<c:if test="${ski_night == 0}">
							</c:if>
							<c:if test="${ski_night != 0}">
								ski 야간권 : <b>${ski_night}</b>
							</c:if>
							<br>
							 
							<c:if test="${ski_day == 0}">
							</c:if>
							<c:if test="${ski_day != 0}">
								ski 종일권 : <b>${ski_day}</b>
							</c:if>
						</td>
						<c:set var="newLine" value="${newLine+1}"/>
						<c:if test="${newLine == 7}">
							</tr>
							<c:if test="${i <= endDay}">
								<tr>
							</c:if>
							<c:set var="newLine" value="0"/>
						</c:if>
						<c:set var="t" value="${t+1}"/>
					</c:forEach>
					<!-- 일 출력 끝 -->
					<c:forEach begin="${newLine}" end="7">
						<td>&nbsp;</td>
						<c:set var="newLine" value="${newLine}+1"/>
					</c:forEach>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
	<hr>
	<div id="roomchart">
	</div>
	<div id="skichart">
	</div>
</body>
</html>