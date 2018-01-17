<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:set var="cnt" value="0"/> 
<c:set var="result" value="0"/>

<c:if test="${param.room_time == 'room_2'}">
	<sql:query var="rs" dataSource="jdbc/kh">
		select room_2 from wp_roomcheck where room_date=TO_DATE(?,'YYYYMMDD')
		<sql:param value="${param.room_date}"/>
	</sql:query>
	<c:forEach var="r" items="${rs.rows}">
		<c:set var="cnt" value="${r.room_2}" />
	</c:forEach>	
	<c:if test="${param.room_check == '1'}">
		<c:if test="${cnt > 0}">
			<sql:update var="re" dataSource="jdbc/kh">
				update wp_roomcheck set room_2 = room_2-1 where room_date=TO_DATE(?,'YYYYMMDD')
				<sql:param value="${param.room_date}"/>
			</sql:update>
		</c:if>
		<c:if test="${cnt == 0}">
			<c:set var="result" value="1"/>
		</c:if>
	</c:if>			
	<c:if test="${param.room_check == '2'}">		
		<sql:update var="re" dataSource="jdbc/kh">
			update wp_roomcheck set room_2 = room_2+1 where room_date=TO_DATE(?,'YYYYMMDD')
			<sql:param value="${param.room_date}"/>
		</sql:update>
	</c:if>
</c:if> 

<c:if test="${param.room_time == 'room_4'}">
	<sql:query var="rs" dataSource="jdbc/kh">
		select room_4 from wp_roomcheck where room_date=TO_DATE(?,'YYYYMMDD')
		<sql:param value="${param.room_date}"/>
	</sql:query>
	<c:forEach var="r" items="${rs.rows}">
		<c:set var="cnt" value="${r.room_4}" />
	</c:forEach>	
	<c:if test="${param.room_check == '1'}">
		<c:if test="${cnt > 0}">
			<sql:update var="re" dataSource="jdbc/kh">
				update wp_roomcheck set room_4 = room_4-1 where room_date=TO_DATE(?,'YYYYMMDD')
				<sql:param value="${param.room_date}"/>
			</sql:update>
		</c:if>
		<c:if test="${cnt == 0}">
			<c:set var="result" value="1"/>
		</c:if>
	</c:if>			
	<c:if test="${param.room_check == '2'}">		
		<sql:update var="re" dataSource="jdbc/kh">
			update wp_roomcheck set room_4 = room_4+1 where room_date=TO_DATE(?,'YYYYMMDD')
			<sql:param value="${param.room_date}"/>
		</sql:update>
	</c:if>
</c:if> 

<c:if test="${param.room_time == 'room_8'}">
	<sql:query var="rs" dataSource="jdbc/kh">
		select room_8 from wp_roomcheck where room_date=TO_DATE(?,'YYYYMMDD')
		<sql:param value="${param.room_date}"/>
	</sql:query>
	<c:forEach var="r" items="${rs.rows}">
		<c:set var="cnt" value="${r.room_8}" />
	</c:forEach>	
	<c:if test="${param.room_check == '1'}">
		<c:if test="${cnt > 0}">
			<sql:update var="re" dataSource="jdbc/kh">
				update wp_roomcheck set room_8 = room_8-1 where room_date=TO_DATE(?,'YYYYMMDD')
				<sql:param value="${param.room_date}"/>
			</sql:update>	
		</c:if>
		<c:if test="${cnt == 0}">
			<c:set var="result" value="1"/>
		</c:if>
	</c:if>			
	<c:if test="${param.room_check == '2'}">		
		<sql:update var="re" dataSource="jdbc/kh">
			update wp_roomcheck set room_8 = room_8+1 where room_date=TO_DATE(?,'YYYYMMDD')
			<sql:param value="${param.room_date}"/>
		</sql:update>
	</c:if>
</c:if> 

<data>
	<c:if test="${result == 0}">
		<c:if test="${re == 1}">
			<code>success</code>
			<content>${cnt},${re},${result}</content>
		</c:if>
		<c:if test="${re == 0}">
			<code>fail</code>
		</c:if>
	</c:if>	
	<c:if test="${result == 1}">
		<code>s</code>
	</c:if>
</data>