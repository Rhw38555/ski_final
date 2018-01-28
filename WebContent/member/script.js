/**
 * 
 */
var iderror = "아이디를 입력하세요";
var passwderror = "비밀번호를 입력하세요";
var repasswderror = "다시한번 입력해주세요";
var errorrepasswd = "비밀번호가 다릅니다";
var nameerror = "이름을 입력하세요";
var telerror = "전화번호를 입력하세요";
var errortel = "전화번호를 다시한번 확인해 주세요";
var telnumerror = "숫자만 입력해주세요";
var emailerror = "이메일을 입력하세요";
var erroremail = "이메일 형식에 맞지 않습니다";
var emailiconerror = "이메일 인증을 해주세요";

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

// 로그인폼(로그인)
function loginfocus() {
   loginform.id.focus();
}
function logincheck() {
   if( ! loginform.id.value ) {
      alert( iderror );
      loginform.id.focus();
      return false;
   } else if( ! loginform.passwd.value ) {
      alert( passwderror );
      loginform.passwd.focus();
      return false;
   } 
}
// 로그인폼(아이디 찾기)
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
// 로그인폼(비밀번호 찾기)
function passwdconfirm(){
   if(passwdform.id.value == ''){
      alert(iderror);
      passwdform.id.focus();
      return false;
   }
   if( passwdform.email.value== '' ) {
      alert(emailerror);
      passwdform.email.focus();
      return false;
   }
   if(passwdform.email.value.indexOf( "@" ) == -1){
      alert(erroremail);
      passwdform.email.focus();
      return false;
   }
}

//회원 가입
function joinfocus() {
   joinform.id.focus();
   shortemail.style.display = "none";
   shortemail2.style.display = "none";
}
function joincheck() {
   var tel1 = joinform.tel1.value;
   var tel2 = joinform.tel2.value;
   var tel3 = joinform.tel3.value;
   pattern="(?=.*\d)(?=.*[a-z]).{8,}";
   if( ! joinform.id.value ) {
      alert( iderror );
      joinform.id.focus();
      return false;
   } else if( ! joinform.passwd.value ) {
      alert( passwderror );
      joinform.passwd.focus();
      return false;
   } else if( ! joinform.repasswd.value ) {
      alert( repasswderror );
      joinform.repasswd.focus();
      return false;
   } else if( joinform.passwd.value != joinform.repasswd.value ) {
      alert( errorrepasswd );
      joinform.repasswd.focus();
      return false;
   } else if( ! joinform.name.value ) {
      alert( nameerror );
      joinform.name.focus();
      return false;
   } else if( ! tel1 || ! tel2 || ! tel3 ){
      alert( telerror );
      joinform.tel1.focus();
      return false;
   } else if( tel1.length < 3 || tel2.length < 4 || tel3.length < 4) {
      alert( errortel );
      joinform.tel1.focus();
      return false;
   } else if( isNaN(tel1) || isNaN(tel2) || isNaN(tel3)) {
      alert( telnumerror);
      joinform.tel1.value="";
      joinform.tel2.value="";
      joinform.tel3.value="";
      joinform.tel1.focus();
      return false;         
   } else if( shortemail.style.display == "none") {  //
      if( ! joinform.email0.value) {
         alert( emailerror );
         joinform.email0.focus();
         return false;
      } else if( joinform.email0.value.indexOf( "@" ) == -1 ) {
         // @가 없다
         alert( erroremail );
         joinform.email0.focus();
         return false;
      }   
   } else if( fullemail.style.display == "none") {  //
      if( ! joinform.email1.value) {
         alert( emailerror );
         joinform.email1.focus();
         return false;    
      } else if( joinform.email1.value.indexOf( "@" ) != -1 ) {
         // @가 있다
         alert( erroremail );
         joinform.email1.focus();
         return false;
      }   
   } /*
   if(joinform.hiddenemail.value != "1"){
      if(fullemail.style.display == "none") {
         alert( emailiconerror );
         joinform.email1.focus();
         return false;
      } else {
         alert( emailiconerror );
         joinform.email0.focus();
         return false;         
      }
   }*/
}

