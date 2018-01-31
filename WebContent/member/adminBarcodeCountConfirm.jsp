<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
<style>
input[type=button], input[type=submit], input[type=reset] {
    background-color: #5e5e5e; /* Green */
    border: none;
    color: white;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
}

table
{
    border-collapse: collapse;
    width: 100%;
}
th, td
{
    text-align: left;
    padding: 8px;
}
tr:nth-child(even)
{
    background-color: #f2f2f2;
}

form {
  background: -webkit-linear-gradient(bottom, #CCCCCC, #EEEEEE 175px);
  background: -moz-linear-gradient(bottom, #CCCCCC, #EEEEEE 175px);
  background: linear-gradient(bottom, #CCCCCC, #EEEEEE 175px);
  margin: auto;
  position: relative;
  width: 95%; 
  height: 450px;
  font-family: Tahoma, Geneva, sans-serif;
  font-size: 14px;
  font-style: italic;
  line-height: 24px;
  font-weight: bold;
  color: #09C;
  text-decoration: none;
  border-radius: 10px;
  padding: 10px;
  border: 1px solid #999;
  border: inset 1px solid #333;
  -webkit-box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.3);
  -moz-box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.3);
  box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.3);
}
</style>

</head>
<body>
	<script src="/SKI_Final/member/jquery-3.2.1.js"></script>
	<script src="${project}member/script.js"></script>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="계산하기" onclick="location.href='adminBarcodeAccountForm.do'">
	<input type="button" value="환불하기" onclick="location.href='adminBarcodeRefundForm.do'">
	<input type="button" value="재고확인" onclick="location.href='adminBarcodeCountConfirm.do'">
	<br><br>
	<form method="post" action="adminBarcodeAccountPro.do"
		name="inputform" onsubmit="return adminBarcodeAccountCheck()">
		<input type="hidden" name="confirm" value="0">
		<div style="width:100%; height:450px; overflow:auto">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<th>상품명</th>
				<th>단가</th>
				<th>수량(재고수량)</th>
				<th>구매일</th>
			</tr>
			<c:set var="num" value="0"/>
			<c:forEach var="i" begin="0" end="9">
				<c:set var="num" value="${num+1}"/>		
				<tr>
					<td>
						<input class="findP" type="text" name="product${num}">
						<input class="findPn" type="text" name="productName${num}">
						<input class="findbtn" type="button" name="productButton${num}" 
						value="초기화">
					</td>
					<td><input class="findprice" type="text" name="price${num}"><input type="hidden" name="hiddenprice${num}"></td>
					
					<td><input class="findcount" type="number" name="productCounts${num}"></td>
					<td><input class="finddate" type="text" name="buydate${num}"></td>
				</tr>
			</c:forEach>
			<tbody id="findtr"></tbody>
		</table>
		</div>
		<br>
		<input type="hidden" name="checknum" value="1">
		<input class="sellbtn" type="button" value="가게 판매 내역 확인">
		<input class="maketcount" type="button" value="가게 재고 확인">
		<input type="reset" value="초기화">
		</form>
		</body>
		<script type="text/javascript">
  		 //<!--
  		 $('form[name=inputform]').on(
						'keydown',
						function(evt){
							if (evt.keyCode == 13) return false; 
						}
					);//자동으로 서브밋 넘기는거 막기
		 $(document).ready(
				 function(){
					 $('.findP').attr("readonly",true);		 
				 }
					 
		 );			
		
  		 $(document).on(
						'keyup','.findP',
						function(event) {
							var num = event.target.name.substr(7);
							
								$('.findP').each( function(index,item) {
									if(index== Number(num-1)){
										//자기가 자기꺼랑 비교하는것이니 패스
									} else {
											if( $('input[name=product'+(Number(index)+1)+']').val()==event.target.value && "" !=event.target.value )  {
											
											//바코드중 같은게 있으면
											var counts = $('input[name=productCounts'+Number(index+1)+']').val();
											var addcounts = Number(counts)+1;
											$('input[name=productCounts'+Number(index+1)+']').val(addcounts);
											
											
											var count =$('input[name=productCounts'+Number(index+1)+']').val();
											var price = $('input[name=hiddenprice'+Number(index+1)+']').val();
											var calprice= price * count;
											$('input[name=price'+Number(index+1)+']').val(calprice);
											
											event.target.value="";
											//event.target.focus();
										} else {
											
										}//마지막else

									}
									
								});//finP 
								
								
								$.ajax(
										{
											type : "POST",
											url : "productBarcode.do",
											/*data : params,*/
											data : {
												value : event.target.value
											},
											
											//data : $('form').serialize(),
											dataType : 'xml',
											success : function(data){
												
												//var code = $(data).find('code').text();
												var codeconfrim = $(data).find('code').text();
												if(codeconfrim=='success'){
													var memberdata = eval("("+$(data).find('data').text()+")");
													//var num = event.target.name.substr(7);
													var nextnum = Number(num)+1;
													$('input[name=product'+num+']').val(memberdata.member[0].product_barcode);
													$('input[name=product'+num+']').attr("readonly",true);
													$('input[name=productName'+num+']').val(memberdata.member[0].product_name);
													$('input[name=productName'+num+']').attr("readonly",true);]
													
													$('input[name=product'+nextnum+']').focus();
													$('input[name=price'+num+']').val(memberdata.member[0].price);
													$('input[name=price'+num+']').attr("readonly",true);
													$('input[name=productCounts'+num+']').val(1);
													$('input[name=hiddenprice'+num+']').val(memberdata.member[0].price);
													
													
													appendtr();
												}
												
											},
											error : function(e){
												event.target.value="";
											}
											
										}		
									);//ajax
								
								
							});//findp
							
							$(document).on(
									'click','.findbtn',
									function(event){
										var num = event.target.name.substr(13);

										
										var price = Number($('input[name=price'+num+']').val());
										
										price = Number( $('input[name=price'+num+']').val());
										
										$('input[name=product'+num+']').attr("readonly",false);
										$('input[name=productName'+num+']').attr("readonly",false);
										$('input[name=price'+num+']').attr("readonly",false);
										$('input[name=product'+num+']').val("");
										$('input[name=productName'+num+']').val("");
										$('input[name=price'+num+']').val("");
										$('input[name=productCounts'+num+']').val("");
										$('input[name=buydate'+(num)+']').val("");
										$('input[name=hiddenprice'+num+']').val("");
									}
								);//findbtn	
								
							$(document).on(
									'click','.sellbtn',
									function(event){
										
										$.ajax(
												{
													type : "POST",
													url : "receiptMaket.do",
													/*data : params,*/
													data : {
														value : 'A'
													},
													
													//data : $('form').serialize(),
													dataType : 'xml',
													success : function(data){
														//var code = $(data).find('code').text();
														var codeconfrim = $(data).find('code').text();
														if(codeconfrim=='success'){
															
															var memberdata = eval("("+$(data).find('data').text()+")");
															
															//var num = event.target.name.substr(7);
															var num;
															for(var i=0;i<memberdata.member.length;i++){
																num = Number(i)+1;
																appendtr();
																
																$('input[name=product'+(num)+']').val(memberdata.member[i].product_barcode);
																$('input[name=product'+(num)+']').attr("readonly",true);
																$('input[name=productName'+(num)+']').val(memberdata.member[i].product_name);
																$('input[name=productName'+(num)+']').attr("readonly",true);
																$('input[name=price'+(num)+']').val(memberdata.member[i].product_price);
																$('input[name=price'+(num)+']').attr("readonly",true);
																$('input[name=productCounts'+(num)+']').val(memberdata.member[i].product_count);
																var hiddenprice = memberdata.member[i].product_price/memberdata.member[i].product_count;
																$('input[name=hiddenprice'+(num)+']').val(hiddenprice);
																$('input[name=buydate'+(num)+']').val(memberdata.member[i].buydate);
															
																
															}
															
														}
														
													},
													error : function(e){
														
													}
												}		
											);//ajax
									}
								);//sellbtn	
								
								$(document).on(
										'click','.maketcount',
										function(event){
											
											$.ajax(
													{
														type : "POST",
														url : "productBarcode2.do",
														/*data : params,*/
														data : {
															value : 'A'
														},
														
														//data : $('form').serialize(),
														dataType : 'xml',
														success : function(data){
															//var code = $(data).find('code').text();
															var codeconfrim = $(data).find('code').text();
															if(codeconfrim=='success'){
																
																var memberdata = eval("("+$(data).find('data').text()+")");
																
																//var num = event.target.name.substr(7);
																var num;
																for(var i=0;i<memberdata.member.length;i++){
																	num = Number(i)+1;
																	appendtr();
																	
																	$('input[name=product'+(num)+']').val(memberdata.member[i].product_barcode);
																	$('input[name=product'+(num)+']').attr("readonly",true);
																	$('input[name=productName'+(num)+']').val(memberdata.member[i].product_name);
																	$('input[name=productName'+(num)+']').attr("readonly",true);
																	$('input[name=price'+(num)+']').val(memberdata.member[i].price);
																	$('input[name=price'+(num)+']').attr("readonly",true);
																	$('input[name=productCounts'+(num)+']').val(memberdata.member[i].all_count);
																	var hiddenprice = memberdata.member[i].price/memberdata.member[i].product_count;
																	$('input[name=hiddenprice'+(num)+']').val(hiddenprice);
																
																}
																
															}
															
														},
														error : function(e){
															
														}
													}		
												);//ajax
										}
									);//maketcount
								
  		 
  		 function appendtr(){
    	var boolarray = new Array();
    	var fullcheck=false;
    	var newnum;
    	var fornum;
    	var total = $('.findP').length;
    	var checknum = Number($('input[name=checknum]').val())+1;
    	$('input[name=checknum]').val(checknum);
    	$('.findP').each( function(index,item) {
    		if( $(item).attr("readonly")=="readonly" ){
    			boolarray[index-1] = "readonly";
    		}else{
    			boolarray[index-1] = "undefined";
    		}
    		
			if(index=== total-1){
				newnum = index+2;
				fornum =  newnum+10;
			}	   
			
    	});//.findP
    	for(var i=0; i<boolarray.length;i++){
    		if(boolarray[i]=="readonly"){
    			fullcheck=true;
    		}else if(boolarray[i]=="undefined"){
    			fullcheck=false;
    		}
    	}
    	if(fullcheck){
    		var msg="";
    		
        	for(var i=newnum; i < fornum; i++){
        	
        		msg += "<tr>"
    			+ "<td>"
    			+ "<input class='findP' type='text' name='product"+i+"'> "
    			+"<input class='findPn' type='text' name='productName"+i+"'> "
    			+ "<input class='findbtn' type='button' name='productButton"+i+"' value='초기화'>"
    			+"</td>"
    			+"<td>"
    			+"<input class='findprice' type='text' name='price"+i+"'>"
    			+"<input type='hidden' name='hiddenprice"+i+"'>"
    			+"</td>"
    			+"<td>"
    			+"<input class='findcount' type='number' name='productCounts"+i+"'>"
    			+"</td>"
    			+"<td>"
    			+"<input class='finddate' type='text' name='buydate"+i+"'>"
    			+"</td>"
    			+"</tr>";
        	}
        	$('#findtr').append($('#findtr').text()+msg);
    	}else{
    		
    	}
    	
    }
  		//-->
  		 </script>
		</html>
		
		
		
		
		<!-- A가게 고정값으로 찾기 -->