<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<c:set var="cnt" value="0"/>

<sql:query var="re" dataSource="jdbc/kh">
	select count(ski_date) from wp_skicheck where ski_morning+ski_night+ski_day >= 12
</sql:query>

<c:forEach var="result" items="${re.rowsByIndex}">
	<c:if test="${result[0] != 0}">
      <c:set var="cnt" value="${result[0]}"/>
    </c:if>
</c:forEach>

<sql:query var="rs" dataSource="jdbc/kh">
	select ski_date from wp_skicheck where ski_morning+ski_night+ski_day >= 12
</sql:query>

<data>
	<c:if test="${cnt != 0}">
		<code>success</code>
		<dates>
			{
				ski : 
				[
				<c:forEach var="row" items="${rs.rows}">
				 	{
				 		ski_date :"${row.ski_date}"
				 	},
				</c:forEach>	
				]
			}
		</dates>
	</c:if>
	<c:if test="${cnt == 0}">
		<code>fail</code>
	</c:if>
</data>