// 회원가입 포커스넘기기
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
function nextemail() {
   if( joinform.tel3.value.length == 4 ) {
      if(shortemail.style.display == "none") {
         joinform.email0.focus();
      } else {
         joinform.email1.focus();
      }
   }   
}

// 회원 가입 (중복 확인)
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

// 회원가입 (이메일 인증)
function chageLangSelect() {
   var Select = document.getElementById("select");
    var selectValue = Select.options[Select.selectedIndex].value;
    var fullemail = document.getElementById("fullemail");
    var shortemail = document.getElementById("shortemail");
    var shortemail2 = document.getElementById("shortemail2");
    
    if( selectValue != 0) {
       joinform.email2.value = selectValue;
       fullemail.style.display = "none";
       shortemail.style.display = "block";
       shortemail2.style.display = "block";
    } else {
       joinform.email2.value = "";
       shortemail.style.display = "none";
       shortemail2.style.display = "none";
       fullemail.style.display = "block";
    }
}   
// 회원가입 (이메일 인증창 열기)
function confirmemail(){
   var email="";
   if( shortemail.style.display == "none") {  //
      if( ! joinform.email0.value) {
         alert( emailerror );
         joinform.email0.focus();
         return false;
      } else if( joinform.email0.value.indexOf( "@" ) == -1 ) {
         // @가 없다
         alert( erroremail );
         joinform.email0.focus();
         return false;
      } else {
         email= joinform.email0.value; 
         var url = "memberEmailCheck.do?email="+email;
         open(url, "confirmemail","scrollbars=no, menubar=no, status=no, width=300px, height=200px");
      }
   } else if( fullemail.style.display == "none") {  //
      if( ! joinform.email1.value) {
         alert( emailerror );
         joinform.email1.focus();
         return false;    
      } else if( joinform.email1.value.indexOf( "@" ) != -1 ) {
         // @가 있다
         alert( erroremail );
         joinform.email1.focus();
         return false;
      } else {
         email = joinform.email1.value + joinform.email2.value;
         var url = "memberEmailCheck.do?email="+email;
         open(url, "confirmemail","scrollbars=no, menubar=no, status=no, width=300px, height=200px");
      }
   }
}
// 회원가입 (이메일 인증창 닫기)
function mailsubmit(submit){
   if(mailform.textsub.value == submit){
      opener.document.joinform.hiddenemail.value="1";
      self.close();      
   }
}

// 회원 정보 수정

function viewfocus() {
   joinform.passwd.focus();
   shortemail.style.display = "none";
   shortemail2.style.display = "none";
}

function viewcheck() {
   var tel1 = joinform.tel1.value;
   var tel2 = joinform.tel2.value;
   var tel3 = joinform.tel3.value;
   if( ! joinform.passwd.value ) {
      alert( passwderror );
      joinform.passwd.focus();
      return false;
   } else if( joinform.passwd.value != joinform.repasswd.value ) {
      alert( repasswderror );
      joinform.repasswd.focus();
      return false;
   }
   if( ! joinform.tel1.value || ! joinform.tel2.value || ! joinform.tel3.value ){
      alert( telerror );
      joinform.tel1.focus();
      return false;
   } else if( joinform.tel1.value.length < 3 || joinform.tel2.value.length < 4 || joinform.tel3.value.length < 4) {
      alert( errortel );
      joinform.tel1.focus();
      return false;
   } else if( isNaN(tel1) || isNaN(tel2) || isNaN(tel3)) {
      alert( telnumerror);
      joinform.tel1.value="";
      joinform.tel2.value="";
      joinform.tel3.value="";
      joinform.tel1.focus();
      return false;         
   }
   if(joinform.hiddenemailvalue.value == joinform.email0.value) {
      document.joinform.hiddenemail.value="1";
   }else if(joinform.hiddenemailvalue.value != joinform.email0.value) {
      document.joinform.hiddenemail.value="0";
      if( shortemail.style.display == "none") {  //
         if( ! joinform.email0.value) {
            alert( emailerror );
            joinform.email0.focus();
            return false;
         } else if( joinform.email0.value.indexOf( "@" ) == -1 ) {
            // @가 없다
            alert( erroremail );
            joinform.email0.focus();
            return false;
         }   
      } else if( fullemail.style.display == "none") {  //
         if( ! joinform.email1.value) {
            alert( emailerror );
            joinform.email1.focus();
            return false;    
         } else if( joinform.email1.value.indexOf( "@" ) != -1 ) {
            // @가 있다
            alert( erroremail );
            joinform.email1.focus();
            return false;
         }   
      }
   }   
   if(joinform.hiddenemail.value != "1"){
      if(fullemail.style.display == "none") {
         alert( emailiconerror );
         joinform.email1.focus();
         return false;
      } else {
         alert( emailiconerror );
         joinform.email0.focus();
         return false;         
      }
   }
}

