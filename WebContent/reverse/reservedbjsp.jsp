<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<sql:query var="rs" dataSource="jdbc/kh">
   
</sql:query>

<users>
   <c:forEach var="row" items="${rs.rows}">
      <user>
         <id>${row.id}</id>
         <passwd>${row.passwd}</passwd>
         <name>${row.name}</name>
         <tel>${row.tel}</tel>
         <logtime>${row.logtime}</logtime>
      </user>
   </c:forEach>
</users>