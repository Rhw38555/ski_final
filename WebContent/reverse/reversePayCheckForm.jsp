<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
   <head>
      <meta charset="utf-8">
      <title>reserveRoomForm</title>
      <link href="/SKI_Final/reverse/jquery-ui.css" rel="stylesheet"> 
      <link href="/SKI_Final/reverse/re.css" rel="stylesheet">  
      <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
      
      <script src="/SKI_Final/reverse/jquery.js"></script>      
	  <script src="/SKI_Final/reverse/request.js"></script>
	  <script src="/SKI_Final/reverse/jquery-ui.js"></script>	 
	  <script src="/SKI_Final/reverse/refoot.js"></script>	
	 
	  <script src="./assets/js/jquery-migrate-1.2.1.min.js"></script>
	  <script src="./assets/js/bootstrap.min.js"></script>
	  <script src="./assets/js/jquery.actual.min.js"></script>
	  <script src="./assets/js/jquery.scrollTo.min.js"></script>
	  <script src="./assets/js/script.js"></script>
		   
	  <%@include file="/include/mainnav.jsp" %> 
   </head>

   <body class="rebody"> 
	   <div class="container">
			<div class="row">
			
			<c:if test="${check == 'ski'}">				
				<div class="paycheckid">
					<h3> ${re.get(0).id}님 결제 확인 </h3> 
				</div>
			</c:if>
			<c:if test="${check == 'room'}">				
				<div class="paycheckid">
					<h3> ${re.get(0).id}님 결제 확인 </h3> 
				</div>
			</c:if>
				<div id="paycheck">
					<c:if test="${check == 'ski'}">
					<table class="type04">	
						<tr>
							<th  colspan="4"> 결제번호 : ${re.get(0).num}  </th>
						</tr>
						<tr>
							<th> 총 가격 </th>
							<td colspan="3"> ${re.get(0).ski_price} </td>
						</tr>
						<tr>
							<th> 날짜 </th>
							<td> 오전권 </td>
							<td> 야간권 </td>
							<td> 종일권 </td>
						</tr>
						<c:forEach var="rs" items="${re}">			
							<tr>
								<th> 
									<fmt:formatDate value="${rs.ski_date}"
										type="both" pattern="yyyy-MM-dd"/> 
								</th>
								<td>${rs.ski_morning} </td>
								<td>${rs.ski_night} </td>
								<td>${rs.ski_day} </td>
							</tr>
						</c:forEach>
						<tr>
							<th> 이름 </th>
							<td colspan="3"> ${re.get(0).name} </td>
						</tr>
						<tr>
							<th> 전화번호 </th>
							<td colspan="3"> ${re.get(0).tel} </td>
						</tr>
						<c:if test="${re.get(0).carnum != ''}">
							<tr>
								<th> 차량번호 </th>
								<td colspan="3"> ${re.get(0).carnum} </td>
							</tr>
						</c:if>	
					</table>
					<div class="paycheckbt">
						<input type="button" id="paycheckbt" value="확인"
							onclick="location='main.do'">
						<input type="button" id="paycheckbt" value="변경" 
							onclick="location='reverseChangeSkiForm.do?num=${re.get(0).num}'">
					</div>
				</c:if>    
				    
				<c:if test="${check == 'room'}">
					<table class="type04">						
						<tr>
							<th  colspan="4"> 결제번호 : ${re.get(0).num}  </th>
						</tr>
						<tr>
							<th> 체크인 / 체크아웃 </th>
							<td colspan="3"> ${re.get(0).room_check} </td>	
						</tr>
						<tr>
							<th> 총 가격 </th>
							<td colspan="3"> ${re.get(0).room_price} </td>
						</tr>
						<tr>
							<th> 날짜 </th>
							<th> 2인실 </th>
							<th> 4인실 </th>
							<th> 8인실 </th>
						</tr>
						<c:forEach var="rs" items="${re}">			
							<tr>
								<th> 
									<fmt:formatDate value="${rs.room_date}"
										type="both" pattern="yyyy-MM-dd"/> 
								</th>
								<td>  ${rs.room_2} </td>
								<td>  ${rs.room_4} </td>
								<td>  ${rs.room_8} </td>
							</tr>
						</c:forEach>
						<tr>
							<th> 이름 </th>
							<td colspan="3"> ${re.get(0).name} </td>
						</tr>
						<tr>
							<th> 전화번호 </th>
							<td colspan="3"> ${re.get(0).tel} </td>
						</tr>
						<c:if test="${re.get(0).carnum != ''}">
							<tr>
								<th> 차량번호 </th>
								<td colspan="3"> ${re.get(0).carnum} </td>
							</tr>
						</c:if>
					</table>
					<div class="paycheckbt">
						<input type="button" id="paycheckbt" value="확인"
							onclick="location='main.do'">
						<input type="button" id="paycheckbt" value="변경" 
							onclick="location='reverseChangeRoomForm.do?num=${re.get(0).num}'">
					</div>
				</c:if>
			</div>
		</div> <!-- row -->
	</div><!-- container -->
</body>