// 회원 탈퇴

function passwdfocus() {
   delpasswdform.passwd.focus();
}

function delpasswdcheck() {
   if( ! delpasswdform.passwd.value ) {
      alert( passwderror );
      delpasswdform.passwd.focus();
      return false;
   }
}




function adminBarcodeAccountCheck(){
   if(!inputform.productsPrice.value || !inputform.userPrice.value || !inputform.calPrice.value){
      alert("값들을 입력하세요");
      return false;
   }else if(Number(inputform.userPrice.value) < Number(inputform.productsPrice.value) ){
      alert("고객의 돈이 부족합니다");
      return false;
   }
}

function adminBarcodeRefundCheck(){
   if(!inputform.productsPrice.value || !inputform.userPrice.value || !inputform.calPrice.value){
      alert("값들을 입력하세요");
      return false;
   }else if(Number(inputform.userPrice.value) == Number(inputform.calPrice.value) ){
      alert("환불할 물품을 선택하세요");
      return false;
   }
}

function generateBarcode(user_barcode) {
    
    var value = user_barcode;
    var btype = "code128";
    var renderer ="css";
    
   var quietZone = false;
    if ($("#quietzone").is(':checked') || $("#quietzone").attr('checked')){
      quietZone = true;
    }
   
    var settings = {
      output:renderer,
      bgColor: "#FFFFFF",
      color: "#000000",
      barWidth: "1",
      barHeight: "50",
      moduleSize: "5",
      posX: "10",
      posY: "20",
      addQuietZone: "1"
    };
    if ($("#rectangular").is(':checked') || $("#rectangular").attr('checked')){
        value = {code:value, rect: true};
      }
      if (renderer == 'canvas'){
        clearCanvas();
        $("#barcodeTarget").hide();
        $("#canvasTarget").show().barcode(value, btype, settings);
      } else {
        $("#canvasTarget").hide();
        $("#barcodeTarget").html("").show().barcode(value, btype, settings);
      }
  }

// 바코드
function memberUseHistoryCheck(user_barcode) {
   $.ajax(
         {
            type : "POST",
            url : "memberUseHistoryCheck.do",
            /*data : params,*/
            data : {
               value : user_barcode
            },
            
            //data : $('form').serialize(),
            dataType : 'xml',
            success : function(data){
               
               //var code = $(data).find('code').text();
               var codeconfrim = $(data).find('code').text();
               if(codeconfrim=='success'){
                  var memberdata = eval("("+$(data).find('data').text()+")");
                  var calPrice=0;
                  msg ="<tr><th>영수증 바코드</th><th>상품 이름</th><th>상품 가격</th><th>상품 개수</th><th>마켓명</th><th>구매일</th></tr>"
                  
                  for(var i=0; i<memberdata.member.length;i++){
                  msg+="<tr>"
                     +"<td>"
                     + memberdata.member[i].receipt_barcode
                     +"</td>"
                     +"<td>"
                     + memberdata.member[i].product_name
                     +"</td>"
                     +"<td>"
                     + memberdata.member[i].product_price
                     +"</td>"
                     +"<td>"
                     + memberdata.member[i].product_count
                     +"</td>"
                     +"<td>"
                     + memberdata.member[i].maket
                     +"</td>"
                     +"<td>"
                     + memberdata.member[i].buydate
                     +"</td>"
                     +"</tr>";
                     
                     calPrice += Number(memberdata.member[i].product_price) * Number(memberdata.member[i].product_count);
                  }
                  msg+="<tr>"
                     +"<th colspan='6'>"
                     +"총 가격 : " + calPrice;
                     +"</th>"
                     +"</tr>";
                     
                  $('#findtr').append($('#findtr').text()+msg);   
               }//success
               getCurrentUserPrice();
               
               
            },
            error : function(e){
               event.target.value="";
            }
            
         }      
      );//ajax
}


