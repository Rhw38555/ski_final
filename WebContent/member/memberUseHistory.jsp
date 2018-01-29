<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="setting.jsp" %>

<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <link href="./member/a_re.css" rel="stylesheet">
      <script src="${project}member/script.js"></script> 
      <script src="${project}member/jquery-3.2.1.js"></script>
      <%@include file="/include/mainheader.jsp"%>         
   </head>
   
   <body onload="memberUseHistoryCheck('${user_barcode}')">
      <br><br><br>
      <%@include file="/include/mypageaside.jsp" %>   
      <input type="hidden" id="user_barcode" value="${user_barcode}">
      <br><br>   
      <div class="checkform2">   
         <div class="check_a">
            <div class="checkbtbox">
               <a href="javascript:userBarcodeCharge();" class="roomcheck_a">충전하기</a>
            </div>
         </div>
         <table class='recheck'> 
            <tbody id="findtr"></tbody>
         </table>
         <br><br>
         <form class="form" name="inputPrice" id="inputprice">
            바코드 잔액 : 
            <input type="text" name="currentPrice" id="tx1" readonly>
            <input type="hidden" name="hiddenId" value="${sessionScope.memId}">
            <br>
            충 전 금 액&nbsp; : 
            <input type="text" id="tx2" name="price" placeholder='충전할 금액을 입력해주세요'>             
         </form>
      </div>
   </body>
   
   <script type="text/javascript">
   //<!--
      
   //-->
   </script>
</html>