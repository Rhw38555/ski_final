<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${check == 'ski'}">
	<h2> 스키스키 </h2>
	<table border="1">	
		<tr>
			<th colspan="4"> ${re.get(0).id}님 결제 확인 </th>
		</tr>
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
		<tr>
			<th colspan="4"> 
				<input type="button" value="확인">
				<input type="button" value="변경" onclick="location='reverseChangeSkiForm.do?num=${re.get(0).num}'">
			</th>
		</tr>
	</table>
</c:if>    
    
<c:if test="${check == 'room'}">
	<h2> 콘도콘도 </h2>
	<table border="1">	
		<tr>
			<th colspan="4"> ${re.get(0).id}님 결제 확인 </th>
		</tr>
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
	
		<c:forEach var="rs" items="${re}">			
			<tr>
				<th> 
					<fmt:formatDate value="${rs.room_date}"
						type="both" pattern="yyyy-MM-dd"/> 
				</th>
				<td> 2인실 : ${rs.room_2} </td>
				<td> 4인실 : ${rs.room_4} </td>
				<td> 8인실 : ${rs.room_8} </td>
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
		<tr>
			<th colspan="4"> 
				<input type="button" value="확인">
				<input type="button" value="변경" onclick="location='reverseChangeRoomForm.do?num=${re.get(0).num}'">
			</th>
		</tr>
	</table>
</c:if>
