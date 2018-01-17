<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<sql:update var="rs" dataSource="jdbc/kh">
	update wp_roomcheck set room_2=room_2-?, 
		room_4=room_4-?, room_8=room_8-? where room_date=TO_DATE(?,'YYYYMMDD')
	 <sql:param value="${param.room_2}"/>
	 <sql:param value="${param.room_4}"/>
	 <sql:param value="${param.room_8}"/>
	 <sql:param value="${param.room_date}"/>
</sql:update>

<data>
	<c:if test="${rs == 1}">
		<code>success</code>
	</c:if>
	<c:if test="${rs != 1}">
		<code>fail</code>
	</c:if>
</data>