var calPrice = 0;
function memberReserveCheck(memId){
   $.ajax(
   {
      type : "POST",
      url : "memberReservationCheck.do",
      /*data : params,*/
      data : {
         value : memId
      },
      
      //data : $('form').serialize(),
      dataType : 'xml',
      success : function(data){         
         //var code = $(data).find('code').text();
         var codeconfrim = $(data).find('code').text();
         if(codeconfrim=='success'){
            var memberdata = eval("("+$(data).find('data').text()+")");
            
            roomlength = memberdata.member.length;
            makeRoomTable(memberdata);
            //alert(roomlength);         
            skilength = memberdata.member2.length;
            makeSkiTable(memberdata);
            
            if(roomlength == 0){
            	$('#noroom').val(1);
            	$('#notable').css('display','');
            }
            if(skilength == 0){
            	$('#noski').val(1);
            }
         }//success
         
      },
      error : function(e){
         event.target.value="";
      }
   }      
);//ajax
}
var roomlength = 0;
var roomnum = 0;
var roomfirstcheck = 0;
var roomicheck = 0;
var roommsg = "";

function makeRoomTable(memberdata){
   for(var i=0; i<memberdata.member.length; i++){
      if(roomnum == memberdata.member[i].num){   // 같은 테이블
         makeRoomTable2(memberdata,i,1);
         //alert("같은 테이블 : "+i+"/"+roomnum);
      }else{                              // 테이블 새로 생성
         makeRoomTable2(memberdata,i,0);
         //alert("다른 테이블 : "+i+"/"+roomnum);
      }
   }
}

