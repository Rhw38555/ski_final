<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
    
    
<%@ include file="../member/setting.jsp" %>
<!DOCTYPE html>
<html>
    
   <head>
      <meta charset="UTF-8">
      <style>
     	 @import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);   
		 @import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);      
	      * {
	      	font-family: 'Noto Sans KR', normal;
	      }
	      
	      .member-button{
	      	padding-top : 10px;
	      
	      	/*padding-right : 10px;*/
	      }
	      
	     .header-nav{
			/*padding-top : 15px;*/	
		}
      </style>
      
      <!-- for-mobile-apps -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      <meta name="keywords" content="Snow tour Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
      Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
      <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1); } </script>
      <!-- //for-mobile-apps -->
      <link href="${project}assets/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
      
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <link href="${project}assets/css/style.css" rel="stylesheet" type="text/css" media="all" />
      <!-- Chocolat-CSS -->
      <link rel="stylesheet" href="${project}assets/css/chocolat.css" type="text/css" media="all">
      <link href="//fonts.googleapis.com/css?family=Montserrat+Alternates:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
      <link href="//fonts.googleapis.com/css?family=Noto+Sans:400,700" rel="stylesheet">
      <link href="//fonts.googleapis.com/css?family=Lato:300,400,700,900" rel="stylesheet">
      <link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
      
      <script src="./assets/js/modernizr.js"></script>
       <script src="${project}member/script.js"></script> 
		<script src="${project}member/jquery-3.2.1.js"></script>
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
      <!--Header-->
      <header>         
         <div class="header" id="home">
         <!--Top-Bar-->     
            <div class="top-bar">
            <div class="container-fluid">
            
            <c:if test="${sessionScope.memId == null}">
                  <div class="member-button">
                  
                        <input type="button" value="${btn_login}" class="btn btn-default" onclick="location='memberLoginForm.do'">
                        <input type="button" value="${btn_join}" class="btn btn-default" onclick="location='memberJoinForm.do'">
                   </div>
               </c:if>
            <c:if test="${sessionScope.memId != null}">                      
                 <div class="member-button">                 
                 	<div id="barcodeTarget" class="barcodeTarget" onclick=""></div>
                 	<div id="layerbarcode"></div>
                 	${sessionScope.memId} ${msg_loginmain}
                 <input type="button" value="${btn_logout}" class="btn btn-default" onclick="location='memberLogout.do'"> 
                 <input type="button" value="${btn_mypage}" class="btn btn-default" onclick="location='memberModifyForm.do'">
                  
                 <form name="inputhidden">
                 <input type="hidden" value="${user_barcode}" name="hiddenBarcode">
                 </form>
                 </div> 
                 <br>                     
            </c:if>
           
               <div class="header-nav">
                  <nav class="navbar navbar-default">
                     <!-- Brand and toggle get grouped for better mobile display -->
                     <div class="navbar-header">                   
                        <h1><a class="navbar-brand" href="main.do">WinterPark<sup><i class="fa fa-snowflake-o" aria-hidden="true"></i><sup></a></h1>
                     </div>
                     <!-- Collect the nav links, forms, and other content for toggling -->
                     <div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
                        <nav class="cl-effect-15" id="cl-effect-15">
                        <ul>
                           <li><a href="WinterParkLiftPrice.do" data-hover="${btn_winterPark}">${btn_winterPark}</a></li>
                           <c:if test="${sessionScope.memId == null}">                      
                           		<li><a href="javascript:alertLogin()" target="_blank" data-hover="${btn_reservation}">${btn_reservation}</a></li>
                           </c:if>
                           <c:if test="${sessionScope.memId != null}">                      
                           		<li><a href="reverseRoomForm.do" target="_blank" data-hover="${btn_reservation}">${btn_reservation}</a></li>
                           </c:if>
                           
                           <li><a href="introSki.do" data-hover="${btn_skioom}">${btn_skioom}</a></li>
                           <li><a href="ffList.do" data-hover="${btn_eat}">${btn_eat}</a></li>
                           <li><a href="eventList.do" data-hover="${btn_event}">${btn_event}</a></li>
                           <li><a href="qnaList.do" data-hover="${btn_qa}">${btn_qa}</a></li>
                        </ul>
                        </nav>
                     </div>
                  </nav>
               </div>
               </div>
         </div>
         <!--//Top-Bar-->
      </header>     
   </body>
   <script type="text/javascript">
   $(document).ready(
		function(){
			if($('input[name=hiddenBarcode]').val()){			
				generateBarcode($('input[name=hiddenBarcode]').val());
				$('#layerbarcode').hide();
			}
	     }
	);
   
   
   function alertLogin(){
	   alert("로그인 후 이용해주세요");
	   location.href="memberLoginForm.do";
   }
   function addclone(){
	   var top = ( $(window).scrollTop() + ($(window).height() - $('#layerbarcode').height()) / 2 )
       var left = ( $(window).scrollLeft() + ($(window).width() - $('#layerbarcode').width()) / 2 )
       $("#layerbarcode").css('top', top);
       $("#layerbarcode").css('left', left);
	   $('#layerbarcode').append($('#barcodeTarget').clone());
	   $('#layerbarcode').show();
   }

   </script>
</html>
   
