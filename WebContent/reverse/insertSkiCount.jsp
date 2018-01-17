<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:set var="cnt" value="0"/> 
<c:set var="result" value="0"/>

<c:if test="${param.ski_time == 'ski_morning'}">
	<sql:query var="rs" dataSource="jdbc/kh">
		select ski_morning from wp_skicheck where ski_date=TO_DATE(?,'YYYYMMDD')
		<sql:param value="${param.ski_date}"/>
	</sql:query>
	<c:forEach var="r" items="${rs.rows}">
		<c:set var="cnt" value="${r.ski_morning}" />
	</c:forEach>	
	<c:if test="${param.ski_check == '1'}">
		<c:if test="${cnt > 0}">
			<sql:update var="re" dataSource="jdbc/kh">
				update wp_skicheck set ski_morning = ski_morning-1 where ski_date=TO_DATE(?,'YYYYMMDD')
				<sql:param value="${param.ski_date}"/>
			</sql:update>
		</c:if>
		<c:if test="${cnt == 0}">
			<c:set var="result" value="1"/>
		</c:if>
	</c:if>			
	<c:if test="${param.ski_check == '2'}">		
		<sql:update var="re" dataSource="jdbc/kh">
			update wp_skicheck set ski_morning = ski_morning+1 where ski_date=TO_DATE(?,'YYYYMMDD')
			<sql:param value="${param.ski_date}"/>
		</sql:update>
	</c:if>
</c:if> 

<c:if test="${param.ski_time == 'ski_night'}">
	<sql:query var="rs" dataSource="jdbc/kh">
		select ski_night from wp_skicheck where ski_date=TO_DATE(?,'YYYYMMDD')
		<sql:param value="${param.ski_date}"/>
	</sql:query>
	<c:forEach var="r" items="${rs.rows}">
		<c:set var="cnt" value="${r.ski_night}" />
	</c:forEach>	
	<c:if test="${param.ski_check == '1'}">
		<c:if test="${cnt > 0}">
			<sql:update var="re" dataSource="jdbc/kh">
				update wp_skicheck set ski_night = ski_night-1 where ski_date=TO_DATE(?,'YYYYMMDD')
				<sql:param value="${param.ski_date}"/>
			</sql:update>
		</c:if>
		<c:if test="${cnt == 0}">
			<c:set var="result" value="1"/>
		</c:if>
	</c:if>			
	<c:if test="${param.ski_check == '2'}">		
		<sql:update var="re" dataSource="jdbc/kh">
			update wp_skicheck set ski_night = ski_night+1 where ski_date=TO_DATE(?,'YYYYMMDD')
			<sql:param value="${param.ski_date}"/>
		</sql:update>
	</c:if>
</c:if> 

<c:if test="${param.ski_time == 'ski_day'}">
	<sql:query var="rs" dataSource="jdbc/kh">
		select ski_day from wp_skicheck where ski_date=TO_DATE(?,'YYYYMMDD')
		<sql:param value="${param.ski_date}"/>
	</sql:query>
	<c:forEach var="r" items="${rs.rows}">
		<c:set var="cnt" value="${r.ski_day}" />
	</c:forEach>	
	<c:if test="${param.ski_check == '1'}">
		<c:if test="${cnt > 0}">
			<sql:update var="re" dataSource="jdbc/kh">
				update wp_skicheck set ski_day = ski_day-1 where ski_date=TO_DATE(?,'YYYYMMDD')
				<sql:param value="${param.ski_date}"/>
			</sql:update>	
		</c:if>
		<c:if test="${cnt == 0}">
			<c:set var="result" value="1"/>
		</c:if>
	</c:if>			
	<c:if test="${param.ski_check == '2'}">		
		<sql:update var="re" dataSource="jdbc/kh">
			update wp_skicheck set ski_day = ski_day+1 where ski_date=TO_DATE(?,'YYYYMMDD')
			<sql:param value="${param.ski_date}"/>
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

