<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<%@ include file="setting.jsp"%>
<%@include file="/include/adminmainheader.jsp" %>
<%@include file="/include/adminmainnav.jsp" %>

<link href="${project}${location}style.css" rel="stylesheet" type="text/css">
<script src="${project}jquery-3.2.1.js"></script>

<aside>
<body>
	<form method="post" enctype="multipart/form-data" action="adminFFWritePro.do"
	 	name="writeform" onsubmit="hiddeninput()">

		<table>
			<tr>
				<th colspan="2" align="right">
					&nbsp;&nbsp;&nbsp;
				</th>
			</tr>
			<tr>
				<th> ${str_name} </th>
				<td>
					<input class="input" type="text" name="name"
						maxlength="50" style="width: 286px">
				</td>
			</tr>
			<tr>
				<th> ${str_subject} </th>
				<td>
					<input class="input" type="text" name="subject"
						maxlength="50" style="width: 286px">
				</td>
			</tr>
			<tr>
				<th> ${str_division} & ${str_category} </th>
				<td>
					<select id="division" onchange="divisionChange()">
						<option>시설구분</option>
						<option>식음시설</option>
						<option>부대시설</option>
					</select>
					<select id="category">
						<option>선택해주세요</option>
					</select>
				</td>
			</tr>
			<tr>
				<th> ${str_introduce} </th>
				<td>
					<textarea name="introduce" rows="10" cols="100" placeholder="시설에 대한 소개를 입력해주세요."></textarea>
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
					<input class="inputbutton" type="submit" value="${btn_write}">
					<input class="inputbutton" type="button" value="${btn_cancel}"
						onclick="location='adminFFList.do?pageNum=${pageNum}&division=${division}'">
				</th>
			</tr>
		</table>
		<div id="test"></div>
	</form>
</body>
</aside>
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

	function divisionChange() {
		var food = ["한식", "중식", "양식", "일식", "스낵"];
		var facility = ["안내", "의료", "수송", "편의", "판매"];
		var selectDivision = $('#division').val();
		var item;
		var test = document.getElementById( "test" );
		
		if( selectDivision == "식음시설" ) {
			item = food;
		} else if( selectDivision == "부대시설" ) {
			item = facility;
		}
		
		var all = $('#division option').length;
		
		if( all == 3 ) {
			$('#division option:first').remove();	
		}
		$('#category').empty();
		
		for( var i=0; i < item.length; i++ ) {
			var option = $("<option>"+item[i]+"</option>");
			$('#category').append(option);
		}
	}
	
	function hiddeninput() {
		var division = document.getElementById( "division" );
		var category = document.getElementById( "category" );
		var test = document.getElementById( "test" );
		test.innerHTML += "<input type='hidden' name='category' value='" + category.options[category.selectedIndex].text + "'>"
						+ "<input type='hidden' name='division' value='" + division.options[division.selectedIndex].text + "'>";
	}
	//-->
</script>
<%@include file="/include/mainfooter.jsp" %>