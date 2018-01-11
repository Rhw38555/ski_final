<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../member/setting.jsp" %>
<!-- 로그인 -->
<!-- 오른쪽 정렬-->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style type="text/css">
			body{
				text-align: center;
			}
			header {
				height : 50px;
				border : 1px solid black;
			}
			.loginbutton {
				width : 100px;
				margin-top : 23px;
				float: right;
			}
		</style>		
	</head>

	<body>
	<script src="${project}member/script.js"></script>   
		<header> 
			<form>
				<c:if test="${sessionScope.memId == null}">
					<table>
						<tr>
							<th colspan="2">		 
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
								<input class="loginbutton" type="button" value="${btn_logout}" onclick="location='memberLogout.do'"> 
								<input class="loginbutton" type="button" value="${btn_mypage}" onclick="location='memberModifyForm.do'">
								<!-- 바코드 버튼으로 변경하기 -->
								<input class="loginbutton" type="button" value="바코드" onclick="location='.do'"> 
							</td>
						</tr>
					</table>
				</c:if>			
			</form>	
		</header>
	</body>
</html>
	