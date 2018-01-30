<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<%@include file="/include/adminmainheader.jsp"%>

<link href="${project}${location}style.css" rel="stylesheet" type="text/css">
<script src="${project}jquery-3.2.1.js"></script>
<script type="text/javascript">
	//<!--
	function writecheck() {
		if( ! writeform.subject.value ) {
			writeform.subject.focus();
			return false;
		} else if( ! writeform.image.value ) {
			writeform.image.focus();
			return false;
		} else if( ! writeform.timage.value ) {
			writeform.timage.focus();
		}
	}
	//-->
</script>

<body>
	<form method="post" enctype="multipart/form-data" action="adminEventWritePro.do"
	 	name="writeform" onsubmit="return writecheck()">

		<table>
			<tr>
				<th colspan="2" align="right">
					&nbsp;&nbsp;&nbsp;
				</th>
			</tr>
			<tr>
				<th> ${str_subject} </th>
				<td>
					<input class="input" type="text" name="subject"
						maxlength="50" style="width: 286px">
				</td>
			</tr>
			<tr>
				<th> ${str_img} </th>
				<td>
					<input type="file" name="timage" accept="image/*"/><br>
					<input type="file" name="image" id="image" accept="image/*"	/><br>
					<label for="image"></label>
					<div id="imageP"></div>
				</td>
			</tr>
			<tr>
				<th colspan="2">	
					<input class="inputbutton" type="submit" value="${btn_write}">
					<input class="inputbutton" type="button" value="${btn_cancel}"
						onclick="location='adminEventList.do'">
				</th>
			</tr>
		</table>	
	</form>
</body>

<script>
	//<!--
	// 업로드 이미지 미리보기
	$('#image').change(function() {
		readImgUrlAndPreview(this);
		function readImgUrlAndPreview(input){
			if (input.files && input.files[0]) {
		    	var reader = new FileReader();
		        reader.onload = function (e) {			            	
		        	var imageP = document.getElementById( "imageP" );
		        	imageP.innerHTML = "<br><img src='"+e.target.result+"' style='width:100%;'>";
				}
		    };
		reader.readAsDataURL(input.files[0]);
		}	
	});
	//-->
</script>

<%@include file="/include/mainfooter.jsp" %>