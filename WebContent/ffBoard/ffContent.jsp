<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<%@include file="/include/mainheader.jsp"%>
<%@include file="/include/mainnav.jsp"%>
<link href="${project}${location}style.css" rel="stylesheet" type="text/css">
<script src="${project}jquery-3.2.1.js"></script>
<style>
	#mainPanel{
		width:100%;
		height:auto;
	}
</style>
<table style="width:100%;">
	<tr>
		<th colspan="6" width="100%">${ffDto.name}<hr>
		<img src="${project}ff/${ffDto.location}" hidden="true">
		<div><a href="#view" onclick="loadmap('${project}ff/${ffDto.location}')">시설 위치 약도</a><br></div>
		</th>
	</tr>
	<tr>
		<th colspan="6">${ffDto.division} - ${ffDto.category}</th>
	</tr>
	<tr>
		<th> ${str_introduce} </th>
		<th colspan="5"> ${ffDto.introduce} </th>
	</tr>
	<tr>
		<th colspan="6">
			<img id="mainPanel" src="${project}ff/${img[0]}" style="
				width:80%;
				height:auto;
			">
		</th>
	</tr>
	<tr>
		<th colspan="6">
		<c:set var="num" value="1"/>
		<c:forEach var="tempimage" items="${img}">
			<img class="timg" src="${project}ff/${tempimage}" name="tpimg${num}" style="
				width:10%;
				height:auto;	
			">&nbsp;&nbsp;
			<c:set var="num" value="${num+1}"/>
		</c:forEach>
		</th>
	</tr>
	<tr>
		<th colspan="6">
			<input class="inputbutton" type="button" value="${btn_list}" onclick="location='ffList.do?pageNum=${pageNum}&division=${division}'">
		</th>
	</tr>
</table>

<script>	
	$('.timg').on(
		'click',function(event){
			$('#mainPanel').attr('src',$('img[name='+event.target.name+']').attr('src') );
		});
	
	function loadmap(location) {
		var img = new Image();
		img.src = location;
		var OpenWindow=window.open('','_blank', 'width='+img.width+', height='+img.height+', menubars=no, scrollbars=auto');
		OpenWindow.document.write("<style>body{margin:0px;padding:0px;}</style><img src='"+location+"' style='width:100%;height:auto;' onclick='window.close()'>");
	}
</script>