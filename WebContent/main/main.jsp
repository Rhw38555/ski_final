<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../member/setting.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style type="text/css">
			body{
				text-align: center;
			}
			aside {
				width : 150px;
				height : 500px;				
				float : left;
			}
			section {
				width : 1300px;			
				height : 500px;
				float : left;
			}
			footer {
				clear : left;
				height : 50px;
			}	
			header, aside, section, footer {
				border : 1px solid black;
				margin : 0px;
			}
		</style>		
	</head>

	<body>
	<script src="${project}member/script.js"></script>    
 	<%@include file="/include/mainheader.jsp" %>
 	<%@include file="/include/mainnav.jsp" %>
		<aside>
			<table>
				<tr>
					<td>
						<c:set var="wfKor" value="${wfKor}"/>
						<c:if test="${fn:contains(wfKor, '구름')}">
							<img src="/SKI_Final/images/구름.PNG"/>
						</c:if>
						<c:if test="${fn:contains(wfKor, '눈')}">
							<img src="/SKI_Final/images/구름.PNG"/>
						</c:if>
						<c:if test="${fn:contains(wfKor, '맑음')}">
							<img src="/SKI_Final/images/구름.PNG"/>
						</c:if>
						<c:if test="${fn:contains(wfKor, '비')}">
							<img src="/SKI_Final/images/구름.PNG"/>
						</c:if>
						<c:if test="${fn:contains(wfKor, '흐림')}">
							<img src="/SKI_Final/images/구름.PNG"/>
						</c:if>
					</td>
				</tr>
				<tr>
					<td> 최저온도 : ${tmn}</td>
				</tr>
				<tr>
					<td> 최고온도 : ${tmx}</td>
				</tr>
				<tr>
					<td> ${wfKor} </td>
				</tr>
			</table>
		</aside>
		<section></section>
	</body>
</html>

	