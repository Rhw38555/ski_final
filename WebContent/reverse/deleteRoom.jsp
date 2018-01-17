<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<sql:update var="cnt" dataSource="jdbc/kh">
	delete from wp_roomreserve where num=? and room_date=TO_DATE(?,'YYYY-MM-DD')
	<sql:param value="${param.num}"/>
	<sql:param value="${param.room_date}"/>
</sql:update>

<data>
	<c:if test="${cnt != 0}">
		<code>success</code>
	</c:if>
	<c:if test="${cnt == 0}">
		<code>fail</code>
	</c:if>
</data>