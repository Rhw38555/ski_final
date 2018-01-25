<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %> 

    
    
<sql:query var="rs" dataSource="jdbc/kh">
	select * from WP_roomreserve where id=?
	<sql:param value="${param.value}"/>
</sql:query>

<sql:query var="rs2" dataSource="jdbc/kh">
	select * from WP_skireserve where id=?
	<sql:param value="${param.value}"/>
</sql:query>

<members>
	<code>success</code>
	<data>
		{
			member : [
				<c:forEach var="row" items="${rs.rows}">
					{
						id : "${row.id}",
						reg_date : "${row.reg_date}",
						room_date : "${row.room_date}",
						room_2 : "${row.room_2}",
						room_4 : "${row.room_4}",
						room_8 : "${row.room_8}",
						name : "${row.name}",
						tel : "${row.tel}",
						carnum : "${row.carnum}",
						room_price : "${row.room_price}",
						room_check : "${row.room_check}",
						num : "${row.num}"
					},
				</c:forEach>
			],
			member2 : [
				<c:forEach var="row2" items="${rs2.rows}">
					{
						id : "${row2.id}",
						reg_date : "${row2.reg_date}",
						ski_date : "${row2.ski_date}",
						ski_morning : "${row2.ski_morning}",
						ski_night : "${row2.ski_night}",
						ski_day : "${row2.ski_day}",
						name : "${row2.name}",
						tel : "${row2.tel}",
						carnum : "${row2.carnum}",
						ski_price : "${row2.ski_price}",
						num : "${row2.num}"
					},
				</c:forEach>
			]
			
		}
		
	</data>
</members>