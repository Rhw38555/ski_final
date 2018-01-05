<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="rs" dataSource="jdbc/kh">
	select count(*) from WP_member where id=?
	<sql:param value="${param.id}"/>
</sql:query>
<c:forEach var="row" items="${rs.rowsByIndex}">
	<c:if test="${row[0] == 0}">
		<font color="blue">${param.id}는 사용할 수 있습니다.</font>
	</c:if>
	<c:if test="${row[0] != 0}">
		<font color="red">${param.id}는 사용할 수 없습니다.</font>
	</c:if>
</c:forEach>
