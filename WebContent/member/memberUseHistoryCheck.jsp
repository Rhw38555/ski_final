<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %> 

    
    
<sql:query var="rs" dataSource="jdbc/kh">
	select * from WP_useHistory where user_barcode=?
	<sql:param value="${param.value}"/>
</sql:query>

<members>
	<code>success</code>
	<data>
		{
			member : [
				<c:forEach var="row" items="${rs.rows}">
					{
						receipt_barcode : "${row.receipt_barcode}",
						user_barcode : "${row.user_barcode}",
						product_barcode : "${row.product_barcode}",
						product_name : "${row.product_name}",
						product_price : "${row.product_price}",
						product_count : "${row.product_count}",
						maket : "${row.maket}",
						buydate : "${row.buydate}"
					},
				</c:forEach>
			]
		}
		
	</data>
</members>