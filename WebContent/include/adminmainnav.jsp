<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="../member/setting.jsp" %>
<!-- 메뉴바 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>wp_메인</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="viewport" content="width=device-width, initial-scale = 1.0, maximum-scale=1.0, user-scalable=no"/>
				
		<style type="text/css">
		    @import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);	
		    @import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
		    
		    * {	
		    	/*font-family: 'Nanum Gothic', sans-serif;*/
		    	font-family: 'Noto Sans KR', normal;
		            
		    }	
		</style>
		
		<!-- google fonts -->
		<link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans'>
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Droid+Serif:regular,bold"/>
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Alegreya+Sans:regular,italic,bold,bolditalic"/>
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Nixie+One:regular,italic,bold,bolditalic"/>
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Alegreya+SC:regular,italic,bold,bolditalic"/>
		
		<!-- css -->
		<link rel="stylesheet" href="${project}assets/css/bootstrap.min.css">
		<link rel="stylesheet" href="${project}assets/css/font-awesome.min.css">
		<link rel="stylesheet" href="${project}assets/css/style.css" media="screen"/>
		<!--  
		<style type="text/css">
			body{
				text-align: center;
			}
			nav {
				border : 1px solid black;
				height : 50px;
			}
			.menubutton {
				width : 230px;
				height : 50px;
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
            
	<body>
	<script src="${project}member/script.js"></script>   
	
			<div id="drawer-right">
			<div class="cross text-right">
				<a class="toggleDrawer" href="#"><i class="fa fa-times-circle fa-2x"></i></a>
			</div>
			<h2>Menu</h2>
			<nav>
			<div>
				<ul class="nav nav-pills nav-stacked">
				
					<li>
						<a href="adminWinterParkLiftPrice.do"><i class="fa fa-home"></i>${btn_winterPark}</a>
					</li>
					
					<li>
						<a href="introSki.do"><i class="fa fa-tasks"></i>${btn_skioom}</a>
					</li>
					<li>
						<a href="ffList.do"><i class="fa fa-wordpress"></i>${btn_eat}</a>
					</li>
					<li>
						<a href="eventList.do"><i class="fa fa-heart"></i>${btn_event}</a>
					</li>
					<li>
						<a href="qnaList.do"><i class="fa fa-thumbs-up"></i>${btn_qa}</a>
					</li>
					<c:if test="${sessionScope.adminId == null}">
						<li>	
							<a href="memberLoginForm.do"><i class="fa fa-thumbs-up"></i>${btn_login}</a>	 
						</li>
					</c:if>
					<c:if test="${sessionScope.adminId != null}">
						<li>	
							<a href="memberLogout.do"><i class="fa fa-thumbs-up"></i>${btn_logout}</a>	
							<a href="adminMemberModifyForm.do"><i class="fa fa-thumbs-up"></i>${btn_mypage}</a>
						</li>				
					</c:if>	
					
				</ul>
				</div>
			</nav>
		</div><!-- #drawer-right -->
	</body>
</html>