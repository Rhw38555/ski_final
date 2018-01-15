<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<HEAD>
       <TITLE>캘린더</TITLE>

       <meta http-equiv="content-type" content="text/html; charset=utf-8">
       <script type="text/javaScript"> 

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
<BODY>

<form name="calendarFrm" id="calendarFrm" action="" method="post">

	<DIV id="content" style="width:712px;">
	<table width="100%" border="0" cellspacing="1" cellpadding="1">
		<tr>
       		<td align ="right">
				<input type="button" onclick="javascript:location.href='<c:url value='/CalendarExam2.do' />'" value="오늘"/>
			</td>
		</tr>
</table>

<!--날짜 네비게이션  -->
<table width="100%" border="0" cellspacing="1" cellpadding="1" id="KOO" bgcolor="#F3F9D7" style="border:1px solid #CED99C">
	<tr>
		<td height="60">
       <table width="100%" border="0" cellspacing="0" cellpadding="0">
       		<tr>
				<td height="10">
	
				</td>
       		</tr>
      		<tr>
				<td align="center" >
					<a href="<c:url value='/CalendarExam2.do' />?year=${year-1}&amp;month=${month}" target="_self">
						<b>&lt;&lt;</b><!-- 이전해 -->
					</a>
					<c:if test="${month > 0}">                    
                    <a href="<c:url value='/CalendarExam2.do' />?year=${year}&amp;month=${month-1}" target="_self">
                           <b>&lt;</b><!-- 이전달 -->
                    </a>
                    </c:if>
                    <c:if test="${month <= 0}">
                           <b>&lt;</b>
                    </c:if>
                    &nbsp;&nbsp;
                    ${year}년                
                    ${month+1}월
                    &nbsp;&nbsp;
                    <c:if test="${month < 11}">
                    	<a href="<c:url value='/CalendarExam2.do' />?year=${year}&amp;month=${month+1}" target="_self">
                           <!-- 다음달 --><b>&gt;</b>
                    	</a> 	
                    </c:if>
                    <c:if test="${month >= 11}">
                    	<b>&gt;</b>
                    </c:if>
                    
                    <a href="<c:url value='/CalendarExam2.do' />?year=${year+1}&amp;month=${month}" target="_self">
                           <!-- 다음해 --><b>&gt;&gt;</b>
                    </a>
             </td>
       </tr>
       </table>
</td>
</tr>
</table>
<br>
<table border="0" cellspacing="1" cellpadding="1" bgcolor="#FFFFFF">
<THEAD>
<TR bgcolor="#CECECE">
       <TD width='100px'>
       <DIV align="center"><font color="red">일</font></DIV>
       </TD>
       <TD width='100px'>
       <DIV align="center">월</DIV>
       </TD>
       <TD width='100px'>
       <DIV align="center">화</DIV>
       </TD>
       <TD width='100px'>
       <DIV align="center">수</DIV>
       </TD>
       <TD width='100px'>
       <DIV align="center">목</DIV>
       </TD>
       <TD width='100px'>
       <DIV align="center">금</DIV>
       </TD>
       <TD width='100px'>
       <DIV align="center"><font color="#529dbc">토</font></DIV>
       </TD>
</TR>
</THEAD>
<TBODY>
<TR>

<!-- 처음 빈공란 표시 -->
<c:forEach var="i" begin="1" end="${start}">
	<td>&nbsp;</td>
	<c:set var="newLine" value="${newLine+1}"/>
</c:forEach>

<c:forEach var="i" begin="1" end="${endDay+1}">
	<c:set var="color" value=""/>
	<c:if test="${newLine == 0}">
		<c:set var="color" value="RED"/>
	</c:if>
	<c:if test="${newLine == 6}">
		<c:set var="color" value="#529dbc"/>
	</c:if>
	<c:if test="${newLine != 0 and newLine !=6}">
		<c:set var="color" value="BLACK"/>
	</c:if>
	
	<c:set var="sUseDate" value="${year}"/>
	<c:set var="month" value="${month}"/>
	
	<c:if test="${fn:length(month+1)==1}">
		<c:set var="sUseDate" value="${sUseDate}0${month+1}"/>	
	</c:if>
	<c:if test="${fn:length(month+1)!=1}">
		<c:set var="sUseDate" value="${sUseDate}${month+1}"/>	
	</c:if>
	
	<c:if test="${fn:length(i+1)==1}">
		<c:set var="sUseDate" value="${sUseDate}0${i}"/>	
	</c:if>
	<c:if test="${fn:length(i+1)!=1}">
		<c:set var="sUseDate" value="${sUseDate}${i}"/>	
	</c:if>
	
	<c:set var="iUseDate" value="${sUseDate}"/>
	<c:set var="backColor" value="#EFEFEF"/>
	<c:set var="intToday" value="${intToday}"/>
	<c:if test="${iUseDate == intToday}">
		<c:set var="backColor" value="#c9c9c9"/>
	</c:if>
	<TD valign='top' align='left' height='92px' bgcolor='"+${backColor}+"' nowrap>
	
	<font color="${color}">
	${i}
	</font>
	<br>
	${iUseDate}
	<br>
	</TD>
	<c:set var="newLine" value="${newLine+1}"/>
	<c:if test="${newLine == 7}">
		</tr>
		<c:set var="endDay" value="${endDay}"/>
		<c:if test="${i <= endDay}">
			<tr>
		</c:if>
		<c:set var="newLine" value="${0}"/>
	</c:if>
</c:forEach>

<c:if test="${newLine > 0 and newLine < 7}">
	<c:forEach var="i" begin="0" end="7">
		<TD>&nbsp;</TD>
		<c:set var="newLine" value="${newLine+1}"/>
	</c:forEach>
</c:if>

</TR>
</TBODY>
</TABLE>
</DIV>
</form>
</BODY>
</HTML>