<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %> 

    
<!-- 상품정보 가져오기 -->
<sql:query var="rs" dataSource="jdbc/kh">
	select * from wp_product_barcodes where product_barcode=?
	<sql:param value="${param.value}"/>
</sql:query>

<members>
	<code>success</code>
	<data>
		{
			member : [
				<c:forEach var="row" items="${rs.rows}">
					{
						product_barcode : "${row.product_barcode}",
						product_name : "${row.product_name}",
						price : "${row.price}",
						maket : "${row.maket}"
					},
				</c:forEach>
			]
		}
		
	</data>
</members>