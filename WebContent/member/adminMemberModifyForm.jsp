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
	<body onload="getUsers()">
	
	<script src="/SKI_Final/member/jquery-3.2.1.js"></script>
	<script src="${project}member/script.js"></script>
	<%@include file="/include/adminmainheader.jsp" %>
	
	<input type="button" value="회원관리" onclick="location.href='adminMemberModifyForm.do'">
	<input type="button" value="예약내역" onclick="location.href='adminCalandar.do'">
	<br><br>
	<table border="1">
	<tr>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>이름</th>
		<th>전화번호</th>
		<th>이메일</th>
		<th>밴상태</th>
		<th>밴버튼</th>
	</tr>
		
		<tbody id="findtr"></tbody>
		
				
	</table>
	</body>
	<script type="text/javascript">
   		//<!--
   		
   		$(document).on(
   			'click','.banbtn',
   			function(event) {
   				var num = event.target.name.substr(6);
   				$.ajax(
						{
							type : "POST",
							url : "banUser.do",
							dataType : 'xml',
							data : {
								id : $('#userid'+num).text()
							},
							success : function(data) {
								//var code = $(data).find('code').text();
								var codeconfrim = $(data).find('code').text();
								if(codeconfrim=='success') {
									var memberdata = eval("("+$(data).find('data').text()+")");
									$('#userban'+num).text( (memberdata.member[0].ban=='0' ? '노밴' : '밴') );
								}
								
							},
							error : function(e){
								
							}
							
						}		
					); //ajax
   				
   			}
   		);
   		
   		$(document).on(
   	   			'click','.nobanbtn',
   	   			function(event) {
   	   				var num = event.target.name.substr(8);
   	   				$.ajax(
   							{
   								type : "POST",
   								url : "nobanUser.do",
   								dataType : 'xml',
   								data : {
   									id : $('#userid'+num).text()
   								},
   								success : function(data) {
   									//var code = $(data).find('code').text();
   									var codeconfrim = $(data).find('code').text();
   									if(codeconfrim=='success') {
   										var memberdata = eval("("+$(data).find('data').text()+")");
   										$('#userban'+num).text( (memberdata.member[0].ban=='0' ? '노밴' : '밴') );
   									}
   									
   								},
   								error : function(e){
   									
   								}
   								
   							}		
   						); //ajax
   	   				
   	   			}
   	   		);
   		
   		$(document).on(
   	   			'click','.deletebtn',
   	   			function(event) {
   	   				var num = event.target.name.substr(9);
   	   				$.ajax(
   							{
   								type : "POST",
   								url : "deleteUser.do",
   								dataType : 'xml',
   								data : {
   									id : $('#userid'+num).text()
   								},
   								success : function(data) {
   									//var code = $(data).find('code').text();
   									var codeconfrim = $(data).find('code').text();
   									if(codeconfrim=='success') {
   										location.reload();
   									}
   									
   								},
   								error : function(e){
   									
   								}
   								
   							}		
   						); //ajax
   	   				
   	   			}
   	   		);
   		function getUsers(){
   				$.ajax(
   						{
   							type : "POST",
   							url : "getUsers.do",
   							dataType : 'xml',
   							success : function(data) {
   								
   								//var code = $(data).find('code').text();
   								var codeconfrim = $(data).find('code').text();
   								if(codeconfrim=='success') {
   									var memberdata = eval("("+$(data).find('data').text()+")");
   									var msg;
   									for(var i =0;i<memberdata.member.length;i++){
   										msg += "<tr>"
   							    			+ "<td id='userid"+i+"'>"+memberdata.member[i].id+"</td>"
   							    			+ "<td>"+memberdata.member[i].passwd+"</td>"
   							    			+ "<td>"+memberdata.member[i].name+"</td>"
   							    			+ "<td>"+memberdata.member[i].tel+"</td>"
   							    			+ "<td>"+memberdata.member[i].email+"</td>"
   							    			+ "<td id='userban"+i+"'>"+(memberdata.member[i].ban=='0' ? '노밴' : '밴')+"</td>"
   							    			+ "<td><input class='banbtn' type='button' name='banbtn"+i+"' value='밴'><input class='nobanbtn' type='button' name='nobanbtn"+i+"' value='밴풀기'><input class='deletebtn' type='button' name='deletebtn"+i+"' value='삭제'></td>"
   							    			+"</tr>";
   										
   									}
   									
   									$('#findtr').append($('#findtr').text()+msg);
   								}
   								
   							},
   							error : function(e){
   								
   							}
   							
   						}		
   					); //ajax	
   		
   		}
   		
   		
   		function noban(id,num){
   			$.ajax(
					{
						type : "POST",
						url : "nobanUser.do",
						dataType : 'xml',
						data : {
							id : id
						},
						success : function(data) {
							
							//var code = $(data).find('code').text();
							var codeconfrim = $(data).find('code').text();
							if(codeconfrim=='success') {
								var memberdata = eval("("+$(data).find('data').text()+")");
								var msg;
								for(var i =0;i<memberdata.member.length;i++){
									msg += "<tr>"
						    			+ "<td id='userid'"+i+">"+memberdata.member[i].id+"</td>"
						    			+ "<td>"+memberdata.member[i].passwd+"</td>"
						    			+ "<td>"+memberdata.member[i].name+"</td>"
						    			+ "<td>"+memberdata.member[i].tel+"</td>"
						    			+ "<td>"+memberdata.member[i].email+"</td>"
						    			+ "<td>"+memberdata.member[i].ban+"</td>"
						    			+ "<td><input type='button' name='banbtn'"+i+" value='밴' onclick='ban()'><input type='button' name='nobanbtn'"+i+" value='밴풀기' onclick='noban()'><input type='button' name='deletebtn'"+i+" value='삭제' onclick='deleteUser()'></td>"
						    			+"</tr>";
									
								}
								
								$('#findtr').append($('#findtr').text()+msg);
							}
							
						},
						error : function(e){
							
						}
						
					}		
				); //ajax
   		}
   		function deleteUser(id,num){
   			$.ajax(
					{
						type : "POST",
						url : "deleteUser.do",
						dataType : 'xml',
						data : {
							id : id
						},
						success : function(data) {
							
							//var code = $(data).find('code').text();
							var codeconfrim = $(data).find('code').text();
							if(codeconfrim=='success') {
								var memberdata = eval("("+$(data).find('data').text()+")");
								var msg;
								for(var i =0;i<memberdata.member.length;i++){
									msg += "<tr>"
						    			+ "<td id='userid'"+i+">"+memberdata.member[i].id+"</td>"
						    			+ "<td>"+memberdata.member[i].passwd+"</td>"
						    			+ "<td>"+memberdata.member[i].name+"</td>"
						    			+ "<td>"+memberdata.member[i].tel+"</td>"
						    			+ "<td>"+memberdata.member[i].email+"</td>"
						    			+ "<td>"+memberdata.member[i].ban+"</td>"
						    			+ "<td><input type='button' name='banbtn'"+i+" value='밴' onclick='ban()'><input type='button' name='nobanbtn'"+i+" value='밴풀기' onclick='noban()'><input type='button' name='deletebtn'"+i+" value='삭제' onclick='deleteUser()'></td>"
						    			+"</tr>";
									
								}
								
								$('#findtr').append($('#findtr').text()+msg);
							}
							
						},
						error : function(e){
							
						}
						
					}		
				); //ajax
   		}
		</script>
</html>