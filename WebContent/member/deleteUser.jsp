<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %> 

<sql:update var="result" dataSource="jdbc/kh">
	delete from wp_member where id=?
	<sql:param value="${param.id}"/>
</sql:update>
  

<c:if test="${result==1 }">

<members>
	<code>success</code>
</members>
</c:if>
<c:if test="${result==0}">
</c:if>