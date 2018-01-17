/**
 * 게시판
 */

var subjecterror = "글제목을 입력하세요";
var contenterror = "글내용을 입력하세요";

var writeerror = "글작성에 실패했습니다\n잠시 후 다시 시도하세요";
var deleteerror = "글삭제에 실패했습니다\n잠시 후 다시 시도하세요";
var modifyerror = "글수정에 실패했습니다\n잠시 후 다시 시도하세요";

function erroralert( msg ) {
	alert( msg );
	history.back();
}

function modifyfocus() {
	modifyform.subject.focus();
}
function modifycheck() {
	if( ! modifyform.subject.value ) {
		alert( subjecterror );
		modifyform.subject.focus();
		return false;
	} else if( ! modifyform.content.value ) {
		alert( contentterror );
		modifyform.content.focus();
		return false;
	}
}

function writefocus() {
	writeform.subject.focus();
}
function writecheck() {
	 if( ! writeform.subject.value ) {
		alert( subjecterror );
		writeform.subject.focus();
		return false;
	} else if( ! writeform.content.value ) {
		alert( contenterror );
		writeform.content.focus();
		return false;
	} 	
}








