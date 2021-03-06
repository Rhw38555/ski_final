<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

<c:set var="project" value="/SKI_Final/"/>
<c:set var="folder" value="member/"/>

<c:set var="page_main" value="메인 페이지"/>
<c:set var="page_join" value="회 원 가 입"/>
<c:set var="page_confirm" value="아이디 중복 확인"/>
<c:set var="page_login" value="로 그 인"/>
<c:set var="page_delete" value="회 원 탈 퇴"/>
<c:set var="page_modify" value="정보 수정"/>
<c:set var="page_reservationConfirm" value="예약 확인"/>
<c:set var="page_UseHistory" value="사용 내역"/>

<c:set var="msg_btn_id" value="아이디를 잊으셨나요?"/>
<c:set var="msg_btn_passwd" value="비밀번호를 잊으셨나요?"/>

<c:set var="msg_main" value="비회원이시면 회원가입을 해주세요"/>
<c:set var="msg_join" value="회원 정보를 입력하세요"/>			
<c:set var="msg_id_o" value="는 사용할 수 없습니다"/>
<c:set var="msg_id_x" value="는 사용할 수 있습니다"/>
<c:set var="msg_login" value="로그인을 해주세요."/>
<c:set var="msg_loginmain" value="님 안녕하세요"/>			
<c:set var="msg_passwd" value="비밀번호를  입력해주세요"/>
<c:set var="msg_modifyview" value="수정할 정보를 입력하세요"/>

<c:set var="str_id" value="아이디"/>
<c:set var="str_passwd" value="비밀번호"/>
<c:set var="str_jumin" value="주민등록번호"/>
<c:set var="str_name" value="이름"/>
<c:set var="str_tel" value="전화번호"/>
<c:set var="str_email" value="이메일"/>
<c:set var="str_reg_date" value="가입일자"/>

<c:set var="btn_main" value="메인으로"/>
<c:set var="btn_confiremail" value="이메일 인증"/>
<c:set var="btn_mod" value="수정"/>
<c:set var="btn_mod_cancel" value="수정취소"/>
<c:set var="btn_del_cancel" value="탈퇴취소"/>
<c:set var="btn_del" value="탈퇴"/>
<c:set var="btn_logout" value="로그아웃"/>
<c:set var="btn_modify" value="정보수정"/>
<c:set var="btn_delete" value="회원탈퇴"/>
<c:set var="btn_ok" value="확인"/>
<c:set var="btn_ok_cancel" value="확인취소"/>
<c:set var="btn_login" value="로그인"/>
<c:set var="btn_cancel" value="취소"/>
<c:set var="btn_join" value="회원가입"/>
<c:set var="btn_in" value="가입"/>
<c:set var="btn_in_cancel" value="가입취소"/>
<c:set var="btn_confirm" value="중복확인"/>
<c:set var="btn_login_cancel" value="로그인취소"/>
<c:set var="btn_Reservation_modify" value="예약변경"/>
<c:set var="btn_Reservation_cancel" value="예약취소"/>
<c:set var="btn_mypage" value="마이페이지"/>
<c:set var="btn_adminmypage" value="관리페이지"/>

<c:set var="btn_winterPark" value="WinterPark"/>
<c:set var="btn_reservation" value="통합 예약"/>
<c:set var="btn_skioom" value="스키장소개 &콘도소개"/>
<c:set var="btn_eat" value="식음시설&부대시설"/>
<c:set var="btn_event" value="할인&이벤트"/>
<c:set var="btn_qa" value="고객센터"/>
