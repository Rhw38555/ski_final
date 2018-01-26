<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<%@include file="/include/mainheader2.jsp"%>
<script src="${project}jquery-3.2.1.js"></script>
<style>
	.form-around{
		align: center;
	}
	.form-subject{
		margin-left: 34.6%;
	}
	.form-content{
		margin-left: 34.6%;
	}
	.form-button{
		text-align: center;
	}
	.qna_sub{
		
	}
	input[type=text] {
    width: 50%;
    padding: 12px 20px;
    margin: 8px 0;
    
    box-sizing: border-box;
    border: 3px solid #ccc;
    -webkit-transition: 0.5s;
    transition: 0.5s;
    outline: none;
	}
	
	input[type=text]:focus {
	    border: 3px solid #555;
	}
	textarea{
		width: 50%;
	    padding: 12px 20px;
	    margin: 8px 0;
	    resize: none;
	    box-sizing: border-box;
	    border: 3px solid #ccc;
	    -webkit-transition: 0.5s;
	    transition: 0.5s;
	    outline: none;
	}
	textarea:focus {
		border: 3px solid #555;
	}
</style>
<script type="text/javascript">
	//<!--
	function writecheck() {
		if( ! writeform.subject.value ) {
			//$('input[type=text]').css('border', '3px solid red');
			$('.qna_sub').focus();
			return false;
		} else if( !writeform.content.value ) {
			//$('textarea').css('border', '3px solid red');
			$('.qna_con').focus();
			return false;
		}
	}
	//-->
</script>
<body>
	<form method="post" action="qnaWritePro.do"
	 	name="writeform" onsubmit="return writecheck()">
		<div class="form-around">
			<div class="form-subject">
				<input type="text" name="subject" class="qna_sub" maxlength="50"
				placeholder="${str_subject}">
			</div>
			<div class="form-content">
				<textarea name="content" rows="15" cols="60" class="qna_con"
				placeholder="${str_content}"></textarea>
			</div>
			<div class="form-button">
				<input class="inputbutton" type="submit" value="${btn_write}">
				<input class="inputbutton" type="button" value="${btn_cancel}"
					onclick="location='qnaList.do'">
			</div>
		</div>	
	</form>
</body>