function makeRoomTable2(memberdata,i,numcheck){
   
   roomnum = memberdata.member[i].num;
   //alert(roomnum);
   
   if(numcheck == 1){      //같은 테이블 내용 붙이기
      roommsg += "<tr>"
            +  "   <th>"+ (memberdata.member[i].room_date).substring(0,11) + "</th>"
            +  "   <td>"+ memberdata.member[i].room_2 +"</td>"
            +  "   <td>"+memberdata.member[i].room_4+"</td>"
            +  "   <td>"+memberdata.member[i].room_8+"</td>"
            +  "</tr>";      
      if(roomlength-1 == i){
         roommsg += "<tr>"
            +  "	<th> 이름 </th>"
            +  "	<td colspan='3'>"+ memberdata.member[roomicheck].name +" </td>"
            +  "</tr>"
            +  "<tr>"
            +  "	<th> 전화번호 </th>"
            +  "	<td colspan='3'>"+ memberdata.member[roomicheck].tel +"</td>"
            +  "</tr>"            
            +  "<tr>"
            +  "	<th> 차량번호 </th>"
            +  "	<td colspan='3'>"+ memberdata.member[roomicheck].carnum +"</td>"
            +  "</tr>"
            +  "<tr>"
            +  "   <td colspan='4'>"
            +  "      <a href='reverseChangeRoomForm.do?num="+memberdata.member[roomicheck].num+"'>예약변경"
            +  "      <a href='javascript:deleteReverseRoom("+memberdata.member[roomicheck].num+");'>예약취소"
            +  "   </td>"
            +  "</tr>"
            +  "</table>"
            +  "</div>";
         $(roommsg).appendTo('#findtr');
      }
   }else{               //테이블 새로 생성
      if(roomfirstcheck == 0){
         roommsg += "<div class='tablebox'>"
               +  "<table border='1' class='recheck'>"
               +  "<tr>"
               +  "<thead>"
               +  "   <th  colspan='4'> 결제번호 : "+ memberdata.member[i].num +"</th>"
               +  "</tr>"   
               +  "</thead>"
               +  "<tr>"   
               +  "   <th> 총 가격 </th>"      
               +  "   <td colspan='3'> "+ memberdata.member[i].room_price +"</td>"      
               +  "</tr>"
               +  "<tr>"
               +  "   <th>체크인/체크아웃</th>"
               +  "   <td colspan='3'>"+memberdata.member[i].room_check+"</td>"
               +  "</tr>"
               +  "<tr>"   
               +  "   <th> 날짜 </th>"      
               +  "   <td> 2인실 </td>"      
               +  "   <td> 4인실 </td>"      
               +  "   <td> 8인실 </td>"      
               +  "</tr>"
               +  "<tr>"
               +  "   <th>"+ (memberdata.member[i].room_date).substring(0,11) + "</th>"
               +  "   <td>"+ memberdata.member[i].room_2 +"</td>"
               +  "   <td>"+memberdata.member[i].room_4+"</td>"
               +  "   <td>"+memberdata.member[i].room_8+"</td>"
               +  "</tr>";
            roomfirstcheck = 1;
            roomicheck = i;
      }else{
         roommsg += "<tr>"
               +  "		<th> 이름 </th>"
               +  "		<td colspan='3'>"+ memberdata.member[roomicheck].name +" </td>"
               +  "</tr>"
               +  "<tr>"
               +  "		<th> 전화번호 </th>"
               +  "		<td colspan='3'>"+ memberdata.member[roomicheck].tel +"</td>"
               +  "</tr>"
               +  "<tr>"
               +  "		<th> 차량번호 </th>"
               +  "		<td colspan='3'>"+ memberdata.member[roomicheck].carnum +"</td>"
               +  "</tr>"
               +  "<tr>"
               +  "   <td colspan='4'>"
               +  "      <a href='reverseChangeRoomForm.do?num="+memberdata.member[roomicheck].num+"'>예약변경"
               +  "      <a href='javascript:deleteReverseRoom("+memberdata.member[roomicheck].num+");'>예약취소"
               +  "   </td>"
               +  "</tr>"
               +  "</table>";
            $(roommsg).appendTo('#findtr');
            roommsg = "";
         //if(roomlength-1 != i){
            roommsg += "<div class='tablebox'>"
                  +  "<table border='1' class='recheck'>"
                  +  "<thead>"
                  +  "<tr>"
                  +  "   <th  colspan='4'> 결제번호 : "+ memberdata.member[i].num +"</th>"
                  +  "</tr>"   
                  +  "</thead>"
                  +  "<tr>"   
                  +  "   <th> 총 가격 </th>"      
                  +  "   <td colspan='3'> "+ memberdata.member[i].room_price +"</td>"      
                  +  "</tr>"   
                  +  "<tr>"
                  +  "   <th>체크인/체크아웃</th>"
                   +  "   <td colspan='3'>"+memberdata.member[i].room_check+"</td>"
                  +  "</tr>"
                  +  "<tr>"   
                  +  "   <th> 날짜 </th>"      
                  +  "   <td> 2인실 </td>"      
                  +  "   <td> 4인실 </td>"      
                  +  "   <td> 8인실 </td>"      
                  +  "</tr>"
                  +  "<tr>"
                  +  "   <th>"+ (memberdata.member[i].room_date).substring(0,11) + "</th>"
                  +  "   <td>"+ memberdata.member[i].room_2 +"</td>"
                  +  "   <td>"+memberdata.member[i].room_4+"</td>"
                  +  "   <td>"+memberdata.member[i].room_8+"</td>"
                  +  "</tr>";
               roomicheck = i;
         //}         
      }
   }   
}


