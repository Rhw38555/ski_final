<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<%@ include file="setting.jsp"%>
<%@include file="/include/adminmainheader.jsp"%>

<link href="${project}${location}style.css" rel="stylesheet" type="text/css">
<script src="${project}jquery-3.2.1.js"></script>

<body>
	<form method="post" enctype="multipart/form-data" action="adminFFModifyPro.do"
	 	name="writeform" onsubmit="hiddeninput()">
	
		<table>
			<tr>
				<th colspan="2" align="right">
					*기존 내용을 유지하시려는 곳은 비워두세요.&nbsp;&nbsp;&nbsp;
				</th>
			</tr>
			<tr>
				<th> ${str_name} </th>
				<td>
					<input class="input" type="text" name="name"
						maxlength="50" style="width: 286px" value="${ffDto.name}">
				</td>
			</tr>
			<tr>
				<th> ${str_subject} </th>
				<td>
					<input class="input" type="text" name="subject"
						maxlength="50" style="width: 286px" value="${ffDto.subject}">
				</td>
			</tr>
			<tr>
				<th> ${str_division} & ${str_category} </th>
				<td>
					${str_division} : ${ffDto.division}<br>
					${str_category} : ${ffDto.category}
				</td>
			</tr>
			<tr>
				<th> ${str_introduce} </th>
				<td>
					<textarea name="introduce" rows="10" cols="100" placeholder="시설에 대한 소개를 입력해주세요.">${ffDto.introduce}</textarea>
				</td>
			</tr>
			<tr>
				<th> ${str_location} </th>
				<td>
					<label><input type="file" name="location" accept="image/*"></label>
				</td>
			</tr>
			<tr>
				<th> ${str_thumbnail} </th>
				<td>
					<label><input type="file" name="thumbnail"></label>
				</td>
			</tr>
			<tr>
				<th> ${str_img} </th>
				<td>
					<input type="file" name="images[]" id="images" accept="image/*" multiple/><br>
					<label for="images"></label>
					<!-- <img id="imageP" style="width:100%"> -->
					<div id="result"></div>
				</td>
			</tr>
			<tr>
				<th colspan="2">	
					<input class="inputbutton" type="button" value="취소취소" onclick="location='adminFFList.do'">
					<input class="inputbutton" type="submit" value="${btn_write}">
					<input class="inputbutton" type="reset" value="리셋">
					
				</th>
			</tr>
		</table>
		<div id="test"></div>
	</form>
</body>

<script>
	//<!--
	// 업로드 이미지 미리보기
	
	function handleFileSelect() {
    //Check File API support
    if (window.File && window.FileList && window.FileReader) {
    	var img = "";
        var files = event.target.files; //FileList object
        var output = document.getElementById("result");

        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            img += file.name + "/";
            //Only pics
            if (!file.type.match('image')) continue;

            var picReader = new FileReader();
       
            picReader.addEventListener("load", function (event) {
                var picFile = event.target;
                var div = document.createElement("div");
                div.innerHTML = "<img class='thumbnail' src='" + picFile.result + "'" + "title='" + picFile.name + "' style='width:100%'/><br>";
                output.insertBefore(div, null);
            });
            //Read the image
            picReader.readAsDataURL(file);
        }
      	//Hidden value
        //$('writeform').append('<input type="hidden" name="img" value="'+img+'">');
   
      	var test = document.getElementById( "test" );
      	//test.innerHTML = img;
      	test.innerHTML += "<input type='hidden' name='img' value='" + img + "'>";
    } else {
	        console.log("Your browser does not support File API");
	    }
	}
	document.getElementById('images').addEventListener('change', handleFileSelect, false);
	
	$('#images').change(function () {
		 $('#result').empty();
		 //$('#test').empty(); // 재변경시 변경안될듯
	}); // end
	
	function hiddeninput() {
		var test = document.getElementById( "test" );
		test.innerHTML += "<input type='hidden' name='num' value='${num}'>";
	}
	
	function back(){
		var url = "adminFFList.do";
		return url;
	}
	//-->
</script>