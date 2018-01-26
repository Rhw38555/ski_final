<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="setting.jsp" %>

<!DOCTYPE html>
	<html>		
		<head>
			<meta charset="UTF-8">				
			<script src="${project}member/script.js"></script> 
			<script src="${project}member/jquery-3.2.1.js"></script>			
			<style>
				form{
					margin-bottom : 100px;
				}			
				.checkform{
					margin-left : 35%;
				}
				.tablebox{
					margin-bottom: 30px;
				}
				table.recheck {
					margin-left : 10px;
				    border-collapse: separate;
				    border-spacing: 1px;
				    text-align: left;
				    line-height: 1.5;
				    /*border-top: 1px solid #818181;*/
				    border : 0px;
				 	margin : 10px;
				 	
				}
				table.recheck thead{
					background-color : #EAEAEA;
				}
				
				table.recheck th {
				    width: 150px;
				    padding: 10px;
				    font-weight: bold;
				    vertical-align: top;
				    border-bottom: 1px solid #818181;
				    border-top : 0px;
				    /*border-bottom: 0px;*/
				    border-left: 0px;
				    border-right: 0px;
				    text-align : center; 
				}
				table.recheck td {
				    width: 150px;
				    padding: 10px;
				    vertical-align: top;
				    border-bottom: 1px solid #818181;
				    border-top : 0px;
				    /*border-bottom: 0px;*/
				    border-left: 0px;
				    border-right: 0px;
				    text-align : center;
				}
				.checkbtbox{
					margin-left : 35%;
				}
				.checkbtbox a{
					/*border : 1px solid blue;*/
					/*float : right;*/
					font-weight: 400;
				    font-size: 1em;
				    line-height: 2em;
				    /*margin: 5px 1px;*/
				    border: 2px solid #BDBDBD;
				    cursor: pointer;
				    background-color: transparent;
				    color: #FFFFFF;
				    /*border-width: 1px;*/
				    border-radius: 20px !important;
				    padding: 11px 23px;
				    text-decoration : none;
				}				
				.checkbtbox a:hover{
					/*text-decoration : underline; */
					color : gray;
				}
				.checkbtbox a:active{
					/*text-decoration : none; */
					color : orange;
				}
				
			</style>
			<script type="text/javascript">
				$(document).ready(function(){
					memberReserveCheck($('#userid').val());					
					//$('.roomcheck_a').css('active',true);
					$('#skicheck').css('display','none');	
					$('.roomcheck_a').css('color','orange');
					$('.skicheck_a').css('color','#FFF');
				});
			</script>
			<%@include file="/include/mainheader.jsp"%>				
		</head>
		
		<body>
			<script src="${project}member/script.js"></script>    
			<br><br><br><br><br><br><br>
			
			<%@include file="/include/mypageaside.jsp" %>
			<section>				
				<form>
				<%--<header>${page_reservationConfirm}</header> --%>
					<input type="hidden" id="user_barcode" value="${user_barcode}">
					<input type="hidden" id="userid" value="${sessionScope.memId}">
					
					<div class="checkform">	
						<div class="checkbtbox">
							<a href="javascript:showroom();" class="roomcheck_a">콘도</a>
							<a href="javascript:showski();" class="skicheck_a">스키</a>
						</div>
						<br>
						<div id="roomcheck">
							<%--<div>콘도 예약 정보</div> --%> 														
							<div id="findtr"></div>
						</div>			
						<div id="skicheck">
							<%--<div>스키 예약 정보</div> --%> 														
							<div id="findtr2"></div>
						</div>
					</div>	
					<%--총가격 : <input type="text" id="allPrice"> --%>
				</form>
			</section>
		</body>
		<%@include file="/include/mainfooter.jsp" %>
	</html>
