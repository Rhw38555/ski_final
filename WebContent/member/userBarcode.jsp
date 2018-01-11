<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %> 

    
    
<sql:query var="rs" dataSource="jdbc/kh">
	select * from wp_user_barcodes where user_barcode =?
	<sql:param value="${param.value}"/>
</sql:query>

<members>
	<code>success</code>
	<data>
		{
			member : [
				<c:forEach var="row" items="${rs.rows}">
					{
						user_barcode  : "${row.user_barcode}",
						wallet : "${row.wallet}"
					},
				</c:forEach>
			]
		}
		
	</data>
</members>