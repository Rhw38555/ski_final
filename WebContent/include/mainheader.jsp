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
			<form>
				<c:if test="${sessionScope.memId == null}">
					<table>
						<tr>
							<th colspan="3">		 
								<input class="loginbutton" type="button" value="${btn_login}" onclick="location='memberLoginForm.do'">
								<input class="loginbutton" type="button" value="${btn_join}" onclick="location='memberJoinForm.do'">
							</th>
						</tr>
					</table>
				</c:if>
				<c:if test="${sessionScope.memId != null}">
					<table>
						<tr>
							<th>${sessionScope.memId} ${msg_loginmain}
							</th>
							<td>
								<div id="barcodeTarget" class="barcodeTarget"></div>
							</td>

							<td>	 
								<input class="loginbutton" type="button" value="${btn_logout}" onclick="location='memberLogout.do'"> 
								<input class="loginbutton" type="button" value="${btn_mypage}" onclick="location='memberModifyForm.do'">
								<!-- 바코드 버튼으로 변경하기 -->
							</td>
							
						</tr>
					</table>
					
				</c:if>			
			</form>	
		</header>
	</body>
</html>
	