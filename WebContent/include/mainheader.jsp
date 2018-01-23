<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %> 
    
<%@ include file="../member/setting.jsp" %>
<!-- 로그인 -->
<!-- 오른쪽 정렬-->
<!DOCTYPE html>
<html>
	 <script src="${project}member/jquery-3.2.1.js"></script>
	 <script src="${project}member/jquery-barcode.js"></script>
	<head>
		<meta charset="UTF-8">
		<!-- 
		<style type="text/css">
			
			body{
				text-align: center;
			}
			header {

				height : 50%;
				border : 1px solid black;
			}
			.loginbutton {
				width : 100px;
				margin-top : 23px;
				float: right;
			}
			div{
				color : red;
				border : 1px;
			}
			.barcodeTarget{
				width: 50px;

			}
		</style>
		 -->
	</head>
	<sql:query var="rs" dataSource="jdbc/kh">
      select user_barcode from wp_user_barcodes where id=?
   <sql:param value="${sessionScope.memId}"/>
   </sql:query>
   
            <c:forEach var="row" items="${rs.rows}">
                  <c:set var="user_barcode" value="${row.user_barcode}"/>
            </c:forEach>
            
	<body onload="generateBarcode('${user_barcode}')">
	
	<script src="${project}member/script.js"></script>
		<header> 

		</header>
		<div id="wrapper">
			<div id="header" class="content-block header-wrapper">
				<div class="header-wrapper-inner">
					<section class="top clearfix">
						<div class="pull-left">
							<h1><a class="logo" href="main.do">WinterPark</a></h1>
						</div>
						<div class="pull-right">
							<a class="toggleDrawer" href="#"><i class="fa fa-bars fa-2x"></i></a>
						</div>
					</section>
					<section class="center">
						<div class="slogan">
							스키 &amp; 콘도
						</div>
						<div class="secondary-slogan">
							여기는 공간입니다.
						</div>
					</section>
					<section class="bottom">
						<a id="scrollToContent" href="#">
							?
						</a>
					</section>
				</div>
			</div><!-- header -->
	</body>
</html>
	