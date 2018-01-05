/**
 * 회원관리
 */

var iderror = "아이디를 입력하세요";
var passwderror = "비밀번호를 입력하세요";
var repasswderror = "비밀번호가 다릅니다";
var nameerror = "이름을 입력하세요";
var telerror = "전화번호를 입력하세요";
var errortel = "전화번호를 다시한번 확인해 주세요";
var emailerror = "이메일을 입력하세요";
var erroremail = "이메일 형식에 맞지 않습니다";

var findIderror= "작성한 이메일이 존재하지않습니다.\n잠시 후 다시 시도하세요";
var findPasswderror = "아이디가 존재하지 않거나 이메일이 존재하지 않습니다.\n잠시 후 다시 시도하세요";
var findId = "이메일에 아이디를 보냈습니다.\n이메일을 확인해주세요.";
var findPasswd = "이메일에 패스워드를 보냈습니다.\n이메일을 확인해주세요.";	

var passwd_o = "사용할 수 있는 비밀번호입니다.";
var passwd_x = "영문자를 포함해주세요.";
var repasswd_o = "비밀번호가 같습니다.";
var repasswd_x = "비밀번호가 다릅니다. 다시한번 확인해 주세요";


var joinerror = "회원가입에 실패했습니다\n잠시 후 다시 시도하세요";
var confirmerror = "아이디 중복확인을 해주세요"; 
var loginiderror = "입력하신 아이디가 없습니다";
var loginpasserror = "입력하신 비밀번호가 다릅니다";
var deleteerror = "회원탈퇴에 실패했습니다\n잠시 후 다시 시도하세요";
var updateerror = "회원정보 수정에 실패했습니다\n잠시 후 다시 시도하세요";	

function erroralert( msg ) {
	alert( msg );
	history.back();
}

// 회원 정보 수정
function viewfocus() {
	viewform.passwd.focus();
}
function viewcheck() {
	if( ! viewform.passwd.value ) {
		alert( passwderror );
		viewform.passwd.focus();
		return false;
	} else if( viewform.passwd.value != viewform.repasswd.value ) {
		alert( repasswderror );
		viewform.repasswd.focus();
		return false;
	}
	if( viewform.email1.value || viewform.email2.value ) {
		if( ! viewform.email1.value || ! viewform.email2.value ) {
			alert( emailerror );
			viewform.email1.focus();
			return false;
		}
		if( viewform.email1.value.indexOf( "@" ) != -1 
		||	viewform.email2.value.indexOf( "@" ) != -1	) {
			alert( emailerror );
			viewform.email1.focus();
			return false;
		}
	}
	if( viewform.tel1.value 
			|| viewform.tel2.value
			|| veiwform.tel3.value ) {
		if( viewform.tel1.value.length < 3 
			|| viewform.tel2.value.length < 4 
			|| viewform.tel3.value.length < 4 ) {
			alert( telerror );
			viewform.tel1.focus();
			return false;			
		}		
	} 	
	
	
	
	// 이메일 란은 하나라도 값이 있으면 모두 값이 없으면 경고
	// 이메일 란은 두 칸 모드 @가 있으면 경고
}


// 회원 탈퇴
function passwdfocus() {
	passwdform.passwd.focus();
}
function passwdcheck() {
	if( ! passwdform.passwd.value ) {
		alert( passwderror );
		passwdform.passwd.focus();
		return false;
	}
}

//아이디 찾기
function idconfirm(){
   if( idform.email.value== '' ) {
      alert(emailerror);
      idform.email.focus();
      return false;
   }
   if(idform.email.value.indexOf( "@" ) == -1){
      alert(erroremail);
      idform.email.focus();
      return false;
   }
}

//비밀번호 찾기
function passwdconfirm(){
   if(passwdform.id.value == ''){
      alert(iderror);
      passwdform.id.focus();
      return false;
   }
   
   if( passwdform.email.value== '아이디를 입력해주세요(@주소포함)' ) {
      alert(emailerror1);
      passwdform.email.focus();
      return false;
   }
   if(passwdform.email.value.indexOf( "@" ) == -1){
      alert(emailerror2);
      passwdform.email.focus();
      return false;
   }
}
	
