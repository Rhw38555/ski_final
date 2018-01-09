<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../member/setting.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style type="text/css">
			body{
				text-align: center;
			}
			aside {
				width : 150px;
				height : 500px;				
				float : left;
			}
			section {
				width : 1300px;			
				height : 500px;
				float : left;
			}
			footer {
				clear : left;
				height : 50px;
			}	
			header, aside, section, footer {
				border : 1px solid black;
				margin : 0px;
			}
		</style>		
	</head>

	<body>
	<script src="${project}member/script.js"></script>    
 	<%@include file="/include/adminmainheader.jsp" %>
 	<%@include file="/include/adminmainnav.jsp" %>
		<aside></aside>
		<section></section>
	</body>
</html>

	