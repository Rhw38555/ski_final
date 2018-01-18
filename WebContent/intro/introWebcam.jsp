<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="setting.jsp" %>
 
<%@include file="/include/mainheader.jsp" %>
<%@include file="/include/mainnav.jsp" %>
<%@include file="/include/introaside.jsp" %> 

<h2> 실시간 웹캠 </h2>

<p><embed style="width: 480px; height: 380px;" 
title="동영상 프레임" type="application/x-shockwave-flash" 
src="/SKI_Final/intro/show1.swf" allowhtmlpopupwindow="false" enablehtmlaccess="false" 
allownetworking="internal" allowscriptaccess="never" invokeurls="false" autostart="false">
</p> 
<p><embed style="width: 480px; height: 380px;" 
title="동영상 프레임" type="application/x-shockwave-flash" 
src="/SKI_Final/intro/show2.swf" allowhtmlpopupwindow="false" enablehtmlaccess="false" 
allownetworking="internal" allowscriptaccess="never" invokeurls="false" autostart="false">
</p> 
<p><embed style="width: 480px; height: 380px;" 
title="동영상 프레임" type="application/x-shockwave-flash" 
src="/SKI_Final/intro/show3.swf" allowhtmlpopupwindow="false" enablehtmlaccess="false" 
allownetworking="internal" allowscriptaccess="never" invokeurls="false" autostart="false">
</p> 
<input type="button" value="레몬탑승장" onclick="lemon()">
<input type="button" value="오렌지탑승장" onclick="orange()">
<input type="button" value="뉴오렌지탑승장" onclick="neworange()">
<input type="button" value="블루탑승장" onclick="blue()">
<input type="button" value="실버탑승장" onclick="silver()">