// 중복 확인
function idcheck() {
	var params = "id=" + joinform.id.value;
	sendRequest(idresult, "memberIdcheck.do", params);
}
function idresult() {
	var idchk = document.getElementById("idchk");
	if(request.readyState == 4) {
		if(request.status == 200) {
			idchk.innerHTML = request.responseText;
		} else {
			idchk.innerHTML = "에러발생";
		}
	} else {
		idchk.innerHTML = "통신중";
	}
}
function passwdcheck() {
	var passwd = joinform.passwd.value;
	var passwdchk = document.getElementById("passwdchk");
	if(isNaN(passwd)) {
		passwdchk.innerHTML = passwd_o;
	} else {
		passwdchk.innerHTML = passwd_x;
	}
}
function repasswdcheck() {
	var repasswd = joinform.repasswd.value;
	var passwd = joinform.passwd.value;
	var repasswdchk = document.getElementById("repasswdchk");
	if(passwd == repasswd) {
		repasswdchk.innerHTML = repasswd_o;
	} else {
		repasswdchk.innerHTML = repasswd_x;
	}
}

// 메인
function mainfocus() {
	mainform.id.focus();
}
function maincheck() {
	if( ! mainform.id.value ) {
		alert( iderror );
		mainform.id.focus();
		return false;
	} else if( ! mainform.passwd.value ) {
		alert( passwderror );
		mainform.passwd.focus();
		return false;
	} 
}

// 회원 가입
function joinfocus() {
	joinform.id.focus();
}
function joincheck() {
	if( ! joinform.id.value ) {
		alert( iderror );
		joinform.id.focus();
		return false;
	} else if( ! joinform.passwd.value ) {
		alert( passwderror );
		joinform.passwd.focus();
		return false;
	} else if( joinform.passwd.value != joinform.repasswd.value ) {
		alert( repasswderror );
		joinform.repasswd.focus();
		return false;
	} else if( ! joinform.name.value ) {
		alert( nameerror );
		joinform.name.focus();
		return false;
	} else if( ! joinform.tel1.value || ! joinform.tel2.value || ! joinform.tel3.value ) {
		alert( telerror );
		joinform.tel1.focus();
		return false;
							
	} else if( joinform.tel1.value.length < 3 || joinform.tel2.value.length < 3 || joinform.tel3.value.length < 4 ) {
		alert( errortel );
		joinform.tel1.focus();
		return false;
	} else if( ! joinform.email1.value || ! joinform.email2.value) {
		alert( emailerror );
		joinform.email1.focus();
		return false;
	}	else if( joinform.email1.value ) {
		if( joinform.email2.value == "0" ) {
			// 직접입력 
			if( joinform.email1.value.indexOf( "@" ) == -1 ) {
				// @가 없다
				alert( erroremail );
				joinform.email1.focus();
				return false;
			}			
		} else {
			// 선택입력
			if( joinform.email1.value.indexOf( "@" ) != -1 ) {
				// @가 없다
				alert( erroremail );
				joinform.email1.focus();
				return false;
			}
		}		
	}
}

function nexttel1() {
	if( joinform.tel1.value.length == 3 ) {
		joinform.tel2.focus();
	}
}
function nexttel2() {
	if( joinform.tel2.value.length == 4 ) {
		joinform.tel3.focus();
	}
}
function nextemail1() {
	if( joinform.tel3.value.length == 4 ) {
		joinform.email1.focus();
	}	
}
//이메일 인증
function confirmemail(){
	   var email="";
	   if(! joinform.email1.value){
	      alert( emailerror );
	      return false;
	   }else{
		   if(joinform.email2.value != 0) {
			   email = joinform.email1.value + "@" + joinform.email2.value;   			   
		   } else {
			   email= joinform.email1.value;   
		  }
		  var url = "memberEmailCheck.do?email="+email;
		  open(url, "confirmemail","scrollbars=no, menubar=no, status=no, width=300px, height=200px");
	   }   
	}

	function mailsubmit(submit){
	   if(mailform.textsub.value == submit){
	      opener.document.memberJoinForm.hiddenemail.value="1";
	      self.close();      
	   }
	}











