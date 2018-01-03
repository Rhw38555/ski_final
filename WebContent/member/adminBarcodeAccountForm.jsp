<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<script src="/SKI_Final/member/jquery-3.2.1.js"></script>
	
	<form method="post" action="inputPro.do"
		name="inputform" onsubmit="return inputcheck()">
		<input type="hidden" name="confirm" value="0">
		<table border="1">
			<tr>
				<th>상품명</th>
				<th>단가</th>
				<th>수량</th>
			</tr>
			<c:set var="num" value="0"/>
			<c:forEach var="i" begin="0" end="10">		
				<tr>
				<c:set var="num" value="${num+1}"/>
					<td>
						<input class="findP" type="text" name="product${num}">
						<input class="findbtn" type="button" name="productButton${num}" 
						value="초기화">
					</td>
					<td><input type="text" name="price${num}"></td>
					<td><input type="text" name="productCounts${num}"></td>
				</tr>
			</c:forEach>
		</table>
		
		<table border="1">
			<tr>
				<th> 상품들의 총 금액 </th>
				
				<td>
					<input type="text" name="productsPrice">
				</td>
			</tr>
			<tr>
				<th> 고객의 바코드 잔액<input type="text" name="userBarcode"></th>
				<td>
					<input type="text" name="userPrice">
				</td>
			</tr>
			<tr>
				<th> 계산 후의 금액 </th>
				<td>
					<input type="text" name="calPrice">
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<!--  <input class="inputbutton" type="submit" value="계산">-->
				</th>
			</tr>
		</table>
	</form>
</body>

<script type="text/javascript">
   //<!--
  	
   
  
   $(document).ready(
			function(){
				$('.findP').on(
					'keyup',
					function(event){
						$.ajax(
								{
									type : "POST",
									url : "productBarcode.jsp",
									/*data : params,*/
									data : {
										value : event.target.value
									},
									
									//data : $('form').serialize(),
									dataType : 'text',
									success : function(data){
										if(event.target.value==data){
											event.target.value=data;
										}else{
												
										}
										
									},
									error : function(e){
										
									}
									
								}		
							);
					}
				);//findP
				
				$('.findbtn').on(
						'click',
						function(event){
							var num = event.target.name.substr(13);
							$('input[name=product'+num+']').val("");
							$('input[name=price'+num+']').val("");
							$('input[name=productCounts'+num+']').val("");
						}
					);//findbtn	
				
			}		
		);
   
  
   //-->
</script>

</html>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<h2>관리자 바코드계산폼</h2>