var skilength = 0;
var skinum = 0;
var skifirstcheck = 0;
var skiicheck = 0;
var skimsg = "";

function makeSkiTable(memberdata){
   for(var i=0; i<memberdata.member2.length; i++){
      if(skinum == memberdata.member2[i].num){   // 같은 테이블
         makeSkiTable2(memberdata,i,1);
         //alert("같은 테이블 : "+i);
      }else{                              // 테이블 새로 생성
         makeSkiTable2(memberdata,i,0);
         //alert("다른 테이블 : "+i);
      }
   }
}

function makeSkiTable2(memberdata,i,numcheck){
   
   skinum = memberdata.member2[i].num;
   
   if(numcheck == 1){      //같은 테이블 내용 붙이기
      skimsg += "<tr>"
            +  "   <th>"+ (memberdata.member2[i].ski_date).substring(0,11) + "</th>"
            +  "   <td>"+ memberdata.member2[i].ski_morning +"</td>"
            +  "   <td>"+memberdata.member2[i].ski_night+"</td>"
            +  "   <td>"+memberdata.member2[i].ski_day+"</td>"
            +  "</tr>";   
      if(skilength-1 == i){
         skimsg += "<tr>"
            +  "	<th> 이름 </th>"
            +  "	<td colspan='3'>"+ memberdata.member2[skiicheck].name +" </td>"
            +  "</tr>"
            +  "<tr>"
            +  "	<th> 전화번호 </th>"
            +  "	<td colspan='3'>"+ memberdata.member2[skiicheck].tel +"</td>"
            +  "</tr>"
            +  "<tr>"
            +  "	<th> 차량번호 </th>"
            +  "	<td colspan='3'>"+ memberdata.member2[skiicheck].carnum +"</td>"
            +  "</tr>"
            +  "<tr>"
            +  "   <td colspan='4'>"
            +  "      <a href='reverseChangeSkiForm.do?num="+memberdata.member2[skiicheck].num+"'>예약변경"
            +  "      <a href='javascript:deleteReverseSki("+memberdata.member2[skiicheck].num+");'>예약취소"
            +  "   </td>"
            +  "</tr>"
            +  "</table>";
         $(skimsg).appendTo('#findtr2');
      }
   }else{               //테이블 새로 생성
      if(skifirstcheck == 0){
         skimsg += "<div class='tablebox'>"
               +  "<table border='1' class='recheck'>"
               +  "<thead>"
               +  "<tr>"
               +  "   <th  colspan='4'> 결제번호 : "+ memberdata.member2[i].num +"</th>"
               +  "</tr>"   
               +  "</thead>"
               +  "<tr>"   
               +  "   <th> 총 가격 </th>"      
               +  "   <td colspan='3'> "+ memberdata.member2[i].ski_price +"</td>"      
               +  "</tr>"
               +  "<tr>"   
               +  "   <th> 날짜 </th>"      
               +  "   <td> 오전권 </td>"      
               +  "   <td> 야간권 </td>"      
               +  "   <td> 종일권 </td>"      
               +  "</tr>"
               +  "<tr>"
               +  "   <th>"+ (memberdata.member2[i].ski_date).substring(0,11) + "</th>"
               +  "   <td>"+ memberdata.member2[i].ski_morning +"</td>"
               +  "   <td>"+memberdata.member2[i].ski_night+"</td>"
               +  "   <td>"+memberdata.member2[i].ski_day+"</td>"
               +  "</tr>";
            skifirstcheck = 1;
            skiicheck = i;
      }else{
         skimsg += "<tr>"
               +  "		<th> 이름 </th>"
               +  "		<td colspan='3'>"+ memberdata.member2[skiicheck].name +" </td>"
               +  "</tr>"
               +  "<tr>"
               +  "		<th> 전화번호 </th>"
               +  "		<td colspan='3'>"+ memberdata.member2[skiicheck].tel +"</td>"
               +  "</tr>"
               +  "<tr>"
               +  "		<th> 차량번호 </th>"
               +  "		<td colspan='3'>"+ memberdata.member2[skiicheck].carnum +"</td>"
               +  "</tr>"
               +  "<tr>"
               +  "   <td colspan='4'>"
               +  "      <a href='reverseChangeSkiForm.do?num="+memberdata.member2[skiicheck].num+"'>예약변경"
               +  "      <a href='javascript:deleteReverseSki("+memberdata.member2[skiicheck].num+");'>예약취소"
               +  "   </td>"
               +  "</tr>"
               +  "</table>"
               +  "</div>";
         
            $(skimsg).appendTo('#findtr2');
            skimsg = "";
         //if(skilength-1 != i){
            skimsg += "<div class='tablebox'>"
                  +  "<table border='1' class='recheck'>"
                   +  "<thead>"
                  +  "<tr>"
                  +  "   <th  colspan='4'> 결제번호 : "+ memberdata.member2[i].num +"</th>"
                  +  "</tr>"   
                  +  "</thead>"
                  +  "<tr>"   
                  +  "   <th> 총 가격 </th>"      
                  +  "   <td colspan='3'> "+ memberdata.member2[i].ski_price +"</td>"      
                  +  "</tr>"   
                  +  "<tr>"   
                  +  "   <th> 날짜 </th>"      
                  +  "   <td> 오전권 </td>"      
                  +  "   <td> 야간권 </td>"      
                  +  "   <td> 종일권 </td>"      
                  +  "</tr>"
                  +  "<tr>"
                  +  "   <th>"+ (memberdata.member2[i].ski_date).substring(0,11) + "</th>"
                  +  "   <td>"+ memberdata.member2[i].ski_morning +"</td>"
                  +  "   <td>"+memberdata.member2[i].ski_night+"</td>"
                  +  "   <td>"+memberdata.member2[i].ski_day+"</td>"
                  +  "</tr>";
               skiicheck = i;
         //}         
      }
   }   
}

