<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %> 

  
<sql:query var="rs" dataSource="jdbc/kh">
	select * from wp_member where num=0
</sql:query>

<members>
	<code>success</code>
	<data>
		{
			member : [
				<c:forEach var="row" items="${rs.rows}">
					{
						id : "${row.id}",
						passwd : "${row.passwd}",
						name : "${row.name}",
						tel : "${row.tel}",
						email : "${row.email}",
						ban : "${row.ban}"
					},
				</c:forEach>
			]
		}
	</data>
</members>