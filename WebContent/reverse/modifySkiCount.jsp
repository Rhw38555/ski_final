<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<sql:update var="rs" dataSource="jdbc/kh">
	update wp_skicheck set ski_morning=ski_morning-?, 
		ski_night=ski_night-?, ski_day=ski_day-? where ski_date=TO_DATE(?,'YYYYMMDD')
	 <sql:param value="${param.ski_morning}"/>
	 <sql:param value="${param.ski_night}"/>
	 <sql:param value="${param.ski_day}"/>
	 <sql:param value="${param.ski_date}"/>
</sql:update>

<data>
	<c:if test="${rs == 1}">
		<code>success</code>
	</c:if>
	<c:if test="${rs != 1}">
		<code>fail</code>
	</c:if>
</data>