function showroom(){
   $('#roomcheck').css('display','');
   $('#skicheck').css('display','none');
   $('.roomcheck_a').css('color','orange');
   $('.skicheck_a').css('color','gray');
   if($('#noroom').val() == 1){
	   $('#notable').css('display','');
   }else{
	   $('#notable').css('display','none');
   }
}

function showski(){
   $('#roomcheck').css('display','none');
   $('#skicheck').css('display','');
   $('.roomcheck_a').css('color','gray');
   $('.skicheck_a').css('color','orange');
   if($('#noski').val() == 1){
	   $('#notable').css('display','');
   }else{
	   $('#notable').css('display','none');
   }
}


function deleteReverseRoom(num){
      if(confirm("예약을 취소하시겠습니까?")==true){
         location.href="memberReservationConfirmPro.do?num="+num+"&check="+0;
      }else{
         return;
      }
   }

   function deleteReverseSki(num){
      if(confirm("예약을 취소하시겠습니까?")==true){
         location.href="memberReservationConfirmPro.do?num="+num+"&check="+1;
      }else{
         return;
      }
   }
   function userBarcodeCharge(){
      var price = inputPrice.price.value;
      if(confirm("충전 하시겠습니까?")==true){
         location.href="memberUseHistoryPro.do?price="+price;
      }else{
         return;
      }
   }
   function getCurrentUserPrice() {
      $.ajax(
            {
               type : "POST",
               url : "userBarcode2.do",
               /*data : params,*/
               data : {
                  value : inputPrice.hiddenId.value
               },
               
               //data : $('form').serialize(),
               dataType : 'xml',
               success : function(data){
                  
                  //var code = $(data).find('code').text();
                  var codeconfrim = $(data).find('code').text();
                  if(codeconfrim=='success'){
                     var memberdata = eval("("+$(data).find('data').text()+")");
                     inputPrice.currentPrice.value= memberdata.member[0].wallet;
                  }else{
                     inputPrice.currentPrice.value=0;
                  }
                  
                  
               },
               error : function(e){
                  event.target.value="";
               }
               
            }      
         );
   }
   
   
   
   