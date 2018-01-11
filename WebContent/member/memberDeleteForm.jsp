<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="setting.jsp" %>

<!DOCTYPE html>
<center>
<html>
	<head>
		<meta charset="UTF-8">
		<style type="text/css">
			body{
				text-align: center;
			}
			header {
				height : 50px;
			}
			section {
				width : 1300px;			
				height : 500px;
				float : left;
			}
			header, section {
				border : 1px solid black;
				margin : 0px;
			}
		</style>		
	</head>

	<body onload="passwdfocus()">
<script src="${project}member/script.js"></script>    
	
		<header>${page_delete}</header>
		<%@include file="/include/mypageaside.jsp" %>
		<section>
		<form name="delpasswdform" method="post" action="memberDeletePro.do"
			onsubmit="return delpasswdcheck()">
			<table>
				<tr>
					<th colspan="2">
						${msg_passwd}
					</th>	
				</tr>
				<tr>
					<th> ${str_passwd} </th>
					<td>
						<input class="input" type="password" name="passwd"
							maxlength="15">
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input class="inputbutton" type="submit" value="${btn_del}">
						<input class="inputbutton" type="button" value="${btn_del_cancel}" onclick="location='main.do'">	
					</th>
				</tr>
			</table>
		</form>
		</section>
	</body>
</html>
</center>