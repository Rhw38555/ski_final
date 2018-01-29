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
	<form name="inputform">
		업체명 : <input type="text" id="marketName">
				<input type="button" id="searchMarket" value="매출 검색">
				<br>
	</form>
	
	<h2>가게 별 내역</h2>
	이번달 총 매출액 : <input type="text" id="marketAllPrice">
	
	</body>
	<script type="text/javascript">
   		//<!--
   		$(document).on(
				'click','#searchMarket',
				function(event) {
					$.ajax(
							{
								type : "POST",
								url : "receiptBarcode3.do",
								/*data : params,*/
								data : {
									value : $('#marketName').val()
								},
								
								//data : $('form').serialize(),
								dataType : 'xml',
								success : function(data){
									//var code = $(data).find('code').text();
									var codeconfrim = $(data).find('code').text();
									if(codeconfrim=='success'){
										var sum=0;
										var memberdata = eval("("+$(data).find('data').text()+")");
										for(var i=0;i<memberdata.member.length;i++){
											var productPrice = Number(memberdata.member[i].product_price);
											var productCount = Number(memberdata.member[i].product_count);
											sum+=(productPrice * productCount);
											//memberdata.member[i].product_maket;
											
										}
										$('#marketAllPrice').val(sum);
									}
									
								},
								error : function(e){
									
								}
								
							}		
						);//ajax
				}				
		);
		</script>
</html>